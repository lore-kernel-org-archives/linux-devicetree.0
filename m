From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v3 0/2] Add USB PHY device tree support for R8A7790/Lager board
Date: Wed, 23 Jul 2014 01:13:45 +0400
Message-ID: <201407230113.46444.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-v3.16-rc5-20140722' tag. Here we add the USB PHY device tree
support on the R8A7790/Lager reference board. The patchset requires the USB PHY
driver (just re-posted) in order to work.

[1/2] ARM: shmobile: r8a7790: add USB PHY DT support
[2/2] ARM: shmobile: lager: enable USB PHY

WBR, Sergei
