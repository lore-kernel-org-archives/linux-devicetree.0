From: <Yasunari.Takiguchi@sony.com>
Subject: [PATCH 5/5] media: Update MAINTAINERS file for CXD2880
Date: Thu, 6 Apr 2017 17:06:03 +0900
Message-ID: <1491465963-9793-1-git-send-email-Yasunari.Takiguchi@sony.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: tbird20d@gmail.com, frowand.list@gmail.com, Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>, Masayuki Yamamoto <Masayuki.Yamamoto@sony.com>, Hideki Nozawa <Hideki.Nozawa@sony.com>, Kota Yonezawa <Kota.Yonezawa@sony.com>, Toshihiko Matsumoto <Toshihiko.Matsumoto@sony.com>, Satoshi Watanabe <Satoshi.C.Watanabe@sony.com>
List-Id: devicetree@vger.kernel.org

From: Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>

This is MAINTAINERS file update about the driver for
Sony CXD2880 DVB-T2/T tuner + demodulator.

Signed-off-by: Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>
Signed-off-by: Masayuki Yamamoto <Masayuki.Yamamoto@sony.com>
Signed-off-by: Hideki Nozawa <Hideki.Nozawa@sony.com>
Signed-off-by: Kota Yonezawa <Kota.Yonezawa@sony.com>
Signed-off-by: Toshihiko Matsumoto <Toshihiko.Matsumoto@sony.com>
Signed-off-by: Satoshi Watanabe <Satoshi.C.Watanabe@sony.com>
---
 MAINTAINERS |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6640601..c34335d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8034,6 +8034,15 @@ T:	git git://linuxtv.org/media_tree.git
 S:	Supported
 F:	drivers/media/dvb-frontends/cxd2841er*
 
+MEDIA DRIVERS FOR CXD2880
+M:	Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>
+L:	linux-media@vger.kernel.org
+W:	http://linuxtv.org/
+T:	git git://linuxtv.org/media_tree.git
+S:	Supported
+F:	drivers/media/dvb-frontends/cxd2880/*
+F:	drivers/media/spi/cxd2880*
+
 MEDIA DRIVERS FOR HORUS3A
 M:	Sergey Kozlov <serjk@netup.ru>
 M:	Abylay Ospan <aospan@netup.ru>
-- 
1.7.9.5
