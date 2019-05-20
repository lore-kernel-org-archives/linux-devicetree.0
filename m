From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 0/8] arm64: dts: meson: g12a: add audio devices
Date: Mon, 20 May 2019 14:16:17 -0700
Message-ID: <7hy3307roe.fsf@baylibre.com>
References: <20190514142649.1127-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190514142649.1127-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> This patchset adds audio related devices to g12a SoC family.
> It adds the clock controller as well as the memory, tdm, spdif
> and pdm interfaces.
>
> At this stage, the HDMI and internal audio DAC are still missing.
>
> Notice the use of the pinconf DT property 'drive-strength-microamp'.
> Support for this property is not yet merged in meson pinctrl driver but
> the DT part as been acked by the DT maintainer [0] so it should be safe
> to use.

Oops, I replied to v1, but I actually queued this v2 series.

Thanks,

Kevin
