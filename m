From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v4 0/4] add clk controller driver for Meson-AXG SoC
Date: Wed, 06 Dec 2017 11:13:59 -0800
Message-ID: <7hmv2vsm88.fsf@baylibre.com>
References: <20171201012452.27086-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20171201012452.27086-1-yixun.lan@amlogic.com> (Yixun Lan's
        message of "Fri, 1 Dec 2017 09:24:48 +0800")
Sender: linux-clk-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Carlo Caione <carlo@caione.org>, Qiufang Dai <qiufang.dai@amlogic.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Yixun Lan <yixun.lan@amlogic.com> writes:

> Add driver for the clk controller which found in Meson AXG SoC
>
>   Note, we deliberately create a seperate source file for the Meson AXG
> series, instead of sharing code with previous GXBB/GXL - the file axg.c
> It would help us maintaining the code more easily.

In addition to the DT node-name fixup (c.f. reply on v3 series), I think
this series should also include a patch that switches the UART over to
the new clock provider (it's currently using the xtal fixed clock.)

This will also provide a simple way to validate/test the series.

Kevin
