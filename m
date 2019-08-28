From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 0/2] arm64: dts: meson: g12a: add tdm resets
Date: Wed, 28 Aug 2019 10:03:10 +0200
Message-ID: <1j4l217m4h.fsf@starbuckisacylon.baylibre.com>
References: <20190820121551.18398-1-jbrunet@baylibre.com> <7hh862tbt2.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7hh862tbt2.fsf@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue 27 Aug 2019 at 16:42, Kevin Hilman <khilman@baylibre.com> wrote:

> Jerome Brunet <jbrunet@baylibre.com> writes:
>
>> This patchset adds the dedicated reset of the tdm formatters which
>> have been added on the g12a SoC family. Using these help with the channel
>> mapping when the formatter uses more than 1 i2s lane.
>
> Because I forgot^W waited on this, we did the meson-g12a-common split,
> so this no longer applies cleanly.  Could you rebase this on current v5.4/dt64
> and I'll queue it for v5.4/dt64.

Acutally it was already not applying when I sent this v1 ...
.. which is why I sent a v2 [0] ;)

[0]: https://lkml.kernel.org/r/20190823154432.16268-1-jbrunet@baylibre.com

>
>> Kevin, please note that to build, this patchset depends on the new reset
>> bindings of the audio clock controller. I've prepared a tag for you [0]
>>
>> [0]: git://github.com/BayLibre/clk-meson.git - clk-meson-dt-v5.4-2
>
> Thanks for the tag.  This is now included in v5.4/dt64.
>
> Kevin
