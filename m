From: =?UTF-8?q?Urs=20F=C3=A4ssler?= <urs.fassler-31H8OHFNM6fpWzRi28bHsw@public.gmane.org>
Subject: [PATCH v2] iio: adc128s052: add support for adc122s021
Date: Mon, 18 May 2015 15:22:43 +0200
Message-ID: <1431955364-25059-1-git-send-email-urs.fassler@bytesatwork.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, urs.fassler-31H8OHFNM6fpWzRi28bHsw@public.gmane.org
Cc: iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org, ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Changes in version 2:
- leave vendor prefix in compatible string of device tree
  (and rendering indention problem obsolete)
- add link to datasheet

Urs F=C3=A4ssler (1):
  iio: adc128s052: add support for adc122s021

 .../devicetree/bindings/iio/adc/ti-adc128s052.txt  |  4 +--
 drivers/iio/adc/Kconfig                            |  4 +--
 drivers/iio/adc/ti-adc128s052.c                    | 30 ++++++++++++++=
+++-----
 3 files changed, 28 insertions(+), 10 deletions(-)

--=20
2.1.4
