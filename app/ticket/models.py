from django.db import models
from django.utils.translation import ugettext_lazy as _
from django.conf import settings

TICKET_STATUS_NEW = 'new'
TICKET_STATUS_PROGRESS = 'pro'
TICKET_STATUS_FINISHED = 'fin'
TICKET_STATUS_TESTING = 'tes'
TICKET_STATUS_WONTFIX = 'wfx'

TICKET_STATUS_CHOICES = (
    (TICKET_STATUS_NEW, _('New')),
    (TICKET_STATUS_PROGRESS, _('In porgress')),
    (TICKET_STATUS_FINISHED, _('Finished')),
    (TICKET_STATUS_TESTING, _('Testing')),
    (TICKET_STATUS_WONTFIX, _('Wont fix'))
)


# Create your models here.
class Ticket(models.Model):
    class Meta:
        verbose_name = ("Ticket")
        verbose_name_plural = _("Tickets")

    title = models.CharField(max_length=128, verbose_name=_("Title of the ticket")) 

    description = models.TextField(verbose_name=_("Description of the ticket"))

    status = models.CharField(
        max_length=3,
        choices=TICKET_STATUS_CHOICES,
        default=TICKET_STATUS_NEW,
        verbose_name=_("What is the status of the ticket")
    )

    assigned_to = models.ManyToManyField(
        settings.AUTH_USER_MODEL,
        verbose_name=_("Who is responsible for the ticket")
    )

    def __str__(self):
        return "Ticket {id}: {title}".format(
            id=self.id, title=self.title
        )