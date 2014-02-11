From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 1/2] ohci-platform: Change compatible string from usb-ohci to ohci-platform
Date: Tue, 11 Feb 2014 09:06:09 -0600
Message-ID: <954E6E26-EEF1-4A0A-A9BC-D5CA918FAD43@codeaurora.org>
References: <1392127826-31290-1-git-send-email-hdegoede@redhat.com> <1392127826-31290-2-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392127826-31290-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Feb 11, 2014, at 8:10 AM, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> The initial versions of the devicetree enablement patches for ohci-pl=
atform
> used "ohci-platform" as compatible string. However this was disliked =
by various
> reviewers because the platform bus is a Linux invention and devicetre=
e is
> supposed to be OS agnostic. After much discussion I gave up and went =
with
> the generic usb-ohci as requested.
>=20
> In retro-spect I should have stuck to my guns, because the dts files =
for many
> existing boards already claim to be compatible with "usb-ohci", ie th=
ey have:
>=20
> 	compatible =3D "ti,ohci-omap3", "usb-ohci";
>=20
> In theory this should not be a problem since the "ti,ohci-omap3" entr=
y takes
> presedence, but in practice using a conflicting compatible string is =
an issue,
> because it makes which driver gets used depent on driver registration=
 order.
>=20
> This patch changes the compatible string claimed by ohci-platform (ba=
ck) to
> "ohci-platform", avoiding the driver registration / module loading or=
dering
> problems. Note that there already is a precedent for using ?hci-platf=
orm, in
> the form of xhci-platform.c using "xhci-platfrom" as compatible strin=
g.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
> Documentation/devicetree/bindings/usb/usb-ohci.txt | 4 ++--
> drivers/usb/host/ohci-platform.c                   | 2 +-
> 2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/usb-ohci.txt b/Doc=
umentation/devicetree/bindings/usb/usb-ohci.txt
> index 6933b0c..a8e576a 100644
> --- a/Documentation/devicetree/bindings/usb/usb-ohci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-ohci.txt
> @@ -1,7 +1,7 @@
> USB OHCI controllers
>=20
> Required properties:
> -- compatible : "usb-ohci=94

Why not leave =91usb-ohci=92 and deprecate it?

> +- compatible : "ohci-platform"
> - reg : ohci controller register range (address and length)
> - interrupts : ohci controller interrupt
>=20
> @@ -16,7 +16,7 @@ Optional properties:
> Example:
>=20
> 	ohci0: usb@01c14400 {
> -		compatible =3D "allwinner,sun4i-a10-ohci", "usb-ohci";
> +		compatible =3D "allwinner,sun4i-a10-ohci", "ohci-platform";
> 		reg =3D <0x01c14400 0x100>;
> 		interrupts =3D <64>;
> 		clocks =3D <&usb_clk 6>, <&ahb_gates 2>;
> diff --git a/drivers/usb/host/ohci-platform.c b/drivers/usb/host/ohci=
-platform.c
> index e2c28fd..59f3551 100644
> --- a/drivers/usb/host/ohci-platform.c
> +++ b/drivers/usb/host/ohci-platform.c
> @@ -319,7 +319,7 @@ static int ohci_platform_resume(struct device *de=
v)
> #endif /* CONFIG_PM */
>=20
> static const struct of_device_id ohci_platform_ids[] =3D {
> -	{ .compatible =3D "usb-ohci", },
> +	{ .compatible =3D "ohci-platform", },
> 	{ }
> };
> MODULE_DEVICE_TABLE(of, ohci_platform_ids);
> --=20
> 1.8.5.3
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, host=
ed by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
