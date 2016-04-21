From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] ARM64: dts: rockchip: add core dtsi file for RK3399 SoCs
Date: Thu, 21 Apr 2016 15:38:22 -0700
Message-ID: <CAD=FV=X9S4z2WLEJ-KaaCZxfkdO4+-i2hUd3dsYJi5qXEvpVBQ@mail.gmail.com>
References: <1461122150-9042-1-git-send-email-jay.xu@rock-chips.com>
	<1461211092-26331-1-git-send-email-jay.xu@rock-chips.com>
	<3937420.4aN2rRBlcO@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3937420.4aN2rRBlcO@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Riley <davidriley-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

I didn't look as deeply as Heiko, but a few comments...


On Thu, Apr 21, 2016 at 3:02 PM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> w=
rote:
> Hi Jay,
>
> Am Donnerstag, 21. April 2016, 11:58:12 schrieb Jianqun Xu:
>> This patch adds rk3399.dtsi for rk3399 found on Rockchip
>> RK3399 SoCs, also add rk3399-evb.dts for Rockchip RK3399
>> Evaluation Board.
>>
>> Patch is tested on RK3399 evb.
>>
>> Signed-off-by: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>
> please split this into
> - patch adding the dtsi
> - patch adding the evb dts
> - patch adding the new  board to bindings/arm/rockchip.txt
>
> more inline below

Also don't forget to remove the controversial pmu bits for now (as
discussed earlier) so this can land while all those kinks are being
worked out.

>> +     sdhci: sdhci@fe330000 {
>> +             compatible =3D "arasan,sdhci-5.1";
>
> not 100% sure, but we might want a
>                 compatible =3D "rockchip,rk3399-sdhci-5.1", "arasan,s=
dhci-5.1";
>
> allowing us to get more specific, if implementation oddities surface =
later.

I agree with Heiko.  This sounds very sane to me, too, and matches
previous discussions.

>> +             reg =3D <0x0 0xfe330000 0x0 0x10000>;
>> +             interrupts =3D <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
>> +             clocks =3D <&cru SCLK_EMMC>, <&cru ACLK_EMMC>;
>> +             clock-names =3D "clk_xin", "clk_ahb";
>> +             phys =3D <&emmc_phy>;
>> +             phy-names =3D "phy_arasan";
>> +             status =3D "disabled";
>> +     };
>> +
>> +     usb2phy: usb2phy {
>> +             compatible =3D "rockchip,rk3399-usb-phy";
>
> this doesn't look like it got submitted yet.
>
> Also, the newer socs (rk3399. rk3036, rk3228) seem to use a different=
 usbphy
> block than rk3288 and before (with a big bunch of new phy-related reg=
ister
> blocks I haven't looked at yet) - so this should probably get a new d=
river as
> well and not be crammed into the current phy driver, which is for the=
 older
> picophy (or what it was called).
>
>
>> +             rockchip,grf =3D <&grf>;
>> +             #address-cells =3D <1>;
>> +             #size-cells =3D <0>;
>> +
>> +             usb2phy0: usb2-phy0 {
>> +                     #phy-cells =3D <0>;
>> +                     #clock-cells =3D <0>;
>> +                     reg =3D <0xe458>;
>> +             };
>
> When we're doing a new driver, could we please get rid of these subno=
des and
> instead access phys via something like
>
>         phys =3D <&usb2phy 0>;

=46rom what I recall during the submission of the previous PHY Kishon
preferred the subnodes.  I think I made a fool of myself in the last
discussion about this because I reported bugs in my downstream kernel
that didn't exist upstream, but if you want to read it you can see
here:

https://patchwork.kernel.org/patch/5474871/

I believe patch v6 used IDs like Heiko is suggesting and it turned to
subnodes in v7 based on Kishon's request.  Since PHY code and bindings
are Kishon's call, I have a feeling his opinion will trump here.

>> +
>> +             usb2phy1: usb2-phy1 {
>> +                     #phy-cells =3D <0>;
>> +                     #clock-cells =3D <0>;
>> +                     reg =3D <0xe468>;
>> +             };
>> +     };
>> +
>> +     usb_host0_echi: usb@fe380000 {
>
> not "echi" please :-)

Just because it took me an extra reading to understand, he means turn
"echi" to "ehci".


>> +             compatible =3D "generic-ehci";
>> +             reg =3D <0x0 0xfe380000 0x0 0x20000>;
>> +             interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
>> +             clocks =3D <&cru HCLK_HOST0>, <&cru HCLK_HOST0_ARB>;
>> +             clock-names =3D "hclk_host0", "hclk_host0_arb";
>> +             phys =3D <&usb2phy0>;
>> +             phy-names =3D "usb2_phy0";
>> +             status =3D "disabled";
>> +     };
>
> [...]
>
>> +     usbdrd3_0: usb@fe800000 {
>> +             compatible =3D "rockchip,dwc3";
>
> is this in some tree already?

I'm really surprised that there's not some generic fallback for
"dwc3-of-simple.c".  I would have expected:
  "rockchip,rk3399-dwc3", "synopsis,dwc3";

=2E..but that doesn't appear to be in the bindings.  Weird.

>> +     i2c1: i2c@ff110000 {
>> +             compatible =3D "rockchip,rk3399-i2c";
>
> David respun the rk3399 i2c-support on tuesday, so this and the other=
s below
> are waiting on Wolfram to take a look.

I think it can work with the rk3288-i2c as a fallback, at least for
low speed stuff, right?  Should this be:

compatible =3D "rockchip,rk3399-i2c", "rockchip,rk3288-i2c"

Looks like that was done for rk3368.


-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
