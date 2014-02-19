From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/2] Add Ether DT support for R8A7790/Lager reference board
Date: Thu, 20 Feb 2014 02:18:22 +0300
Message-ID: <201402200218.23099.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-v3.14-rc3-20140218' tag. Here we add the Ether device tree
support on the R8A7790/Lager reference board. The patchset requires the
'sh_eth' driver device tree support just merged to the 'net-next.git' repo in
order to work.

[1/2] ARM: shmobile: r8a7790: add Ether DT support
[2/2] ARM: shmobile: lager: add Ether DT support

WBR, Sergei
