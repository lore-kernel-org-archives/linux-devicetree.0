From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH RESEND 0/2] arm: dts: berlin: use stdout-path
Date: Mon, 14 Sep 2015 14:42:11 +0800
Message-ID: <1442212933-760-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@marvell.com>
List-Id: devicetree@vger.kernel.org

These two simple patches use stdout-path to specify the console.
The first patch add aliases for serial uarts. The second patch
removes the console argument from the command line, uses stdout-path
instead.

Jisheng Zhang (2):
  arm: dts: berlin: add aliases for serial
  arm: dts: berlin: use stdout-path

 arch/arm/boot/dts/berlin2-sony-nsz-gs7.dts        | 3 ++-
 arch/arm/boot/dts/berlin2.dtsi                    | 6 ++++++
 arch/arm/boot/dts/berlin2cd-google-chromecast.dts | 3 ++-
 arch/arm/boot/dts/berlin2cd.dtsi                  | 5 +++++
 arch/arm/boot/dts/berlin2q-marvell-dmp.dts        | 3 ++-
 arch/arm/boot/dts/berlin2q.dtsi                   | 5 +++++
 6 files changed, 22 insertions(+), 3 deletions(-)

-- 
2.5.1
