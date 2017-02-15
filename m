From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: How to get related device pointer via DT?
Date: Wed, 15 Feb 2017 02:21:55 +0000
Message-ID: <HK2PR06MB054824526D2975ADE8EA0405D85B0@HK2PR06MB0548.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: ja-JP
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

I would like to get a related device pointer on usb EHCI drivers (or USB fr=
amework)
because related device (e.g. OHCI or UHCI, called "companion controllers") =
has to
finish resuming. I discussed this topic with Alan:
http://marc.info/?t=3D148653514200001&r=3D1&w=3D2

In PCI bus, USB framework already has such a feature in drivers/usb/core/hc=
d-pci.c.
However, in platform devices, we don't have it for now. So, I would like to=
 add it.

Then, I have 2 ideas to get the related device pointer:

A) We add a new property "companion" as usb-generic.txt and EHCI node(s) ha=
ve
   such a property to bind a companion controller.
B) We assume EHCI controller binds a companion controller if some resources
   (irq or clock) are the same and it has a compatible strings as "generic-=
[uo]hci"
   for instance.

My environment is R-Car H3, and it has 3 EHCI and 3 OHCI controllers.
For example (I only wrote channel 0 of EHCI and OHCI):
		ehci0: usb@ee080100 {
			compatible =3D "generic-ehci";
			reg =3D <0 0xee080100 0 0x100>;
			interrupts =3D <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
			clocks =3D <&cpg CPG_MOD 703>;
			phys =3D <&usb2_phy0>;
			phy-names =3D "usb";
			power-domains =3D <&sysc R8A7795_PD_ALWAYS_ON>;
			status =3D "disabled";
		};

		ohci0: usb@ee080000 {
			compatible =3D "generic-ohci";
			reg =3D <0 0xee080000 0 0x100>;
			interrupts =3D <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
			clocks =3D <&cpg CPG_MOD 703>;
			phys =3D <&usb2_phy0>;
			phy-names =3D "usb";
			power-domains =3D <&sysc R8A7795_PD_ALWAYS_ON>;
			status =3D "disabled";
		};

If my idea A), ehci0 will have companion =3D <&ohci>;
If my idea B), no need to add any property.

What do you think?
Anyway, I will start to study DT programming :)

Best regards,
Yoshihiro Shimoda

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
