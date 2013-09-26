From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v3 0/2] ARM DT cpus/cpu and topology bindings
Date: Thu, 26 Sep 2013 10:42:01 +0100
Message-ID: <1380188523-20589-1-git-send-email-lorenzo.pieralisi@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dave Martin <dave.martin-5wv7dgnIgG8@public.gmane.org>, Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is v3 of a previous posting:

http://lists.infradead.org/pipermail/linux-arm-kernel/2013-September/198564=
.html

- v3 changes
=09- Updated #address-cells and reg properties requirements for ARM v8

- v2 changes
=09- Removed single core cpu-map example
=09- Removed OS dependency from cpus/cpu bindings
=09- Updated Marvell compatible strings
=09- Clarified behaviour on pre ARM v7 uniprocessor systems and updated
=09  examples

This patch resumes DT topology/cpu bindings discussions for ARM that were
started here:

https://lists.ozlabs.org/pipermail/devicetree-discuss/2013-April/031725.htm=
l
https://lists.ozlabs.org/pipermail/devicetree-discuss/2013-April/032450.htm=
l

Comments welcome, thanks,
Lorenzo

Lorenzo Pieralisi (2):
  Documentation: devicetree: arm: cpus/cpu nodes bindings updates
  Documentation: DT: arm: define CPU topology bindings

 Documentation/devicetree/bindings/arm/cpus.txt     | 401 +++++++++++++++--
 Documentation/devicetree/bindings/arm/topology.txt | 474 +++++++++++++++++=
++++
 2 files changed, 828 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/topology.txt

--=20
1.8.2.2


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
