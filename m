From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 0/4] mmc: sunxi: Make sample clocks optional
Date: Sat, 16 Jul 2016 12:46:00 +0200
Message-ID: <1468665964-27142-1-git-send-email-hdegoede@redhat.com>
Return-path: <linux-mmc-owner@vger.kernel.org>
Sender: linux-mmc-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>
Cc: linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi All,

It turns out that sun4i / sun5i do not have sample clocks at all,
so make them optional. Also remove the DDR capability when there
are no sample clocks because DDR modes do not work reliably without
them (observed on an UTOO P66 tablet with eMMC).

Ulf, can you please merge the first 2 patches, patches 3-4 should
be merged through Maxime's sunxi/dts tree, but not before the first
2 have hit linux-next.

Regards,

Hans
