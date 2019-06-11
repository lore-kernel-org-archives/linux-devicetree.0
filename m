From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 0/2] arm64: dts: meson: sei510: add sound card
Date: Tue, 11 Jun 2019 16:05:56 -0700
Message-ID: <7himtb4t9n.fsf@baylibre.com>
References: <20190524140318.17608-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190524140318.17608-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> This patchset adds the sound card of sei510 board.
>
> Note #1:
> The patchset (build) depends on the tohdmitx ASoC patch [0] for the dt
> bindings of the tohdmitx glue. It also (run) depends on the mpll clock
> series [1] to get a correct clock sources.
>
> Note #2:
> I would normaly prefer to use the HIFI pll dedicated to audio to provide
> the base rate for the 48kHz audio family. HIFI pll rate precision is a
> little bit better than the MPLL. However, the HIFI pll may sometimes,
> rarely, take a long time to report a lock. I'm still debugging this.
> In the mean time, let's use MPLL2 instead.
>
> [0]: e35f5ad6a965 ("ASoC: meson: add tohdmitx DT bindings")
> [1]: https://lkml.kernel.org/r/20190513123115.18145-1-jbrunet@baylibre.com

All dependencies are merged or queued for v5.3, so queuing this for v5.3
also,

Kevin
