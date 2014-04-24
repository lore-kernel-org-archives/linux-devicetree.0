From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add R8A7791/Henninger board DT support
Date: Fri, 25 Apr 2014 02:39:38 +0400
Message-ID: <201404250239.39150.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, magnus.damm@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-v3.15-rc2-20140421' tag. Here we add support for the R8A7791-
based Henninger board AKA R-Car M2 Low Cost Development Platform (M2-LCDP);
this board is very like already supported Koelsch board, although some
differences do exist. The board can be booted using the device tree only, with
no pre-requisites...

[1/2] ARM: shmobile: Henninger: initial device tree
[2/2] ARM: shmobile: Henninger: add Ether DT support

WBR, Sergei
