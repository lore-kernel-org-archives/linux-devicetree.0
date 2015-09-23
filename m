From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] doc: dt-binding: ci-hdrc-usb2: add i.mx specific
 binding "need-three-clocks"
Date: Wed, 23 Sep 2015 11:09:57 -0500
Message-ID: <CAL_Jsq+4psT1BDyL=F=W-X_uj0x+0K2dGcgoDZ836GnOM=u9MQ@mail.gmail.com>
References: <1442368183-8103-1-git-send-email-peter.chen@freescale.com>
 <1442368183-8103-2-git-send-email-peter.chen@freescale.com>
 <55F97491.5060105@kernel.org> <20150918023544.GA24297@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150918023544.GA24297@shlinux2>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 17, 2015 at 9:35 PM, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> On Wed, Sep 16, 2015 at 08:54:25AM -0500, Rob Herring wrote:
>> On 09/15/2015 08:49 PM, Peter Chen wrote:
>> > Some SoCs needs three clock to let controller work, but others only
>> > need one, add one property to differentiate this.

[...]

>> > diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
>> > index f15a317..4900092 100644
>> > --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
>> > +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
>> > @@ -54,6 +54,9 @@ i.mx specific properties
>> >    argument that indicate usb controller index
>> >  - disable-over-current: disable over current detect
>> >  - external-vbus-divider: enables off-chip resistor divider for Vbus
>> > +- need-three-clocks: the SoC before imx6 series (except for imx23/imx28)
>> > +  needs three clcoks for controller, others only need one. Without this
>> > +  property, the driver will consider this controller only need one clock.
>>
>> That's pretty ugly and unnecessary. Either use the compatible string to
>> determine
>
> Since there are too many SoCs to use it, I just didn't want to add
> judgement for platforms, and thought using feature property is simpler.
> If you doesn't agree, I will use other ways.
>
>> if you have 3 clocks or just always try to retrieve the 3
>> clocks in the driver and fall back to 1.
>>
>
> It is not easy to use this way, one-clock platforms have no dev_id for
> clock, but three-clock platforms have.

You just need to try to retrieve the 3rd clock by name. If that
succeeds, retrieve clocks 1 and 2. If you can't retrieve the 3rd
clock, the just get the 1st clock with no name.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
