From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] usb: dwc3: add dwc3 glue layer for UniPhier SoCs
Date: Wed, 24 Jan 2018 14:58:12 +0200
Message-ID: <87a7x3l8gr.fsf@linux.intel.com>
References: <1516712454-2915-3-git-send-email-hayashi.kunihiko@socionext.com> <87o9lklnwb.fsf@linux.intel.com> <20180124215228.ED43.4A936039@socionext.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180124215228.ED43.4A936039-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Masami Hiramatsu <masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> writes:
> Hello Felipe,
>
> Thank you for your comments.
>
> On Tue, 23 Jan 2018 15:12:36 +0200 <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
>>=20
>> Hi,
>>=20
>> Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> writes:
>> > Add a specific glue layer for UniPhier SoC platform to support
>> > USB host mode. It manages hardware operating sequences to enable multi=
ple
>> > clock gates and assert resets, and to prepare to use dwc3 controller
>> > on the SoC.
>> >
>> > This patch also handles the physical layer that has same register space
>> > as the glue layer, because it needs to integrate initialziation sequen=
ce
>> > between glue and phy.
>> >
>> > In case of some SoCs, since some initialization values for PHY are
>> > included in nvmem, this patch includes the way to get the values from =
nvmem.
>> >
>> > It supports PXs2 and LD20 SoCs.
>> >
>> > Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
>> > Signed-off-by: Motoya Tanigawa <tanigawa.motoya-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
>> > Signed-off-by: Masami Hiramatsu <masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> > ---
>> >  drivers/usb/dwc3/Kconfig         |   9 +
>> >  drivers/usb/dwc3/Makefile        |   1 +
>> >  drivers/usb/dwc3/dwc3-uniphier.c | 554 ++++++++++++++++++++++++++++++=
+++++++++
>> >  3 files changed, 564 insertions(+)
>> >  create mode 100644 drivers/usb/dwc3/dwc3-uniphier.c
>
> ...snip...
>
>> > +
>> > +static void dwc3u_ssphy_testio_write(struct dwc3u_priv *priv, int por=
t,
>> > +				     u32 data)
>>=20
>> anything with sshphy or hsphy in the name should probably be part of a
>> PHY driver using drivers/phy/ framework.
>
> I can try to separate phy control from this driver.
> However, phy registers belongs to "dwc3-glue" IO map area (65b00000),
> and this area also contains a reset bit for "dwc3-core" hardware.
>
> Although the phy driver is called from dwc3-core driver,
> we need to deassert the reset bit before probing dwc3-core driver.
>
> As shown later, I think that it's difficut to determine the order of
> initializing the registers in this area.
>
>> > +static void dwc3u_vbus_disable(struct dwc3u_priv *priv)
>> > +{
>> > +	int i;
>> > +
>> > +	for (i =3D 0; i < priv->nvbus; i++) {
>> > +		dwc3u_maskwrite(priv, VBUS_CONTROL(i),
>> > +				DRVVBUS_REG_EN | DRVVBUS_REG,
>> > +				DRVVBUS_REG_EN | 0);
>> > +	}
>> > +}
>>=20
>> drivers/regulator maybe?
>
> VBUS_CONTROL register is used for determing whether "dwc3-glue" hardware
> enables vbus connected with "regulator" hardware.
>
> The regulator driver should manage "regulator" hardware, and
> I don't think that the driver should manage this register.
>
>> > +static void dwc3u_reset_init(struct dwc3u_priv *priv)
>> > +{
>> > +	dwc3u_maskwrite(priv, RESET_CTL, LINK_RESET, 0);
>> > +	usleep_range(1000, 2000);
>> > +	dwc3u_maskwrite(priv, RESET_CTL, LINK_RESET, LINK_RESET);
>> > +}
>> > +
>> > +static void dwc3u_reset_clear(struct dwc3u_priv *priv)
>> > +{
>> > +	dwc3u_maskwrite(priv, RESET_CTL, LINK_RESET, 0);
>> > +}
>>=20
>> drivers/reset ?
>
> The reset driver manages "sysctrl" IO map area in our SoC.
>
> RESET_CTL register belongs to "dwc3-glue" IO map area,
> and the kernel can't access this area until enabling usb clocks and
> deasserting usb resets in "sysctrl".
>
> I think that "dwc3-glue" register control should be separated from
> "sysctrl".

Just split your address space and treat your glue as a device with
several children:

glue@65b00000 {
	compatible =3D "foo"

	phy@bar {
        	...
	};

	sysctrl@baz {
        	...
	};

	dwc3@foo {
        	compatible =3D "snps, dwc3";
                ...
	};
};

Then you know that you can let dwc3/core.c handle the PHY for you. If we
need to teach dwc3/core.c about regulators, we can do that. But we don't
need SoC-specific hacks ;-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlpoguQACgkQzL64meEa
mQbRig//eBvVqrK+Aq+5r/T2462ZCdpPzRg6hIL5K6DWWYUHGx9k0bLLFvjiniVf
k6BViNvKbW717IyhwOeB9VplrLPlAfu8i8bKf382a6lWryO7l8xhDPfl2aTW9toz
+DABlwZgWsxyHYIfgOlv4h89WOXYAGdKAywIAc7/qH4WAF1SUxoabfxL0L9NM6YT
gP0PN1U7xUp4kCkSFkF8J6ub/cxFsxUZx7lRIdhfWe2S+ulaclktlbs1Hv5eRiGD
XyzuVGXjjZNIy4pw7G/BQcQ1JOb13r6W/7cc4D9Gl8XdDcxNLLeP7w/rZADnTLwr
7NDdg9/+SkI07oFMx/heGIQeZ3T3coYkecIq2CB+B6B2PkmgahCSH2AYYopSjyVp
2QGvxLdsSAVA1w4dgdK/De+n4mSkcMOF0DcpbyfXVixwtz1C+HrAosjeMa3iBHGr
Ja1a32MAaQgg1SG2QzSFnFSHiBiml8I7Rn5MQFrOkCQi7fv75mwma+mYxG7nQhgy
9kRMJ+4s5/7hikEjQvlIE++sdIsFFnPOV+o9q9VGOuOUvqC2r8NhYTw+w/R2TGul
Eie6kB1O+WpFZkb3kB/laAtnk113MEXnAFR8JGQmAiZQ79jlBIZ3/8BB4Al4NYkc
PEU5kWz5+SnjtmyY2cNCS/VLlVGEAE8nrPHEhLfbgDXLyXwF32c=
=ZeYo
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
