From: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Subject: [PATCH v2 0/3] Add basic support for RTC on Allwinner
 H6 SoC
Date: Tue, 20 Aug 2019 17:19:31 +0200
Message-ID: <20190820151934.3860-1-megous@megous.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDXLF6FR5INBBCM76DVAKGQESUDI3QA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
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

This patchset is necessary for implementing the WiFi/Bluetooth support
on boards using H6 SoC.

There was some discussion previously of describing HOSC, DCXO and XO
oscillators and clocks as part of RTC in DT, but I decided against it
because it's not necessary, becuse information that would be provided
as a part of DT can already be determined at runtime from RTC registers,
so this woudn't add any value and would only introduce complications
to the driver. See: https://patchwork.kernel.org/cover/10898083/

Please take a look.


Thank you and regards,
  Ondrej Jirman


Changes in v2:
- bindings converted to yaml
- added reviewed by tags

Ondrej Jirman (3):
  dt-bindings: Add compatible for H6 RTC
  rtc: sun6i: Add support for H6 RTC
  arm64: dts: sun50i-h6: Add support for RTC and fix the clock tree

 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 13 ++++++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 30 +++++++-------
 drivers/rtc/rtc-sun6i.c                       | 40 ++++++++++++++++++-
 3 files changed, 67 insertions(+), 16 deletions(-)

-- 
2.22.1
