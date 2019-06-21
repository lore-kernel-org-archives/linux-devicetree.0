From: Alan Cooper <alcooperx@gmail.com>
Subject: Re: [PATCH 6/6] usb: bdc: Update compatible match strings
Date: Fri, 21 Jun 2019 09:47:53 -0400
Message-ID: <CAOGqxeWric9HkUGCJ9fKPh73Y6Do=wJnOjhubucqN6Qd006ExQ@mail.gmail.com>
References: <1561064991-16874-1-git-send-email-alcooperx@gmail.com>
 <1561064991-16874-7-git-send-email-alcooperx@gmail.com> <facac509-1e64-e35b-ee25-5ba265a514c4@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <facac509-1e64-e35b-ee25-5ba265a514c4@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: ": Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, USB list <linux-usb@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

> > Remove "brcm,bdc-v0.16" because it was never used on any system.
>
>     You're not really removing it, are you?

Whoops, it was supposed to be removed.
Thanks
Al

On Fri, Jun 21, 2019 at 4:28 AM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
>
> Hello!
>
> On 21.06.2019 0:09, Al Cooper wrote:
>
> > Remove "brcm,bdc-v0.16" because it was never used on any system.
>
>     You're not really removing it, are you?
>
> > Add "brcm,bdc-udc-v3.1" which exists for any STB system with BDC.
> >
> > Signed-off-by: Al Cooper <alcooperx@gmail.com>
> > ---
> >   drivers/usb/gadget/udc/bdc/bdc_core.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
> > index 15e28790142d..e2b2628925e6 100644
> > --- a/drivers/usb/gadget/udc/bdc/bdc_core.c
> > +++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
> > @@ -644,6 +644,7 @@ static SIMPLE_DEV_PM_OPS(bdc_pm_ops, bdc_suspend,
> >               bdc_resume);
> >
> >   static const struct of_device_id bdc_of_match[] = {
> > +     { .compatible = "brcm,bdc-udc-v3.1" },
> >       { .compatible = "brcm,bdc-v0.16" },
> >       { .compatible = "brcm,bdc" },
> >       { /* sentinel */ }
>
> MBR, Sergei
