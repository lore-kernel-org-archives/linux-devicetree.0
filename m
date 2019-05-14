From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 1/3] arm64: dts: meson: g12a: add mmc nodes
Date: Tue, 14 May 2019 20:29:05 +0200
Message-ID: <CAFBinCCrJ+qXgKkDrePWGriYyttwjHV+8jgT=Hk55Mr0VNhw7A@mail.gmail.com>
References: <20190514091611.15278-1-jbrunet@baylibre.com> <20190514091611.15278-2-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190514091611.15278-2-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, May 14, 2019 at 11:16 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> Add port B (sdcard) and port C (eMMC) pinctrl and controllers nodes to
> the g12a DT.
I assume port A is missing due to the controller bug (missing DDR
access) for which Neil has sent a fix. this shouldn't stop us from
adding SD card and eMMC support though

first I was surprised to see that the MMC controllers are not part of any bus.
however, the public S922X datasheet mentions the MMC controllers
directly in the memory map (on page 83), so Jerome is doing the right
thing here as far as I can tell

> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
