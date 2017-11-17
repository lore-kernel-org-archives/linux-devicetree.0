From: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v8 0/3] arm: npcm: add basic support for Nuvoton BMCs
Date: Fri, 17 Nov 2017 11:07:44 -0800
Message-ID: <20171117190747.21642-1-brendanhiggins@google.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, avifishman70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, julien.thierry-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Addressed comments from:
  - Rick (offline comments)
  - Julien: https://www.spinics.net/lists/arm-kernel/msg613222.html
  - Russell: https://www.spinics.net/lists/arm-kernel/msg613212.html
  - Tomer: https://www.spinics.net/lists/arm-kernel/msg614059.html
  - Rob: https://www.spinics.net/lists/arm-kernel/msg613355.html
  - Tomer

Summary of changes since previous update:
  - Arch support:
    - Cleaned up L2C aux values
    - Cleaned up memory barries
    - Renamed CPU_NPCM750 to ARCH_NPCM750
    - Other mostly cosmetic changes
  - DTS:
    - Added property to L2 cache
    - More clean up
  - No changes to MAINTAINERS since v5

Changes have been tested on the NPCM750 evaluation board.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
