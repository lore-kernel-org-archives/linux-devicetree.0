From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add R8A7790 EtherAVB DT support
Date: Tue, 31 Mar 2015 00:56:45 +0300
Message-ID: <1625400.M0MxPQybIy@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20150330-v4.0-rc6' tag. Here we add the EtherAVB device tree
support for the R8A7790 SoC. The 2nd patch depends on the EtherAVB driver
posted recently for the bindings.

[1/2] ARM: shmobile: r8a7790: add EtherAVB clocks
[2/2] ARM: shmobile: r8a7790: add EtherAVB DT support

WBR, Sergei

