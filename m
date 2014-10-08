From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v4 0/2] Add HS-USB device tree support for R8A7790/Lager board
Date: Wed, 08 Oct 2014 23:53:11 +0400
Message-ID: <1674850.BZpGW9kEud@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, yoshihiro.shimoda.uh@renesas.com
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20141007-v3.17' tag. Here we add the HS-USB device tree support
on the R8A7790/Lager reference board. The patchset requires the USB PHY
driver (already merged by Kishon and Greg) and the generic PHY support patches
for the HS-USB driver posted by Yoshihiro Shimoda in order to work...

[1/2] ARM: shmobile: r8a7790: add HS-USB device node
[2/2] ARM: shmobile: lager: enable HS-USB

WBR, Sergei

