From: Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] USB: doc: Binding document for ehci-platform driver
Date: Sun, 21 Oct 2012 19:34:07 +0200
Message-ID: <201210211934.07427.florian@openwrt.org>
References: <1350771032-11527-1-git-send-email-linux@prisktech.co.nz> <1350771032-11527-3-git-send-email-linux@prisktech.co.nz>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1350771032-11527-3-git-send-email-linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Cc: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le dimanche 21 octobre 2012 00:10:32, Tony Prisk a =C3=A9crit :
> Add a binding document for ehci-platform driver.
>=20
> Signed-off-by: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
> ---
>  .../devicetree/bindings/usb/ehci-platform.txt      |   27
> ++++++++++++++++++++ 1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/ehci-platfo=
rm.txt
>=20
> diff --git a/Documentation/devicetree/bindings/usb/ehci-platform.txt
> b/Documentation/devicetree/bindings/usb/ehci-platform.txt new file mo=
de
> 100644
> index 0000000..930b19e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ehci-platform.txt
> @@ -0,0 +1,27 @@
> +Generic Platform EHCI Controller
> +-----------------------------------------------------
> +
> +Required properties:
> +- compatible : "linux,ehci-platform"

Here you changed to linux,ehci-platform, which is good, but in the exam=
ple you=20
forgot to update it.

Otherwise, this is ok with me.

> +- reg : Should contain 1 register ranges(address and length)
> +- interrupts : EHCI controller interrupt
> +
> +Optional properties:
> +- caps-offset : offset to the capabilities register (default =3D 0)
> +- has-tt : controller has transaction translator(s).
> +- has-synopsys-hc-bug : controller has the synopsys hc bug
> +- no-io-watchdog : controller does not need io watchdog
> +
> +- big-endian : descriptors and registers are both big endian. This
> +  is the equivalent of specifying big-endian-desc and big-endian-reg=
s.
> +OR
> +- big-endian-desc : descriptors are in big-endian format
> +- big-endian-regs : mmio is in big-endian format
> +
> +Example:
> +	ehci@d8007c00 {
> +		compatible =3D "ehci-platform";
> +		reg =3D <0xd8007c00 0x200>;
> +		interrupts =3D <43>;
> +		has-tt;
> +	};

--=20
=46lorian
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
