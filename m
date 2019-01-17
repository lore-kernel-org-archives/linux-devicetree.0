From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: s400: enable sdr104 on sdio
Date: Thu, 17 Jan 2019 12:03:21 -0800
Message-ID: <7htvi7aw6u.fsf@baylibre.com>
References: <20190116175913.5907-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116175913.5907-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patchwork-bot+notify@kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> The bcm wifi/bt device on SDIO support SDR104 and it seems to work
> well following the recent mmc driver update, so enable this
> ultra high speed mode
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Queued for v5.1,

Thanks,

Kevin
