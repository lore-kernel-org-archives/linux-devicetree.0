From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 0/7] mfd: ac100: Add support for X-Powers
 AC100 audio codec / RTC combo IC
Date: Mon, 8 Aug 2016 13:01:32 +0100
Message-ID: <20160808120132.GQ5243@dell>
References: <1467988422-17934-1-git-send-email-wens@csie.org>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <rtc-linux+bncBDA7X7F2WUEBBRPIUG6QKGQEH7CCSDY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1467988422-17934-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Enjoy!

The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc=
:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-rtc=
-v4.9

for you to fetch changes up to 04940631b8d2b2e57a13b6d4ca50dfe5994b514f:

  rtc: ac100: Add clk output support (2016-08-08 12:54:05 +0100)

----------------------------------------------------------------
Immutable branch between MFD and RTC, due for the v4.9 merge-window.

----------------------------------------------------------------
Chen-Yu Tsai (4):
      mfd: ac100: Add device tree bindings for X-Powers AC100 codec/RTC com=
bo IC
      mfd: ac100: Add driver for X-Powers AC100 audio codec / RTC combo IC
      rtc: ac100: Add RTC driver for X-Powers AC100
      rtc: ac100: Add clk output support

 Documentation/devicetree/bindings/mfd/ac100.txt |  54 ++
 drivers/mfd/Kconfig                             |  10 +
 drivers/mfd/Makefile                            |   2 +
 drivers/mfd/ac100.c                             | 137 ++++++
 drivers/rtc/Kconfig                             |  10 +
 drivers/rtc/Makefile                            |   1 +
 drivers/rtc/rtc-ac100.c                         | 627 ++++++++++++++++++++=
++++
 include/linux/mfd/ac100.h                       | 178 +++++++
 8 files changed, 1019 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/ac100.txt
 create mode 100644 drivers/mfd/ac100.c
 create mode 100644 drivers/rtc/rtc-ac100.c
 create mode 100644 include/linux/mfd/ac100.h

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

--=20
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
---=20
You received this message because you are subscribed to the Google Groups "=
rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
