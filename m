From: Olliver Schinagl <oliver@schinagl.nl>
Subject: [PATCH] ARM: dts: sunxi enable otg port on the sun7i-a20-olinuxino-lime2
Date: Sun,  9 Aug 2015 20:22:57 +0200
Message-ID: <1439144578-7890-1-git-send-email-oliver@schinagl.nl>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Olliver Schinagl <oliver+list@schinagl.nl>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, galak@codeaurora.org, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Olliver Schinagl <o.schinagl@ultimaker.com>, Olliver Schinagl <oliver@schinagl.nl>
List-Id: devicetree@vger.kernel.org

From: Olliver Schinagl <o.schinagl@ultimaker.com>

This patch enables the recently introduced OTG support for the OLinuXino Lime2.
Tested with a keyboard and some USB mass-storage flash-drives and various
hotplug.

Signed-off-by: Olliver Schinagl <oliver@schinagl.nl>

Olliver Schinagl (1):
  ARM: dts: sunxi: enable otg port on the sun7i-a20-olinuxino-lime2

 arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts | 41 +++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

-- 
2.1.4
