From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 0/6] arm64: dts: meson: mmc clean-up
Date: Fri, 03 May 2019 15:04:27 -0700
Message-ID: <7hh8abkxec.fsf@baylibre.com>
References: <20190418122714.30805-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190418122714.30805-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, patchwork-bot+notify@kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> The patchset is bunch of clean-up found while debugging meson mmc.
>
> * The first 2 patches address the libretech-cc which actually uses 1.8v
>   eMMC modules.
> * Patch 3 is a pin bias fixup depending on mmc pins.
> * Patch 4 lower the mmc max frequencies on gx chips. It was not easy
>   to spot but, according to the datasheet, the maximum UHS rate
>   supported by these chips is 100MHz (SDR50). This explains why we
>   never really managed to get a stable SDR104. SDIO is limited to HS.
> * Patch 5 adds missing pinctrl definition on the vim2
> * Patch 6 remove hs400 from the supported modes of the vim2. This mode is
>   mode reliable enough with HW/SW ATM.

Queued for v5.3 (branch: v5.3/dt64)

Kevin
