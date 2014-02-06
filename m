From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add Ether DT support for R8A7791/Koelsch reference board
Date: Fri, 7 Feb 2014 01:10:17 +0300
Message-ID: <201402070110.18561.sergei.shtylyov@cogentembedded.com>
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
'renesas-devel-v3.14-rc1-20140206v2' tag. Here we add the Ether device tree
support working on the R8A7791/Koelsch reference board. The patchset requires
the 'sh_eth' driver device tree support posted earlier in order to work.

[1/2] ARM: shmobile: r8a7791: add Ether DT support
[2/2] ARM: shmobile: koelsch: add Ether DT support

WBR, Sergei
