From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND PATCH 6/6] dt-bindings: phy-mt65xx-usb: add support for
 mt2712 platform
Date: Mon, 23 Jan 2017 08:04:17 -0600
Message-ID: <CAL_JsqJkJwwfqq6ezyNiQXyefR8V=q6_hOUPVmssEGs_pdxhuA@mail.gmail.com>
References: <1484719214-11989-1-git-send-email-chunfeng.yun@mediatek.com>
 <1484719214-11989-6-git-send-email-chunfeng.yun@mediatek.com>
 <20170121200844.k5ivauhws43ac2s2@rob-hp-laptop> <1485053419.10292.88.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485053419.10292.88.camel@mhfsdcap03>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jan 21, 2017 at 8:50 PM, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> On Sat, 2017-01-21 at 14:08 -0600, Rob Herring wrote:
>> On Wed, Jan 18, 2017 at 02:00:14PM +0800, Chunfeng Yun wrote:
>> > add a new compatible string for "mt2712", and a new reference clock
>> > for SuperSpeed analog phy;
>> >
>> > Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>> > ---
>> >  .../devicetree/bindings/phy/phy-mt65xx-usb.txt     |   81 +++++++++++++++++---
>> >  1 file changed, 70 insertions(+), 11 deletions(-)

[...]

>> > @@ -31,21 +37,27 @@ Example:
>> >  u3phy: usb-phy@11290000 {
>> >     compatible = "mediatek,mt8173-u3phy";
>> >     reg = <0 0x11290000 0 0x800>;
>> > -   clocks = <&apmixedsys CLK_APMIXED_REF2USB_TX>;
>> > -   clock-names = "u3phya_ref";
>> > +   clocks = <&apmixedsys CLK_APMIXED_REF2USB_TX>, <&clk26m>;
>> > +   clock-names = "u2ref_clk", "u3ref_clk";
>> >     #address-cells = <2>;
>> >     #size-cells = <2>;
>> >     ranges;
>> >     status = "okay";
>> >
>> > -   phy_port0: port@11290800 {
>> > -           reg = <0 0x11290800 0 0x800>;
>> > +   u2port0: port@11290800 {
>>
>> port is for OF graph. This should be usb-phy@... instead.
> Is there any problems if u2port0's name@addr is the same as its parent's
> (u3phy)?  as following:
>         u3phy: usb-phy@11290000 {
>                 compatible = ...;
>                 // no reg property
>                 clocks = ...;
>                 u2port0: usb-phy@11290000 {
>                         reg = ...;
>         }

No problem, that is fine.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
