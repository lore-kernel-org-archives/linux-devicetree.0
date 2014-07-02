From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add R8A7791/Henninger board CAN DT support
Date: Thu, 3 Jul 2014 02:39:14 +0400
Message-ID: <201407030239.15921.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-v3.16-rc3-20140701' tag. Here we add the CAN device tree support
for the R8A7791-based Henninger board. It depends on the PFC CAN support and
R-Car CAN device tree support patches posted yesterday in order to work.

[1/2] ARM: shmobile: r8a7791: add CAN DT support
[2/2] ARM: shmobile: henninger: add CAN0 DT support

WBR, Sergei
