From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add R8A7792 I2C support
Date: Sat, 23 Jul 2016 22:15:56 +0300
Message-ID: <17288006.ERHB6654v5@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20160722-v4.7-rc7' tag plus the SDHI/I2C patches just posted.
We're adding the R8A7792 VIN clocks and device nodes. The patches have been
tested on the Blanche board with the switches set to the HDMI input mode...

[1/2] ARM: dts: r8a7792: add VIN clocks
[2/2] ARM: dts: r8a7792: add VIN support

WBR, Sergei
