From: Torsten Duwe <duwe@lst.de>
Subject: [PATCH v2 0/4] Add missing device nodes for Olimex Teres-I
Date: Thu, 16 May 2019 17:49:43 +0200 (CEST)
Message-ID: <20190516154943.239E668B05@newverein.lst.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Harald Geyer <harald@ccbib.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, info@olimex.com
List-Id: devicetree@vger.kernel.org

Hi all,

based on Maxime's sunxi-dt64-for-5.2, here is what I found so far
still missing in the device tree. Those bits and pieces have already
been submitted but were not yet applied.

Changes since v1:

* lcd-rgb666-pins
            -----
* dvdd12-supply, dvdd25-supply now are required by the anx6345 bindings

* updated Harald's commit message, removing the ref to the now-deleted
  debug pin and added a "CTIA" (android) pinout mention.

* removed the refs to the old patchwork


	  Torsten
