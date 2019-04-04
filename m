From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Using device tree overlays in Linux
Date: Thu, 4 Apr 2019 01:50:20 +0000
Message-ID: <71fb0ff289e84c55bd92ecd96bc9aa76@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "pantelis.antoniou@konsulko.com" <pantelis.antoniou@konsulko.com>, "frowand.list@gmail.com" <frowand.list@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

Hi,=0A=
=0A=
I'm implementing support for some modular Linux based systems using =0A=
device tree overlays. The code is working but it seems a little more =0A=
fiddly that than it should be so I'm wondering if I'm doing it right.=0A=
=0A=
An example of what I'm doing is=0A=
=0A=
=0A=
arch/arm/boot/dts/Makefile:=0A=
DTC_FLAGS_myboard +=3D -@=0A=
=0A=
drivers/foo/Makefile:=0A=
obj-y +=3D myplugin.dtb.o=0A=
obj-y +=3D mydriver.o=0A=
=0A=
drivers/foo/myplugin.dts:=0A=
/dts-v1/;=0A=
/plugin/;=0A=
/{=0A=
	fragment@0 {=0A=
		target =3D <&i2c0>;=0A=
		__overlay__ {=0A=
			gpio@74 {=0A=
				compatible =3D "nxp,pca9539";=0A=
				reg =3D <0x74>=0A=
			};=0A=
		};=0A=
	};=0A=
};=0A=
=0A=
drivers/foo/mydriver.c:=0A=
extern uint8_t __dtb_myplugin_begin[];=0A=
extern uint8_t __dtb_myplugin_end[];=0A=
=0A=
int mydriver_probe(struct platform_device *pdev)=0A=
{=0A=
	u32 size =3D __dtb_myplugin_end - __dtb_myplugin_begin;=0A=
	int overlay_id;=0A=
	int ret;=0A=
	=0A=
	ret =3D of_overlay_fdt_apply(__dtb_myplugin_begin,=0A=
				   size, &overlay_id);=0A=
	return ret;=0A=
}=0A=
=0A=
=0A=
The first issue is that I need to add -@ to the DTC_FLAGS for my board =0A=
dtb. I kind of understand that I only need -@ if my overlay targets =0A=
something symbolic so I might not need it but I was surprised that there =
=0A=
wasn't a Kconfig option that makes this happen automatically.=0A=
=0A=
externing things in C files makes checkpatch.pl complain. I see the =0A=
of/unittests.c and rcar_du_of.c hide this with a macro. I was again =0A=
surprised that there wasn't a common macro to declare these.=0A=
=0A=
=0A=
