From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH RESEND v5 0/3] Add support for Hi3660 mailbox driver
Date: Wed, 14 Feb 2018 11:49:48 +0800
Message-ID: <1518580191-26451-1-git-send-email-leo.yan@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kaihua Zhong <zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi3660 mailbox controller is used to send message within multiple
processors, MCU, HIFI, etc. This patch series is to implement an
initial version for Hi3660 mailbox driver with "automatic
acknowledge" mode.

The patch set have been verified with Hi3660 stub clock driver, so
we can send message to MCU to execute CPU frequency scaling. This is
tested on 96boards Hikey960.

Changes from v4:
* According to Jassi suggestion, refactored mailbox driver and removed
  "inline" for function declaration;

Changes from v3:
* According to Jassi suggestion, refined structure name to
  "struct hi3660_chan_info";
* According to Jassi suggestion, moved channel 'lock'+'acquire'
  operations into .startup();

Changes from v2:
* According to Mark Rutland suggestions, removed sev()/wfe() from
  driver, the system has no two masters sharing the same channel for
  data transferring so we don't need these instructions;
* Refined DT binding and doc according to Rob suggestions;
* Refined driver according to Julien suggestions;

Changes from v1:
* Added cover letter to track the changelog;
* Added document for DT binding;
* Refactored and simplized mailbox driver with "automatic ack" mode;
* Refined commit logs for patches;


Kaihua Zhong (2):
  mailbox: Add support for Hi3660 mailbox
  dts: arm64: Add mailbox binding for hi3660

Leo Yan (1):
  dt-bindings: mailbox: Introduce Hi3660 controller binding

 .../bindings/mailbox/hisilicon,hi3660-mailbox.txt  |  51 ++++
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi          |   8 +
 drivers/mailbox/Kconfig                            |   8 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/hi3660-mailbox.c                   | 316 +++++++++++++++++++++
 5 files changed, 385 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.txt
 create mode 100644 drivers/mailbox/hi3660-mailbox.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
