From: "Leonid Segal" <leonid.s-/HTLZasLZWtl57MIdRCFDg@public.gmane.org>
Subject: [RESEND PATCH 0/1] arm64: dts: Add Variscite DART-SD410 Evaluation board dts
Date: Sun, 13 Aug 2017 12:42:47 +0300
Message-ID: <014601d31418$877c5780$96750680$@variscite.com>
Mime-Version: 1.0
Content-Type: text/plain;
        charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-us
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Leonid Segal' <leonid.s-/HTLZasLZWtl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add initial device tree support for Variscite DART-SD410 Evalueation board.
This board is also known as VAR-SD410CustomBoard.

checkpatch.pl gives warnings for some lines that are over 80 characters,
but I decided not to change them since similar lines in other dts files.

Patch has been tested on 96Boards Dragonboard410c and Variscite
SD410Customboard
Both Linaro Linux 17.06 release
https://discuss.96boards.org/t/linaro-linux-17-06-releases/2217


Signed-off-by: Leonid Segal <leonid.s-/HTLZasLZWtl57MIdRCFDg@public.gmane.org>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/apq8016-var-dart-pmic-pins.dtsi  |  53 +++
 .../boot/dts/qcom/apq8016-var-dart-soc-pins.dtsi   |  88 ++++
 arch/arm64/boot/dts/qcom/apq8016-var-dart.dts      |  21 +
 arch/arm64/boot/dts/qcom/apq8016-var-dart.dtsi     | 525
+++++++++++++++++++++
 5 files changed, 688 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/apq8016-var-dart-pmic-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/apq8016-var-dart-soc-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/apq8016-var-dart.dts
 create mode 100644 arch/arm64/boot/dts/qcom/apq8016-var-dart.dtsi
 
-- 
2.13.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
