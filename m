From: Xiubo Li <Li.Xiubo@freescale.com>
Subject: [PATCH 0/3] Add DTS node for FTM PWM
Date: Thu, 20 Mar 2014 13:12:02 +0800
Message-ID: <1395292325-8497-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawn.guo@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Xiubo Li <Li.Xiubo@freescale.com>
List-Id: devicetree@vger.kernel.org

Hi Shawn,

The FTM PWM driver has been applied by the Maintainer, so here I resend
this patches based upon git://git.linaro.org/people/shawnguo/linux-2.6.git
newest reporsitory.




Xiubo Li (3):
  ARM: dts: vf610: Add Freescale FTM PWM node. ==> resend v10
  ARM: dts: vf610-twr: Add PWM0's pinctrl node ==> new
  ARM: dts: vf610-twr: Enables FTM PWM device. ==> resend v10

 arch/arm/boot/dts/vf610-twr.dts | 17 +++++++++++++++++
 arch/arm/boot/dts/vf610.dtsi    | 13 +++++++++++++
 2 files changed, 30 insertions(+)

-- 
1.8.4
