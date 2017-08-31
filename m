From: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/3] arm: npcm: add basic support for Nuvoton BMCs
Date: Thu, 31 Aug 2017 15:53:57 -0700
Message-ID: <20170831225400.19756-1-brendanhiggins@google.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, avifishman70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


Addressed comments from:
  - Rob: http://www.spinics.net/lists/devicetree/msg192130.html
  - kbuild test robot: http://www.spinics.net/lists/devicetree/msg191902.html
  - kbuild test robot: http://www.spinics.net/lists/devicetree/msg191902.html

Changes since previous update:
  - Added dependency for !CPU_V6 and !CPU_V6K since headsmp.S depends on v7
    instructions
  - Dropped errata that depend on !ARCH_MULTIPLATFORM
  - Removed custom smp_init_cpus from smp_operations
  - Numerous changes to device tree support

Changes have been tested on the NPCM750 evaluation board.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
