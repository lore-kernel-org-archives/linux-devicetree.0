From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v3 0/3] SY8106 regulator support and enable it
 on Orange Pi PC
Date: Mon, 23 Apr 2018 22:46:54 +0800
Message-ID: <20180423144657.63264-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBBHE67LAKGQEBMFDKPY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds dt-bindings and driver for Silergy SY8106A, and then
utilize it on the Orange Pi PC board, which uses SY8016A as its CPUX
(main ARM CPU cluster in an Allwinner SoC) power supply.

The driver's functionality is restricted now, mainly {en,dis}able function
is not yet implemented, as it cannot be debugged on Orange Pi PC
(disable it will kill Linux).

Ondrej Jirman (3):
  dt-bindings: add binding for the SY8106A voltage regulator
  regulator: add support for SY8106A regulator
  ARM: dts: sun8i: h3: Add SY8106A regulator to Orange Pi PC

 .../bindings/regulator/sy8106a-regulator.txt       |  23 +++
 arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts         |  28 ++++
 drivers/regulator/Kconfig                          |   8 +-
 drivers/regulator/Makefile                         |   2 +-
 drivers/regulator/sy8106a-regulator.c              | 183 +++++++++++++++++++++
 5 files changed, 242 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/sy8106a-regulator.txt
 create mode 100644 drivers/regulator/sy8106a-regulator.c

-- 
2.15.1
