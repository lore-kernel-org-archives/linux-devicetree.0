From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v5 0/2] Add R8A7790/Lager board PCI USB DT support
Date: Tue, 24 Jun 2014 21:57:04 +0400
Message-ID: <201406242157.05973.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, ben.dooks@codethink.co.uk
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-v3.16-rc2-20140623' tag. Here we add PCI USB device tree support
for the R8A7790-based Lager board. As the 'pci-rcar-gen2' driver device tree
support has been merged for 3.16, this patchset can now be merged too...

[1/2] ARM: shmobile: r8a7790: add internal PCI bridge nodes
[2/2] ARM: shmobile: lager: enable internal PCI

WBR, Sergei
