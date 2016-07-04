From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add R8A7792 GPIO support
Date: Tue, 05 Jul 2016 00:10:17 +0300
Message-ID: <2706182.6XMBucurvj@wasted.cogentembedded.com>
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
'renesas-devel-20160704-v4.7-rc6' tag. We're adding the R8A7792 GPIO clocks and
device nodes. These patches depend on the R8A7792/Blanche PFC patchset in order
to compile and on the R8a7792 PFC driver patchset in order to work properly.

[1/2] ARM: dts: r8a7792: add GPIO clocks
[2/2] ARM: dts: r8a7792: add GPIO support

WBR, Sergei
