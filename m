Return-Path: <SRS0=/eZE=QE=ysoft.com=michal.vokac@kernel.org>
From: =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH RESEND v2 0/4] Fix ssd1307fb OLED driver reset
Date: Mon, 28 Jan 2019 12:52:59 +0100
Message-Id: <1548676383-29685-1-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <maxime.ripard@bootlin.com>, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
List-ID: <devicetree@vger.kernel.org>

Hi all,

this is my third attempt to fix the ssd1307fb OLED driver reset. In the
second attempt [1] Rob suggested to take different aproach. That is to
apply what was originaly part of the first round and eventually merged
but reverted later on [2][3].

The last patch in this series is a fixup for the single user (in-tree)
that uses this OLED. Rob suggested the fixup may actually be applied
only after someone complains their display broke.

And a comment from Alexandre regarding the status of the Crystalfontz
platform:

On 20.12.2018 13:35, Alexandre Belloni wrote:
> Honestly, the platform has been discontinued and I don't really think
> it is worth having that fixup in the tree forever.

Thank you,
Michal

[1] https://patchwork.kernel.org/patch/10665597/#22327227
[2] https://patchwork.kernel.org/patch/10617729/
[3] https://patchwork.kernel.org/patch/10617731/#22257175

Michal Vokáč (4):
  dt-bindings: display: ssd1307fb: Remove reset-active-low from examples
  video: ssd1307fb: Do not hard code active-low reset sequence
  ARM: dts: imx28-cfa10036: Fix the reset gpio signal polarity
  ARM: mxs: cfa10036: Fixup OLED display reset polarity

 .../devicetree/bindings/display/ssd1307fb.txt      |  2 -
 arch/arm/boot/dts/imx28-cfa10036.dts               |  3 +-
 arch/arm/mach-mxs/mach-mxs.c                       | 44 ++++++++++++++++++++++
 drivers/video/fbdev/ssd1307fb.c                    |  4 +-
 4 files changed, 48 insertions(+), 5 deletions(-)

-- 
2.1.4
