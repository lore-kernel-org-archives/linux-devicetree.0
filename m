From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/3] Add R8A7791/Koelsch/Henninger board PCI DT support
Date: Tue, 20 May 2014 01:48:27 +0400
Message-ID: <201405200148.28683.sergei.shtylyov@cogentembedded.com>
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

   Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-v3.15-rc5-20140517' tag. Here we add internal PCI support for
the R8A7791-based Koelsch and Henninger boards for the sake of getting USB
EHCI/OHCI working...

[1/3] ARM: shmobile: r8a7791: add internal PCI bridge nodes
[2/3] ARM: shmobile: koelsch: enable internal PCI
[3/3] ARM: shmobile: henninger: enable internal PCI

WBR, Sergei
