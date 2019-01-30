From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 00/10] arm64: dts: allwinner: h5: Enable CPU
 DVFS (cpufreq)
Date: Wed, 30 Jan 2019 16:41:53 +0800
Message-ID: <20190130084203.25053-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBB36GYXRAKGQEDXKQS5A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Emmanuel Vadot <manu-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Sergey Matyukevich <geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi everyone,

This series enables DVFS for the CPU cores (aka cpufreq) on the
Allwinner H5 SoC. The OPP table was taken from Armbian, with minor
tweaks to the maximum voltage to account for slightly increased voltage
on some of the boards.

This has been tested on the Bananapi M2+ v1.2 and Libre Computer
ALL-H3-CC H5 ver..  I do not have the remaining boards so I've CC-ed
people who did the original submission or have modified the board
specifically later on.

Patch 1 fixes the voltages specified for the GPIO-controlled regulator
on the Bananapi M2+ v1.2. The voltages are slightly higher than what
was originally written.

Patch 2 adds a fixed regulator for the CPU on the original Bananapi M2+.
This is for the retail version, not the engineering samples that had an
even higher voltage setting.

Patch 3 hooks up the CPU regulator supply for H5 boards that already
define the regulator, but were missing the property to tie it to the
CPUs.

Patch 4 ~ 8 adds the CPU regulator for boards that don't have it
defined. This is based on each vendor's schematics. I need people
to test each of these specifically and the whole series.

Patch 9 ties the CPU clock to the CPU cores.

Patch 10 adds the OPP table, based on the one from Armbian.

Please have a look and please help test this.


Regards
ChenYu


Chen-Yu Tsai (10):
  ARM: dts: sunxi: bananapi-m2-plus-v1.2: Fix CPU supply voltages
  ARM: dts: bananapi-m2-plus: Add CPU supply regulator
  arm64: dts: allwinner: h5: Hook up cpu regulator supplies
  arm64: dts: allwinner: h5: nanopi-neo2: Add CPU regulator supply
  arm64: dts: allwinner: h5: orange-pi-zero-plus: Add CPU regulator
    supply
  arm64: dts: allwinner: h5: orange-pi-zero-plus2: Add CPU regulator
    supply
  arm64: dts: allwinner: h5: orange-pi-pc2: Add CPU regulator supply
  arm64: dts: allwinner: h5: orange-pi-prime: Add CPU regulator supply
  arm64: dts: allwinner: h5: Add clock to CPU cores
  arm64: dts: allwinner: h5: Add CPU Operating Performance Points table

 .../boot/dts/sunxi-bananapi-m2-plus-v1.2.dtsi | 30 +++-----
 arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi | 14 ++++
 .../sun50i-h5-emlid-neutis-n5-devboard.dts    |  4 +
 .../allwinner/sun50i-h5-nanopi-neo-plus2.dts  |  4 +
 .../dts/allwinner/sun50i-h5-nanopi-neo2.dts   | 20 +++++
 .../dts/allwinner/sun50i-h5-orangepi-pc2.dts  | 28 +++++++
 .../allwinner/sun50i-h5-orangepi-prime.dts    | 28 +++++++
 .../sun50i-h5-orangepi-zero-plus.dts          | 20 +++++
 .../sun50i-h5-orangepi-zero-plus2.dts         | 20 +++++
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi  | 75 +++++++++++++++++++
 10 files changed, 224 insertions(+), 19 deletions(-)

-- 
2.20.1
