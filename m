From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v3 1/3] Add HS-USB device tree support for R8A7791/Koelsch/Henninger board
Date: Wed, 08 Oct 2014 21:59:04 +0400
Message-ID: <1511869.4ca9KHmSFr@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, yoshihiro.shimoda.uh@renesas.com
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20141007-v3.17' tag. Here we add the HS-USB device tree support
on the R8A7791/Koelsch/Henninger reference boards. The patchset requires the
USB PHY driver (already merged by Kishon and Greg) and the generic PHY support
patches for the HS-USB driver posted by Yoshihiro Shimoda in order to work...

[1/3] ARM: shmobile: r8a7791: add HS-USB device node
[2/3] ARM: shmobile: koelsch: enable HS-USB
[3/3] ARM: shmobile: henninger: enable HS-USB

WBR, Sergei

