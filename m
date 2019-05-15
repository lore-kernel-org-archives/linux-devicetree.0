From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 0/3] arm64: dts: meson: g12a: add mmc B and C
Date: Tue, 14 May 2019 17:23:54 -0700
Message-ID: <7hd0kkd0px.fsf@baylibre.com>
References: <20190514091611.15278-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190514091611.15278-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> This patchset adds the MMC controller B and C to the g12a SoC as well
> as the u200 and sei510 boards.
>
> MMC controller A has been left out on purpose. This controller is
> special on this SoC family and will be added later on.
>
> Notice the use of the pinconf DT property 'drive-strength-microamp'.
> Support for this property is not yet merged in meson pinctrl driver but
> the DT part as been acked by the DT maintainer [0] so it should be safe
> to use.
>
> [0]: https://lkml.kernel.org/r/20190513152451.GA25690@bogus

Queued for v5.3 with tags from Neil and Martin,

Kevin
