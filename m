From: =?UTF-8?q?Urs=20F=C3=A4ssler?= <urs.fassler-31H8OHFNM6fpWzRi28bHsw@public.gmane.org>
Subject: [PATCH] iio: adc128s052: add support for adc122s021
Date: Mon, 18 May 2015 14:04:35 +0200
Message-ID: <1431950676-22379-1-git-send-email-urs.fassler@bytesatwork.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, urs.fassler-31H8OHFNM6fpWzRi28bHsw@public.gmane.org
Cc: iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org, ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds support for the 2 channel ADC adc122s021.
Since I only have an adc122s021 at hand, I can not test the adc128s052 =
part.
Patch is built against v4.1-rc2.

Urs F=C3=A4ssler (1):
  iio: adc128s052: add support for adc122s021

 .../devicetree/bindings/iio/adc/ti-adc128s052.txt  |  6 ++---
 drivers/iio/adc/Kconfig                            |  4 ++--
 drivers/iio/adc/ti-adc128s052.c                    | 27 ++++++++++++++=
++++----
 3 files changed, 27 insertions(+), 10 deletions(-)

--=20
2.1.4
