From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v1 0/3] mailbox: hisilicon: add Hi6220 mailbox driver
Date: Wed, 19 Aug 2015 17:37:32 +0800
Message-ID: <1439977055-1747-1-git-send-email-leo.yan@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yiping Xu <xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Jian Zhang <zhangjian001-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Zhenwei Wang <Zhenwei.wang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Haoju Mo <mohaoju-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Dan Zhao <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, kongfei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Guangyue Zeng <zengguangyue-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi6220 mailbox supports up to 32 channels. Each channel is unidirectional
with a maximum message size of 8 words. I/O is performed using register
access (there is no DMA) and the cell raises an interrupt when messages
are received.

This patch series is to implement Hi6220 mailbox driver. It registers
two channels into framework for communication with MCU, one is tx channel
and another is rx channel. Now mailbox driver is used to send message to
MCU to control dynamic voltage and frequency scaling for CPU, GPU and DDR.

Changes from RFC:
* According to Jassi's review, totally remove the abstract common driver
  layer and only commit driver dedicated for Hi6220
* According to Paul Bolle's review, fix typo issue for Kconfig and remove
  unnecessary dependency with OF and fix minor for mailbox driver
* Refine a little for dts nodes

Leo Yan (3):
  dt-bindings: mailbox: Document Hi6220 mailbox driver
  mailbox: Hi6220: add mailbox driver
  arm64: dts: add Hi6220 mailbox node

 .../bindings/mailbox/hisilicon,hi6220-mailbox.txt  |  57 +++
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts     |  20 +-
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi          |   8 +
 drivers/mailbox/Kconfig                            |   8 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/hi6220-mailbox.c                   | 513 +++++++++++++++++++++
 6 files changed, 605 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt
 create mode 100644 drivers/mailbox/hi6220-mailbox.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
