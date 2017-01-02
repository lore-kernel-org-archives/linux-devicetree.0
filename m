From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/8] ARM: dts: Switch to new DSA binding
Date: Sun,  1 Jan 2017 18:22:41 -0800
Message-ID: <20170102022249.10657-1-f.fainelli@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

This patch series converts the in-tree users to utilize the new (relatively)
DSA binding that was introduced with commit 8c5ad1d6179d ("net: dsa: Document
new binding"). The legacy binding node is kept included, but is marked
disabled.

In about 2-3 releases we may consider removing the old DSA binding entirely
from the kernel.

Thank you!

Florian Fainelli (8):
  ARM: dts: armada-370-rd: Utilize new DSA binding
  ARM: dts: armada-38x: Utilize new DSA binding
  ARM: dts: armada-388-clearfog: Utilize new DSA binding
  ARM: dts: armada-xp-linksys-mamba: Utilize new DSA binding
  ARM: dts: kirkwood-dir665: Utilize new DSA binding
  ARM: dts: kirkwood-linksys-viper: Utilize new DSA binding
  ARM: dts: kirkwood-mv88f6281gtw-ge: Utilize new DSA binding
  ARM: dts: kirkwood-rd88f6281: Utilize new DSA binding

 arch/arm/boot/dts/armada-370-rd.dts            | 44 +++++++++++++++++
 arch/arm/boot/dts/armada-385-linksys.dtsi      | 52 ++++++++++++++++++++-
 arch/arm/boot/dts/armada-388-clearfog.dts      | 65 ++++++++++++++++++++++++++
 arch/arm/boot/dts/armada-xp-linksys-mamba.dts  | 53 +++++++++++++++++++++
 arch/arm/boot/dts/kirkwood-dir665.dts          | 49 +++++++++++++++++++
 arch/arm/boot/dts/kirkwood-linksys-viper.dts   | 49 +++++++++++++++++++
 arch/arm/boot/dts/kirkwood-mv88f6281gtw-ge.dts | 49 +++++++++++++++++++
 arch/arm/boot/dts/kirkwood-rd88f6281-z0.dts    | 11 +++++
 arch/arm/boot/dts/kirkwood-rd88f6281.dtsi      | 44 +++++++++++++++++
 9 files changed, 415 insertions(+), 1 deletion(-)

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
