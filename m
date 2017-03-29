From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/3] mailbox: Add iProc mailbox controller driver
Date: Wed, 29 Mar 2017 10:06:41 +0530
Message-ID: <CABb+yY31oW09-fq_t4V6vatMe50Ed2Mi00kT4bOJv2=qFBT+QA@mail.gmail.com>
References: <1485463082-27067-1-git-send-email-jonathan.richardson@broadcom.com>
 <1485463082-27067-3-git-send-email-jonathan.richardson@broadcom.com>
 <CABb+yY0rmAFutskhVkQ926QfsvtJ-WnXrQc=+PQNg=7NZEXC+Q@mail.gmail.com>
 <09177a6f-0612-1e17-a12e-0b1969f5b2e1@broadcom.com> <CABb+yY1o7QTYLm3HGWNeFDPnfpL7AAJ6+R91Stn-gNvO7afxoA@mail.gmail.com>
 <22d07bb1-9e93-4ae5-7215-923bde9ebfe5@broadcom.com> <CABb+yY1kbFOKJPO95SRw995zt=fCoA+SkXgECOj774i_hJUCNg@mail.gmail.com>
 <0e8ac72a-6b2f-171d-41e7-7a6cefc4c7c4@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0e8ac72a-6b2f-171d-41e7-7a6cefc4c7c4-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Vikram Prakash <vikram.prakash-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 28, 2017 at 11:00 PM, Jonathan Richardson
<jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> On 17-03-15 10:30 AM, Jassi Brar wrote:

>> The right way to do is have a 'server/owner' client that accepts
>> requests from various clients and serially queue them to mailbox. That
>> way you can keep the controller driver free from quirks (like max wait
>> time of 30us) of your present platform.
>
> Do you mean 1 mailbox client with one mailbox channel that all the mbox client drivers share?
> I thought this would work when I suggested it previously but the client callbacks are necessary
> in all txdone modes. Client drivers that send the messages need the callbacks
>
That's a legit requirement.

> and this is only possible with multiple mbox clients.
>
That is incorrect.
It is trivial to support callbacks to end clients from your common
code... just ask for callback along with the message to be submitted
to mailbox api.

> And a channel can only have 1 mbox client. Clients in multiple drivers need the callbacks to either know when to start polling, or be notified when the transaction is complete. It would be nice if multiple clients could use the same channel.
>
We had to choose from shared vs exclusive access to channels... latter
was chosen because there are ways to still support former.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
