From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5 v2] MFD/OF: document MFD devices and handle simple-mfd
Date: Tue, 17 Mar 2015 15:27:23 +0000
Message-ID: <20150317152723.GB3318@x1>
References: <1426588510-9940-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1426588510-9940-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 17 Mar 2015, Linus Walleij wrote:

> This defines a new compatible option for MFD devices "simple-mfd" tha=
t will
> make the OF core spawn child devices for all subnodes of that MFD dev=
ice.
> It is optional but handy for things like syscon and possibly other
> simpler MFD devices.
>=20
> Since there was no file to put the documentation in, I took this oppo=
rtunity
> to make a small writeup on MFD devices and add the compatible definit=
ion
> there.
>=20
> Suggested-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Cc: Devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> ChangeLog v1->v2:
> - Fix spelling, terminology.
>=20
> I make the patch to the OF core in this one, it makes much more sense=
 since
> it's a oneliner
>=20
> Lee: this is a (tested!) implementation of your suggestion for simple=
-mfd.
> If you can eventually ACK this from the MFD side, I think it should b=
e
> funneled through the ARM SoC tree.
>=20
> Grant/Rob: if either of you can ACK the change to the OF core likewis=
e it can
> be taken through ARM SoC.
>=20
> DT binings maintainers: there is some background discussion on this h=
ere:
> http://marc.info/?l=3Dlinux-arm-kernel&m=3D142486676603889&w=3D2
> http://marc.info/?l=3Ddevicetree&m=3D142166313621469&w=3D2
> ---
>  Documentation/devicetree/bindings/mfd/mfd.txt | 41 +++++++++++++++++=
++++++++++
>  drivers/of/platform.c                         |  1 +
>  2 files changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mfd.txt

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> diff --git a/Documentation/devicetree/bindings/mfd/mfd.txt b/Document=
ation/devicetree/bindings/mfd/mfd.txt
> new file mode 100644
> index 000000000000..af9d6931a1a2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mfd.txt
> @@ -0,0 +1,41 @@
> +Multi-Function Devices (MFD)
> +
> +These devices comprise a nexus for heterogeneous hardware blocks con=
taining
> +more than one non-unique yet varying hardware functionality.
> +
> +A typical MFD can be:
> +
> +- A mixed signal ASIC on an external bus, sometimes a PMIC (Power Ma=
nagement
> +  Integrated Circuit) that is manufactured in a lower technology nod=
e (rough
> +  silicon) that handles analog drivers for things like audio amplifi=
ers, LED
> +  drivers, level shifters, PHY (physical interfaces to things like U=
SB or
> +  ethernet), regulators etc.
> +
> +- A range of memory registers containing "miscellaneous system regis=
ters" also
> +  known as a system controller "syscon" or any other memory range co=
ntaining a
> +  mix of unrelated hardware devices.
> +
> +Optional properties:
> +
> +- compatible : "simple-mfd" - this signifies that the operating syst=
em should
> +  consider all subnodes of the MFD device as separate devices akin t=
o how
> +  "simple-bus" inidicates when to see subnodes as children for a sim=
ple
> +  memory-mapped bus. For more complex devices, when the nexus driver=
 has to
> +  probe registers to figure out what child devices exist etc, this s=
hould not
> +  be used. In the latter case the child devices will be determined b=
y the
> +  operating system.
> +
> +Example:
> +
> +foo@1000 {
> +	compatible =3D "syscon", "simple-mfd";
> +	reg =3D <0x01000 0x1000>;
> +
> +	led@08.0 {
> +		compatible =3D "register-bit-led";
> +		offset =3D <0x08>;
> +		mask =3D <0x01>;
> +		label =3D "myled";
> +		default-state =3D "on";
> +	};
> +};
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index b189733a1539..969ba4e1460c 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -26,6 +26,7 @@
> =20
>  const struct of_device_id of_default_bus_match_table[] =3D {
>  	{ .compatible =3D "simple-bus", },
> +	{ .compatible =3D "simple-mfd", },
>  #ifdef CONFIG_ARM_AMBA
>  	{ .compatible =3D "arm,amba-bus", },
>  #endif /* CONFIG_ARM_AMBA */

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
