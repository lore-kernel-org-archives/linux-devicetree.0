From: Manish Narani <manish.narani-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC PATCH] usb: dwc3: add support for OTG driver compilation
Date: Thu, 5 Jan 2017 05:27:22 +0000
Message-ID: <B2EF86ADE403CA4A85AF1BE1D3A22A06DB2CED@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1483536181-22356-1-git-send-email-mnarani@xilinx.com>
 <1483536181-22356-2-git-send-email-mnarani@xilinx.com>
 <87r34jvtn5.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87r34jvtn5.fsf-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "agraf-l3A5Bk7waGM@public.gmane.org" <agraf-l3A5Bk7waGM@public.gmane.org>, Bharat Kumar Gogada <bharatku-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "dhdang-qTEPVZfXA3Y@public.gmane.org" <dhdang-qTEPVZfXA3Y@public.gmane.org>, "marc.zyngier-5wv7dgnIgG8@public.gmane.org" <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Anirudha Sarangi <anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Anurag Kumar Vulisha <anuragku-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Felipe,


> From: Felipe Balbi [mailto:balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Wednesday, January 04, 2017 7:01 PM
> Hi,
>
> Manish Narani <manish.narani-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> writes:
> > This patch adds support for OTG driver compilation and object file
> > creation
> >
> > Signed-off-by: Manish Narani <mnarani-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/usb/dwc3/Makefile | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
> > index ffca340..2d269ad 100644
> > --- a/drivers/usb/dwc3/Makefile
> > +++ b/drivers/usb/dwc3/Makefile
> > @@ -17,6 +17,10 @@ ifneq ($(filter y,$(CONFIG_USB_DWC3_GADGET)
> $(CONFIG_USB_DWC3_DUAL_ROLE)),)
> >     dwc3-y                          +=3D gadget.o ep0.o
> >  endif
> >
> > +ifneq ($(CONFIG_USB_DWC3_DUAL_ROLE),)
> > +   dwc3-y                          +=3D otg.o
> > +endif
>
> you just broke compilation

Should I add new USB_DWC3_OTG macro in Kconfig?


Thanks,
Manish


This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
