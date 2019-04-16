From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 0/7] arm64: meson: g12a: add audio devices
Date: Tue, 16 Apr 2019 11:52:43 -0700
Message-ID: <7h5zrdpytg.fsf@baylibre.com>
References: <20190412125136.28232-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412125136.28232-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, patchwork-bot+notify@kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> This patchset adds most the audio devices of the g12a SoCs.
>
> Kevin, couple of things worth noting:
>  * This patch depends of the new audio clocks binding recently applied
>    by Neil [0].

Was this supposed to be part of the clk-headers dependency PR I
received?  /me looks... It looks like it's applied right after the tag I
pulled, so I doesn't look like it.

If I should queue $SUBJECT series up for 5.2, I'll need another stable
tag.

Kevin
