From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v3 0/3] arm64: dts: Draak: Enable video inputs and VIN4
Date: Fri, 18 May 2018 16:47:55 +0200
Message-ID: <1526654878-11143-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com, horms@verge.net.au, geert@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,
  this series enables HDMI, CVBS and VIN4 for R8A77995 Draak board.

Compared to v2, I have added review tags and a missing Signed-off-by line.
Two small comments added to Draak DTS to describe the shared video input path
between CVBS and HDMI. As in v2, CVBS is the default video input and thus is
connected to VIN in DTS.

Switching to HDMI is shown in the patch on top of the following branch:
git://jmondi.org/linux d3/media-master/salvator-x-dts_csi2/d3-hdmi

Simon: once the series this one depends on [1] has been accepted, I guess this
one is ready to get in, right?

The series has been developed on top of media-master tree but applies cleanly
on top of latest renesas-driver.

Thanks
   j

[1] [PATCH v3 0/9] rcar-vin: Add support for parallel input on Gen3

v2 -> v3:
- Add comment to CVBS and HDMI inputs
- Add missing Signed-off-by to [2/3]
- Add Niklas' tag

Jacopo Mondi (3):
  dt-bindings: media: rcar-vin: Add R8A77995 support
  arm64: dts: renesas: draak: Describe CVBS input
  arm64: dts: renesas: draak: Describe HDMI input

 .../devicetree/bindings/media/rcar_vin.txt         |  1 +
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts     | 90 ++++++++++++++++++++++
 2 files changed, 91 insertions(+)

--
2.7.4
