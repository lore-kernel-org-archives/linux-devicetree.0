From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add R8A7792 EtherAVB support
Date: Tue, 05 Jul 2016 00:21:31 +0300
Message-ID: <3308853.O8HBuWdbK9@wasted.cogentembedded.com>
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
'renesas-devel-20160704-v4.7-rc6' tag plus the R8A7792 PFC/GPIO patchsets.
We're adding the R8A7792 EtherAVB clocks and device nodes. They have been
tested on the Blanche board (along with the EtherAVB patches)...

[1/2] ARM: dts: r8a7792: add EtherAVB clocks
[2/2] ARM: dts: r8a7792: add EtherAVB support

WBR, Sergei
