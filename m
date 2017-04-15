From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/3] Add R8A7745/SK-RZG1E PFC support
Date: Sat, 15 Apr 2017 23:18:25 +0300
Message-ID: <20170415201825.223149827@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20170410-v4.11-rc6' tag.  We're adding the R8A7745 PFC node and
then describe the pins for SCIF2 and Ether devices declared earlier. These
patches depend on the R8A7745 PFC suport in order to work properly.

[1/3] ARM: dts: r8a7745: add PFC support
[2/3] ARM: dts: sk-rzg1e: add SCIF2 pins
[3/3] ARM: dts: sk-rzg1e: add Ether pins

WBR, Sergei
