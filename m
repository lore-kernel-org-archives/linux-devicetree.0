From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v3 0/2] Add R8A7790/Lager board PCI USB DT support
Date: Wed, 21 May 2014 00:08:14 +0400
Message-ID: <201405210008.15145.sergei.shtylyov@cogentembedded.com>
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

   Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-v3.15-rc5-20140517' tag. Here we add PCI USB device tree support
for the R8A7790-based Lager board. The patchset requires the 'pci-rcar-gen2'
driver device tree support (re-posted yesterday) in order to work.

[1/2] ARM: shmobile: r8a7790: add internal PCI bridge nodes
[2/2] ARM: shmobile: lager: enable internal PCI

WBR, Sergei
