From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 0/3] arm64: dts: allwinner: h6: orangepi: Enable
 USB 2.0 and LEDs
Date: Tue, 20 Nov 2018 14:53:08 +0800
Message-ID: <20181120065311.30009-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBYG6Z3PQKGQE73BEROY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

This small series enables USB 2.0 and LEDs on the Orange Pi Lite 2 and
Orange Pi One Plus. The two features are unrelated, but included in the
same series as the patch contexts overlap.

Patch one adds a fixed regulator to represent the board-wide 5V rail.
While not strictly necessary, this helps define the relationship between
regulators.

Patch two enables USB 2.0 host and OTG. Note that VBUS on both ports are
directly tied to the 5V rail, without any power switches or current
limiters.

Patch three add device nodes for the two LEDs. These LEDs are driven
directly by the GPIO pins, without a current limiting resistor. At the
default drive strength, the LEDs are quite bright.

Please have a look.
ChenYu

Chen-Yu Tsai (3):
  arm64: dts: allwinner: h6: orangepi: Add board-wide 5V regulator
  arm64: dts: allwinner: h6: orangepi: Enable USB 2.0 host and OTG ports
  arm64: dts: allwinner: h6: orangepi: Add device nodes for LEDs

 .../dts/allwinner/sun50i-h6-orangepi.dtsi     | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

-- 
2.19.1
