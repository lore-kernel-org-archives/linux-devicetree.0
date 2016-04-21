From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] ARM64: dts: rockchip: add core dtsi file for RK3399 SoCs
Date: Fri, 22 Apr 2016 00:49:12 +0200
Message-ID: <12509353.XToGr791I0@diego>
References: <1461122150-9042-1-git-send-email-jay.xu@rock-chips.com> <3937420.4aN2rRBlcO@diego> <CAD=FV=X9S4z2WLEJ-KaaCZxfkdO4+-i2hUd3dsYJi5qXEvpVBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=X9S4z2WLEJ-KaaCZxfkdO4+-i2hUd3dsYJi5qXEvpVBQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Riley <davidriley-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 21. April 2016, 15:38:22 schrieb Doug Anderson:
> Hi,
>=20
> I didn't look as deeply as Heiko, but a few comments...
>=20
> On Thu, Apr 21, 2016 at 3:02 PM, Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wr=
ote:
> > Hi Jay,
> >=20
> > Am Donnerstag, 21. April 2016, 11:58:12 schrieb Jianqun Xu:
> >> This patch adds rk3399.dtsi for rk3399 found on Rockchip
> >> RK3399 SoCs, also add rk3399-evb.dts for Rockchip RK3399
> >> Evaluation Board.
> >>=20
> >> Patch is tested on RK3399 evb.
> >>=20
> >> Signed-off-by: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >=20
> > please split this into
> > - patch adding the dtsi
> > - patch adding the evb dts
> > - patch adding the new  board to bindings/arm/rockchip.txt
> >=20
> > more inline below
>=20
> Also don't forget to remove the controversial pmu bits for now (as
> discussed earlier) so this can land while all those kinks are being
> worked out.
>=20
> >> +     sdhci: sdhci@fe330000 {
> >> +             compatible =3D "arasan,sdhci-5.1";
> >=20
> > not 100% sure, but we might want a
> >=20
> >                 compatible =3D "rockchip,rk3399-sdhci-5.1",
> >                 "arasan,sdhci-5.1";
> >=20
> > allowing us to get more specific, if implementation oddities surfac=
e
> > later.
>=20
> I agree with Heiko.  This sounds very sane to me, too, and matches
> previous discussions.
>=20
> >> +             reg =3D <0x0 0xfe330000 0x0 0x10000>;
> >> +             interrupts =3D <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> >> +             clocks =3D <&cru SCLK_EMMC>, <&cru ACLK_EMMC>;
> >> +             clock-names =3D "clk_xin", "clk_ahb";
> >> +             phys =3D <&emmc_phy>;
> >> +             phy-names =3D "phy_arasan";
> >> +             status =3D "disabled";
> >> +     };
> >> +
> >> +     usb2phy: usb2phy {
> >> +             compatible =3D "rockchip,rk3399-usb-phy";
> >=20
> > this doesn't look like it got submitted yet.
> >=20
> > Also, the newer socs (rk3399. rk3036, rk3228) seem to use a differe=
nt
> > usbphy block than rk3288 and before (with a big bunch of new phy-re=
lated
> > register blocks I haven't looked at yet) - so this should probably =
get a
> > new driver as well and not be crammed into the current phy driver, =
which
> > is for the older picophy (or what it was called).
> >=20
> >> +             rockchip,grf =3D <&grf>;
> >> +             #address-cells =3D <1>;
> >> +             #size-cells =3D <0>;
> >> +
> >> +             usb2phy0: usb2-phy0 {
> >> +                     #phy-cells =3D <0>;
> >> +                     #clock-cells =3D <0>;
> >> +                     reg =3D <0xe458>;
> >> +             };
> >=20
> > When we're doing a new driver, could we please get rid of these sub=
nodes
> > and instead access phys via something like
> >=20
> >         phys =3D <&usb2phy 0>;
>=20
> From what I recall during the submission of the previous PHY Kishon
> preferred the subnodes.  I think I made a fool of myself in the last
> discussion about this because I reported bugs in my downstream kernel
> that didn't exist upstream, but if you want to read it you can see
> here:
>=20
> https://patchwork.kernel.org/patch/5474871/
>=20
> I believe patch v6 used IDs like Heiko is suggesting and it turned to
> subnodes in v7 based on Kishon's request.  Since PHY code and binding=
s
> are Kishon's call, I have a feeling his opinion will trump here.

After Doug pointed me to that old discussion, I tend to agree - aka use=
 sub-
nodes.


> >> +
> >> +             usb2phy1: usb2-phy1 {
> >> +                     #phy-cells =3D <0>;
> >> +                     #clock-cells =3D <0>;
> >> +                     reg =3D <0xe468>;
> >> +             };
> >> +     };
> >> +
> >> +     usb_host0_echi: usb@fe380000 {
> >=20
> > not "echi" please :-)
>=20
> Just because it took me an extra reading to understand, he means turn
> "echi" to "ehci".
>=20
> >> +             compatible =3D "generic-ehci";
> >> +             reg =3D <0x0 0xfe380000 0x0 0x20000>;
> >> +             interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> >> +             clocks =3D <&cru HCLK_HOST0>, <&cru HCLK_HOST0_ARB>;
> >> +             clock-names =3D "hclk_host0", "hclk_host0_arb";
> >> +             phys =3D <&usb2phy0>;
> >> +             phy-names =3D "usb2_phy0";
> >> +             status =3D "disabled";
> >> +     };
> >=20
> > [...]
> >=20
> >> +     usbdrd3_0: usb@fe800000 {
> >> +             compatible =3D "rockchip,dwc3";
> >=20
> > is this in some tree already?
>=20
> I'm really surprised that there's not some generic fallback for
> "dwc3-of-simple.c".  I would have expected:
>   "rockchip,rk3399-dwc3", "synopsis,dwc3";
>=20
> ...but that doesn't appear to be in the bindings.  Weird.
>=20
> >> +     i2c1: i2c@ff110000 {
> >> +             compatible =3D "rockchip,rk3399-i2c";
> >=20
> > David respun the rk3399 i2c-support on tuesday, so this and the oth=
ers
> > below are waiting on Wolfram to take a look.
>=20
> I think it can work with the rk3288-i2c as a fallback, at least for
> low speed stuff, right?  Should this be:
>=20
> compatible =3D "rockchip,rk3399-i2c", "rockchip,rk3288-i2c"
>=20
> Looks like that was done for rk3368.

The rk3368 has virtually the same ip blocks as the rk3288, so the i2c=20
controllers actually are the same. Not sure how true this is for the rk=
3399=20
though.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
