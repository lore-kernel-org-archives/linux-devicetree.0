From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 0/2] arm64: dts: meson: g12a: add tdm resets
Date: Tue, 27 Aug 2019 16:42:49 -0700
Message-ID: <7hh862tbt2.fsf@baylibre.com>
References: <20190820121551.18398-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190820121551.18398-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> This patchset adds the dedicated reset of the tdm formatters which
> have been added on the g12a SoC family. Using these help with the channel
> mapping when the formatter uses more than 1 i2s lane.

Because I forgot^W waited on this, we did the meson-g12a-common split,
so this no longer applies cleanly.  Could you rebase this on current v5.4/dt64
and I'll queue it for v5.4/dt64.

> Kevin, please note that to build, this patchset depends on the new reset
> bindings of the audio clock controller. I've prepared a tag for you [0]
>
> [0]: git://github.com/BayLibre/clk-meson.git - clk-meson-dt-v5.4-2

Thanks for the tag.  This is now included in v5.4/dt64.

Kevin
