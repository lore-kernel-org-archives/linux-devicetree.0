From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a77995 and draak: enable PWM channels
Date: Wed,  4 Oct 2017 19:27:29 +0900
Message-ID: <1507112851-10042-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch set is based on the renesas-drivers.git /
renesas-drivers-2017-10-03-v4.14-rc3 tag.

This patch needs the pfc of PWM patch for r8a77995:
https://patchwork.kernel.org/patch/9984151/

Yoshihiro Shimoda (2):
  arm64: dts: renesas: r8a77995: add PWM device nodes
  arm64: dts: renesas: r8a77995: draak: enable PWM channel 0 and 1

 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 24 ++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi      | 40 ++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

-- 
1.9.1
