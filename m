From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 0/4] ARM64: dts: meson: hhi syscon and clock controllers
Date: Thu, 19 Apr 2018 10:41:20 -0700
Message-ID: <7h1sfb5c1r.fsf@baylibre.com>
References: <20180315115545.1884-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180315115545.1884-1-jbrunet@baylibre.com> (Jerome Brunet's
        message of "Thu, 15 Mar 2018 12:55:41 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Carlo Caione <carlo@caione.org>, Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> The HHI register region provides more than just clocks. Several drivers may
> need to access this region, such as the clock controllers and the display
> driver.
>
> Meson-gx clock controllers has been developed and merged before we knew the
> hhi could be needed elsewhere, which is why it requests the region directly.
> Meson-axg was built following the model of meson-gx.
>
> To fix this situation, the clock controller should be a child of the hhi
> system controllers. The hhi system controller node already exists on meson-gx.
> It needs to be added on the axg.
>
> This changeset depends on [0]. This dependency has been merged in
> clk-next. A topic branch is available here [1]

As the dependencies are now merged for v4.17, applying this to
v4.18/dt64,

Thanks,

Kevin
