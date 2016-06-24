From: Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
Subject: Re: [PATCH] drivers/of: add option to load a default Device Tree
Date: Fri, 24 Jun 2016 10:15:05 +0200
Message-ID: <86d0de95-9b74-81ca-bcf4-e6e41b95ea9a@odyssee-systemes.fr>
References: <1466607954-2821-1-git-send-email-franck.jullien@odyssee-systemes.fr>
 <576C2A22.2020103@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <576C2A22.2020103-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jose.abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org
List-Id: devicetree@vger.kernel.org


Le 23/06/2016 =E0 20:27, Frank Rowand a =E9crit :
> On 06/22/16 08:05, Franck Jullien wrote:
>> Even if a platform doesn't use a device tree during its
>> boot process it can be useful to enable CONFIG_OF and get
>> an empty device tree.
>>
>> Then, devices can use device tree overlays to populate this
>> default tree.
>=20
>=20
> Hi Franck,
>=20
> Can you elaborate on the problem that you are trying to
> solve and the use cases that you are envisioning?
>=20
> Thanks,
>=20
> Frank
>=20

Hi,

The idea behind this patch is to describe devices that are in a FPGA
which is itself connected to the platform through PCIe. The platform
might not use a devicetree for its own configuration. That's why we nee=
d
this patch.

There is an ongoing  discussion about this subject [1].

I have a working setup (on a x86_64) using this principle. I have
created a pci resources proxy module which is parent of all devices on
the FPGA. This is an example of binding:

	proxy: pci1337_0001 {
		#address-cells =3D <1>;
		#size-cells =3D <1>;
		#interrupt-cells =3D <1>;
		vendor-id =3D <0x00001337>;
		device-id =3D <0x00000001>;
		compatible =3D "pci1337,0001",
			     "generic,pci-proxy";
		interrupt-controller;
		/* Ranges will be overwritten during probe */
		ranges =3D <0 0 0xA0000000 0x100000     /* BAR 0 */
			  1 0 0xB0000000 0x100000     /* BAR 1 */
			  2 0 0xC0000000 0x100000>;   /* BAR 2 */
	};

Ranges are dynamically updated on probe with regards to FPGA bars.
This node is attached to the tree (an empty tree in my case) from the
client module.

Then FPGA devices nodes are added using overlay. This is an example:

/dts-v1/;
/ {
	#address-cells =3D <1>;
	#size-cells =3D <1>;

	fragment@0 {
		target-path =3D "/pci1337_0001";
		__overlay__ {

			#address-cells =3D <2>;
			#size-cells =3D <1>;
			interrupt-parent =3D <&proxy>;

			osc: oscillator {
				compatible =3D "fixed-clock";
				#clock-cells =3D <1>;
				clock-frequency  =3D <148500000>;
				clock-output-names =3D "osc";
			};
			enet0: ethoc {
				compatible =3D "opencores,ethoc";
				reg =3D <1 0x50000 0x100>;
				interrupts =3D <0>;
			};
			gpio0: gpio {
				#gpio-cells =3D <2>;
				compatible =3D "xlnx,xps-gpio-1.00.a";
				reg =3D <0 0x30000 0x10000>;
				gpio-controller;
			};
		};
	};


};

Interrupts property are dynamically modified before the overlay is
applied. By the way, I had to do a little hack here in the pci-proxy.
I did not declare a new interrupt domain. What I did is to get the PCI
interrupt domain (IO-APIC on my platform):

irq_data =3D irq_get_irq_data(priv->pci_dev->irq);
domain_parent =3D irq_data->domain;

and then set fwnode of IO-APIC to pci-proxy fwnode so
irq_create_of_mapping get IO-APIC's domain:

domain_parent->fwnode =3D &np->fwnode;

There might be a better way to make things work.

Beside this patch I needed to export of_attach_node and of_detach_node.
This will be another patch.

Thank you for your interest.

=46ranck.

[1] http://www.spinics.net/lists/dmaengine/msg09869.html

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
