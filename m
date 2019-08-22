From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 1/6] dt-bindings: clk: meson: add sm1 periph clock controller bindings
Date: Thu, 22 Aug 2019 13:49:00 -0700
Message-ID: <7hr25d2af7.fsf@baylibre.com>
References: <20190822142455.12506-1-narmstrong@baylibre.com> <20190822142455.12506-2-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190822142455.12506-2-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jbrunet@baylibre.com, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Update the documentation to support clock driver for the Amlogic SM1 SoC.
>
> SM1 clock tree is very close, the main differences are :
> - each CPU core can achieve a different frequency, albeit a common PLL
> - a similar tree as the clock tree has been added for the DynamIQ Shared Unit
> - has a new GP1 PLL used for the DynamIQ Shared Unit
> - SM1 has additional clocks like for CSI, NanoQ an other components
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
