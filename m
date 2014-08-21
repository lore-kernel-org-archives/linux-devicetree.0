From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 0/7] MIPS: Move device-tree files to a common location
Date: Thu, 21 Aug 2014 13:04:19 -0700
Message-ID: <1408651466-8334-1-git-send-email-abrestic@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

To be consistent with other architectures and to avoid unnecessary
makefile duplication, move all MIPS device-trees to arch/mips/boot/dts
and build them with a common makefile.

Patch 1 sets up the makefiles for building the DTs in arch/mips/boot/dts
and introduces the config option BUILTIN_DTB for platforms that require
it.

Patch 2 introduces the 'dtbs' makefile target to allow building of just
the DT binaries.

Patches 3-7 move the DTs out of the platform directores.

I've build tested this on all affected platforms (Octeon, Lantiq, SEAD3,
Netlogic, and Ralink) as well as Malta.  For platforms where builtin DTBs
are optional (Netlogic and Ralink), I built with and without the builtin
DTBs.

Based on 3.17-rc1.

Andrew Bresticker (7):
  MIPS: Create common infrastructure for building built-in device-trees
  MIPS: Add support for building device-tree binaries
  MIPS: Octeon: Move device-trees to arch/mips/boot/dts/
  MIPS: Lantiq: Move device-trees to arch/mips/boot/dts/
  MIPS: sead3: Move device-trees to arch/mips/boot/dts/
  MIPS: Netlogic: Move device-trees to arch/mips/boot/dts/
  MIPS: ralink: Move device-trees to arch/mips/boot/dts/

 arch/mips/Kconfig                                    |  5 +++++
 arch/mips/Makefile                                   | 11 +++++++++++
 arch/mips/boot/.gitignore                            |  1 +
 arch/mips/boot/dts/Makefile                          | 20 ++++++++++++++++++++
 arch/mips/{lantiq => boot}/dts/danube.dtsi           |  0
 arch/mips/{lantiq => boot}/dts/easy50712.dts         |  0
 arch/mips/{ralink => boot}/dts/mt7620a.dtsi          |  0
 arch/mips/{ralink => boot}/dts/mt7620a_eval.dts      |  0
 .../mips/{cavium-octeon => boot/dts}/octeon_3xxx.dts |  0
 .../mips/{cavium-octeon => boot/dts}/octeon_68xx.dts |  0
 arch/mips/{ralink => boot}/dts/rt2880.dtsi           |  0
 arch/mips/{ralink => boot}/dts/rt2880_eval.dts       |  0
 arch/mips/{ralink => boot}/dts/rt3050.dtsi           |  0
 arch/mips/{ralink => boot}/dts/rt3052_eval.dts       |  0
 arch/mips/{ralink => boot}/dts/rt3883.dtsi           |  0
 arch/mips/{ralink => boot}/dts/rt3883_eval.dts       |  0
 arch/mips/{mti-sead3 => boot/dts}/sead3.dts          |  0
 arch/mips/{netlogic => boot}/dts/xlp_evp.dts         |  0
 arch/mips/{netlogic => boot}/dts/xlp_fvp.dts         |  0
 arch/mips/{netlogic => boot}/dts/xlp_gvp.dts         |  0
 arch/mips/{netlogic => boot}/dts/xlp_svp.dts         |  0
 arch/mips/cavium-octeon/.gitignore                   |  2 --
 arch/mips/cavium-octeon/Makefile                     | 10 ----------
 arch/mips/lantiq/Kconfig                             |  1 +
 arch/mips/lantiq/Makefile                            |  2 --
 arch/mips/lantiq/dts/Makefile                        |  1 -
 arch/mips/mti-sead3/Makefile                         |  4 ----
 arch/mips/netlogic/Kconfig                           |  4 ++++
 arch/mips/netlogic/Makefile                          |  1 -
 arch/mips/netlogic/dts/Makefile                      |  4 ----
 arch/mips/ralink/Kconfig                             |  4 ++++
 arch/mips/ralink/Makefile                            |  2 --
 arch/mips/ralink/dts/Makefile                        |  4 ----
 33 files changed, 46 insertions(+), 30 deletions(-)
 create mode 100644 arch/mips/boot/dts/Makefile
 rename arch/mips/{lantiq => boot}/dts/danube.dtsi (100%)
 rename arch/mips/{lantiq => boot}/dts/easy50712.dts (100%)
 rename arch/mips/{ralink => boot}/dts/mt7620a.dtsi (100%)
 rename arch/mips/{ralink => boot}/dts/mt7620a_eval.dts (100%)
 rename arch/mips/{cavium-octeon => boot/dts}/octeon_3xxx.dts (100%)
 rename arch/mips/{cavium-octeon => boot/dts}/octeon_68xx.dts (100%)
 rename arch/mips/{ralink => boot}/dts/rt2880.dtsi (100%)
 rename arch/mips/{ralink => boot}/dts/rt2880_eval.dts (100%)
 rename arch/mips/{ralink => boot}/dts/rt3050.dtsi (100%)
 rename arch/mips/{ralink => boot}/dts/rt3052_eval.dts (100%)
 rename arch/mips/{ralink => boot}/dts/rt3883.dtsi (100%)
 rename arch/mips/{ralink => boot}/dts/rt3883_eval.dts (100%)
 rename arch/mips/{mti-sead3 => boot/dts}/sead3.dts (100%)
 rename arch/mips/{netlogic => boot}/dts/xlp_evp.dts (100%)
 rename arch/mips/{netlogic => boot}/dts/xlp_fvp.dts (100%)
 rename arch/mips/{netlogic => boot}/dts/xlp_gvp.dts (100%)
 rename arch/mips/{netlogic => boot}/dts/xlp_svp.dts (100%)
 delete mode 100644 arch/mips/cavium-octeon/.gitignore
 delete mode 100644 arch/mips/lantiq/dts/Makefile
 delete mode 100644 arch/mips/netlogic/dts/Makefile
 delete mode 100644 arch/mips/ralink/dts/Makefile

-- 
2.1.0.rc2.206.gedb03e5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
