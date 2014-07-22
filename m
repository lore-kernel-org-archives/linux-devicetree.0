From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v3 0/3] Add USB PHY device tree support for R8A7791/Koelsch/Henninger board
Date: Wed, 23 Jul 2014 01:22:48 +0400
Message-ID: <201407230122.49264.sergei.shtylyov@cogentembedded.com>
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

   Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-v3.16-rc5-20140722' tag. Here we add the USB PHY device tree
support on the R8A7791/Koelsch/Henninger boards. The patchset requires the USB
PHY driver (just re-posted) in order to work.

[1/3] ARM: shmobile: r8a7791: add USB PHY DT support
[2/3] ARM: shmobile: koelsch: enable USB PHY
[3/3] ARM: shmobile: henninger: enable USB PHY

WBR, Sergei
