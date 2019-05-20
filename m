From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: g12a: add tohdmitx
Date: Mon, 20 May 2019 14:18:34 -0700
Message-ID: <7hr28s7rkl.fsf@baylibre.com>
References: <20190516143216.6193-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190516143216.6193-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Add the hdmitx glue device linking the SoC audio interfaces to the
> embedded Synopsys hdmi controller.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Queued for v5.3,

>  Hi Kevin,
>
>  The related device driver and dt-binding have been merged in the ASoC
>  tree, for-5.3 branch [0]
>
>  This patch is based on the audio series I have just sent [1]. Like the
>  patches I have sent this week, they are all based on Linus's master
>  branch. This is done so it applies nicely when setup your branch based
>  on 5.2-rc1

Thanks, for the detailed description,

Kevin
