From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] R8A7792 clock fixes
Date: Tue, 12 Jul 2016 00:50:16 +0300
Message-ID: <1529351.Fac5N2tKoF@wasted.cogentembedded.com>
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
'renesas-devel-20160711-v4.7-rc7' tag. I've found a couple of issues in the
R8A7792 DT clock descriptions, so these patches are targeted as fixes for 4.8.

[1/2] ARM: dts: r8a7792: add PLL1 divided by 2 clock
[2/2] ARM: dts: r8a7792: remove ADSP clock

WBR, Sergei
