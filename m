From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: g12a: set uart_ao clocks
Date: Tue, 14 May 2019 17:23:13 -0700
Message-ID: <7hh89wd0r2.fsf@baylibre.com>
References: <20190514094537.8765-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190514094537.8765-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Now that the AO clock controller is available, make the uarts of the
> always-on domain claim the appropriate peripheral clock.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Queued for v5.3 with tags from Neil and Martin,

Thanks,

Kevin
