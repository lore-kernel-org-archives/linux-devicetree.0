From: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 0/2] Implement SoC bus support for Vybrid
Date: Mon, 18 May 2015 11:50:05 +0530
Message-ID: <cover.1431928866.git.maitysanchayan@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This patchset implements SoC bus support for Freescale Vybrid platform, 
implementing the following
https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-devices-soc

The RFC version can be found here
https://lkml.org/lkml/2015/5/11/13

Currently the required information is more or less read across the whole
SoC, but I guess we cannot change that since these are the locations
with the required information.

There seem to be three options for the revision field:
- ROM revision (see https://community.freescale.com/docs/DOC-94802)
- ANADIG revision (ANADIG_DIGIPROC, as used for the i.MX SoC's)
- OCOTP revision

Some numbers:

Colibri VF61 1.1A (2N02G)
- 0x00000013
- 0x00610000
- 0x01000000
- 0x410000c8

Colibri VF61 V1.0B (1N02G)
- 0x00000011
- 0x00610000
- 0x01000000
- 0x410000c8

Colibri VF61 V1.0A (which is actually a VF600 SoC, no L2 cache, since
that was the only one we could buy back then, 1N02G printed on it)
- 0x00000011
- 0x00610000
- 0x01000000
- none...

Colibri VF50 V1.0A (1N02G)
- 0x00000011
- 0x00610000
- 0x01000000
- none...

Vybrid Tower Rev J (1N02G)
- 0x00000011
- 0x00610000
- 0x01000000
- 0x410000c8

The ROM revision differs the most, so we would like to go with the 
revision information from the ROM register 0x80.

Changes since RFC:
- Use a DT entry for the ROM area while specifying it as syscon.

Thanks & Regards,
Sanchayan Maity.

Sanchayan Maity (2):
  ARM: dts: vfxxx: Add OCOTP and OCROM nodes
  ARM: vf610: Add SoC bus support for Vybrid

 arch/arm/boot/dts/vfxxx.dtsi   | 10 ++++++
 arch/arm/mach-imx/mach-vf610.c | 81 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 91 insertions(+)

-- 
2.4.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
