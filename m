From: Torsten Duwe <duwe@lst.de>
Subject: [PATCH v2 0/7] Add anx6345 DP/eDP bridge for Olimex Teres-I
Date: Tue,  4 Jun 2019 14:21:50 +0200 (CEST)
Message-ID: <20190604122150.29D6468B05@newverein.lst.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Harald Geyer <harald@ccbib.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


ANX6345 LVTTL->eDP video bridge, driver with device tree bindings.


Changes from v1:

* fixed up copyright information. Most code changes are only moves and thus
  retain copyright and module ownership. Even the new analogix-anx6345.c originates
  from the old 1495-line analogix-anx78xx.c, with 306 insertions and 987 deletions
  (ignoring the trivial anx78xx -> anx6345 replacements) 306 new vs. 508 old...

* fixed all minor formatting issues brought up

* merged previously separate new analogix_dp_i2c module into existing analogix_dp

* split additional defines into a preparatory patch

* renamed the factored-out common functions anx_aux_* -> anx_dp_aux_*, because
  anx_...aux_transfer was exported globally. Besides, it is now GPL-only exported.

* moved chip ID read into a separate function.

* keep the chip powered after a successful probe.
  (There's a good chance that this is the only display during boot!)

* updated the binding document: LVTTL input is now required, only the output side
  description is optional.

 Laurent: I have also looked into the drm_panel_bridge infrastructure,
 but it's not that trivial to convert these drivers to it.

Changes from the respective previous versions:

* the reset polarity is corrected in DT and the driver;
  things should be clearer now.

* as requested, add a panel (the known innolux,n116bge) and connect
  the ports.

* renamed dvdd?? to *-supply to match the established scheme

* trivial update to the #include list, to make it compile in 5.2

	Torsten
