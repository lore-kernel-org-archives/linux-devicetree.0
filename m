From: Sam Shih <sam.shih@mediatek.com>
Subject: [PATCH 0/1] Add mt7629 pwm support
Date: Mon, 30 Sep 2019 17:59:44 +0800
Message-ID: <1569837585-13247-1-git-send-email-sam.shih@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Sam Shih <sam.shih@mediatek.com>
List-Id: devicetree@vger.kernel.org

This adds pwm support for MT7629.
Separate this dtsi update from pwm patches series,

Used:
https://patchwork.kernel.org/patch/11160851/

Related dependent driver updates have been merged into maintainer's kernel
source tree.

Sam Shih (1):
  arm: dts: mediatek: add mt7629 pwm support

 arch/arm/boot/dts/mt7629.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

-- 
2.17.1
