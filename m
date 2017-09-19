From: Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v6 0/3] arm: npcm: add basic support for Nuvoton BMCs
Date: Tue, 19 Sep 2017 15:39:58 -0700
Message-ID: <20170919224001.22284-1-brendanhiggins@google.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com, f.fainelli@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Addressed comments from:
  - Rob: https://www.spinics.net/lists/arm-kernel/msg606616.html

Changes since previous update:
  - Addressed some device tree issues pointed out by Rob.
  - No changes to mach-npcm since v5
  - No changes to MAINTAINERS since v5

Changes have been tested on the NPCM750 evaluation board.
