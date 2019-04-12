From: megous via linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: [PATCH 0/3] Add basic support for RTC on Allwinner H6 SoC
Date: Fri, 12 Apr 2019 14:07:27 +0200
Message-ID: <20190412120730.473-1-megous@megous.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDXLF6FR5INBBBP7YHSQKGQEZ32FX6A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>

I went through the datasheets for H6 and H5, and compared the differences.
RTCs are largely similar, but not entirely compatible. Incompatibilities
are in details not yet implemented by the rtc driver though.

I also corrected the clock tree in H6 DTSI.

There's a small detail here, that's not described absolutely correctly in
DTSI, but the difference is not really that material. ext_osc32k is
originally modelled as a fixed clock that feeds into RTC module, but in
reality it's the RTC module that implements via its registers enabling and
disabling of this oscillator/clock.

Though:
- there's no other possible user of ext_osc32k than RTC module
- there's no other possible external configuration for the crystal
  circuit that would need to be handled in the dts per board

So I guess, while the description is not perfect, this patch series still
improves the current situation. Or maybe I'm misunderstanding something,
and &ext_osc32k node just describes a fact that there's a crystal on
the board. Then, everything is perhaps fine. :)

For now, the enable bit for this oscillator is toggled by the re-parenting
code automatically, as needed.

This patchset is necessary for implementing the WiFi/Bluetooth support
on boards using H6 SoC.

Please take a look.

Thank you and regards,
  Ondrej Jirman

Ondrej Jirman (3):
  dt-bindings: Add compatible for H6 RTC
  rtc: sun6i: Add support for H6 RTC
  arm64: dts: sun50i-h6: Add support for RTC and fix the clock tree

 .../devicetree/bindings/rtc/sun6i-rtc.txt     |  1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 30 +++++++-------
 drivers/rtc/rtc-sun6i.c                       | 40 ++++++++++++++++++-
 3 files changed, 55 insertions(+), 16 deletions(-)

-- 
2.21.0
