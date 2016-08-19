From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add R8A7792 VSP1V support
Date: Sat, 20 Aug 2016 01:17:09 +0300
Message-ID: <1635089.v8k0jcJkvb@wasted.cogentembedded.com>
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
'renesas-devel-20160817-v4.8-rc2' tag. We're adding the R8A7792 VSP1V clocks
and device nodes. The 2nd patch depends on the VSP1 driver patch in order for
the VSP1V core to be recognized by the driver. The patches have been tested on
the Blanche board...

[1/2] ARM: dts: r8a7792: add VSP1V clocks
[2/2] ARM: dts: r8a7792: add VSP1V support

WBR, Sergei
