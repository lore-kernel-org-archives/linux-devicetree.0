From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/5] arm64: dts: renesas: r8a77970: enable HDMI output
Date: Thu,  8 Feb 2018 16:47:15 +0100
Message-ID: <20180208154720.5766-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-Id: devicetree@vger.kernel.org

Hi,

This series enables the HDMI out put on V3M. It is based on top of the
latest renesas-drivers release and depends on patches from both Laurent
and Sergei.

- [PATCH v2 00/12] R-Car DU: Convert LVDS code to bridge driver
- [PATCH v2 0/2] Add R-Car V3M (R8A77970) support to the DU driver
- [PATCH 0/3] Add R-Car V3M (R8A77970) support to the R-Car LVDS driver

It is tested on V3M by connecting the HDMI output to a monitor and
booting the board. To console will eventually show up on the screen.

* Changes since v1.
- Replace patches 1-3 by patches posted by Sergei which I had missed.
- Fixed comment on 4/5 by adding reset and power-domain properties.

Niklas Söderlund (2):
  arm64: dts: renesas: r8a77970: add the LVDS instance
  arm64: dts: renesas: eagle: add HDMI output using the ADV7511W

Sergei Shtylyov (3):
  arm64: dts: renesass: r8a77970: add FCPVD support
  arm64: dts: renesass: r8a77970: add VSPD support
  arm64: dts: renesas: r8a77970: add DU support

 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 66 +++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77970.dtsi      | 73 ++++++++++++++++++++++++++
 2 files changed, 139 insertions(+)

-- 
2.16.1
