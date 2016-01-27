From: John Stultz <john.stultz@linaro.org>
Subject: [RFC][PATCH 0/3] SRAM reboot mode driver
Date: Tue, 26 Jan 2016 16:37:57 -0800
Message-ID: <1453855080-17760-1-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: John Stultz <john.stultz@linaro.org>, Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Caesar Wang <wxt@rock-chips.com>, Kees Cook <keescook@chromium.org>, Guodong Xu <guodong.xu@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Vishal Bhoj <vishal.bhoj@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

This patchset extends on Andy Yan's reboot mode driver
work from here: https://lkml.org/lkml/2016/1/12/315

It adds reboot mode/reason support for devices that use
an SRAM location to communicate with the bootloader.

Doing this via an SRAM subnode was a suggestion from
Arnd, but I worry this implementation isn't yet ideal,
since I spent quite a bit of time futzing with getting
the sram dts entry to work properly. So I suspect there
will be a number of suggestions for improvements.

Again, this series dependson Andy's patch set above,
but also was developed & tested against the 4.1 based
hikey tree, so at least the hikey dts patch won't apply.
I'm mostly sending this out for just a rough initial
review of the dts and conceptual usage of sram subnodes.

Also, it was pointed out that the hikey dts entry for
this really should be added by the UEFI firmware, since
alternative bootloaders may be used which do not support
this feature. So the hikey dts patch isn't likely to ever
go upstream, but its a useful illustration for how other
devices might use this driver.

Cc: Andy Yan <andy.yan@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Thierry Reding <treding@nvidia.com>
Cc: Heiko St=C3=BCbner <heiko@sntech.de>
Cc: Caesar Wang <wxt@rock-chips.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Guodong Xu <guodong.xu@linaro.org>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Vishal Bhoj <vishal.bhoj@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: devicetree@vger.kernel.org
Cc: Android Kernel Team <kernel-team@android.com>

John Stultz (3):
  dt-bindings: power: reset: Add document for sram-reboot-mode driver
  power: reset: Add sram-reboot-mode driver
  dts: hikey: Add hikey support for sram-reboot-mode

 .../bindings/power/reset/sram-reboot-mode.txt      | 47 ++++++++++++++=
+
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts     | 36 ++++++++++++
 arch/arm64/configs/hikey_defconfig                 |  3 +
 drivers/power/reset/Kconfig                        |  9 +++
 drivers/power/reset/Makefile                       |  1 +
 drivers/power/reset/sram-reboot-mode.c             | 66 ++++++++++++++=
++++++++
 6 files changed, 162 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/reset/sram-=
reboot-mode.txt
 create mode 100644 drivers/power/reset/sram-reboot-mode.c

--=20
1.9.1
