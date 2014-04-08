From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/2] Add USB PHY DT support for R8A7790/Lager reference board
Date: Wed, 9 Apr 2014 02:11:56 +0400
Message-ID: <201404090211.56867.sergei.shtylyov@cogentembedded.com>
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
'renesas-devel-v3.14-20140408' tag plus R8A7790/Lager PCI USB support patches
that I posted yesterday. Here we add the USB PHY device tree support on the
R8A7790/Lager reference board. The patchset requires the USB PHY driver (just
re-posted) in order to work.

[1/2] ARM: shmobile: r8a7790: add USB PHY DT support
[2/2] ARM: shmobile: lager: enable USB PHY

WBR, Sergei
