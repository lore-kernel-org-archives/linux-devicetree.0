From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/3] Add R8A7792/Blanche PFC support
Date: Thu, 14 Jul 2016 23:58:49 +0300
Message-ID: <5383928.8UnDsUpmkz@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20160711-v4.7-rc7' tag. We're adding the R8A7792 PFC node and
then describe the pins for the SCIFs and SMSC LAN89218 Ethernet chip found on
the Blanche board. These patches depend on the R8A7792 PFC driver patchset
in order to work properly.

[1/3] ARM: dts: r8a7792: add PFC support
[2/3] ARM: dts: blanche: add SCIF0/3 pins
[3/3] ARM: dts: blanche: add Ethernet pins

WBR, Sergei
