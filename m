From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/4] Add Ether DT support for R8A7778/BOCK-W reference board
Date: Sat, 7 Sep 2013 04:23:29 +0400
Message-ID: <201309070423.30672.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 4 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20130906' tag. Here we add the Ether device tree support working
on the R8A7778/BOCK-W reference board. The patchset requires the 'sh_eth' driver
device tree support posted earlier in order to work.

[1/4] ARM: shmobile: r8a7778: add Ether DT support
[2/4] ARM: shmobile: r8a7778: add Ether clock for DT case
[3/4] ARM: shmobile: bockw-reference: add Ether DT support
[4/4] ARM: shmobile: BOCK-W reference: add Ether PFC settings

WBR, Sergei
