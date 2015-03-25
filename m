From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [GIT PULL] simple-mfd cleanup
Date: Wed, 25 Mar 2015 08:50:09 +0100
Message-ID: <CACRpkdYd3eHZK6vcJQDtuPQXa2GoGA3sEPb8yu8r21CmWpfvNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Bjorn Andersson <Bjorn.Andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi ARM SoC maintainers,

as discussed back and forth with Lee Jones & Arnd, here is the patch
set adding the "simple-mfd" subtree analogous to "simple-bus". I have
not got the attentions of some subsystem maintainers but I'm out of
patience and thus assume they just don't care. However for us in the ARM
OF/DT camp this is of great value.

It is mainly a cleanup, but since the Juno + ARM64 LED support depend
on it that has been added on top, tell me if you prefer that in a separate
pull request and I'll send you two individual ones instead.

Cleanups from Antoine Tenart and Alexandre Belloni depend on this.

Please pull this in.

Yours,
Linus Walleij

The following changes since commit c517d838eb7d07bbe9507871fab3931deccff539:

  Linux 4.0-rc1 (2015-02-22 18:21:14 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
tags/simple-mfd

for you to fetch changes up to 6bc267ba08f121c1ecde854abb15cf58f4f07ca1:

  arm64: add LEDs and some trigger support to defconfig (2015-03-25
08:41:20 +0100)

----------------------------------------------------------------
Support for "simple-mfd" compatible subtrees and updates
to drivers and device trees to account for this.

----------------------------------------------------------------
Linus Walleij (5):
      MFD/OF: document MFD devices and handle simple-mfd
      ARM: dts: update syscons to use simple-mfd
      leds: syscon: instantiate from platform device
      arm64: juno: Add APB registers and LEDs using syscon
      arm64: add LEDs and some trigger support to defconfig

 Documentation/devicetree/bindings/mfd/mfd.txt |  41 +++++++
 arch/arm/boot/dts/arm-realview-pb1176.dts     |   2 +-
 arch/arm/boot/dts/integrator.dtsi             |   4 +-
 arch/arm64/boot/dts/arm/juno-motherboard.dtsi |  68 +++++++++++
 arch/arm64/configs/defconfig                  |   6 +
 drivers/leds/leds-syscon.c                    | 170 +++++++++++++-------------
 drivers/of/platform.c                         |   1 +
 7 files changed, 204 insertions(+), 88 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/mfd.txt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
