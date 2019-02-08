From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 1/2] arm64: dts: meson: g12a: fix clk_msr node
Date: Thu, 07 Feb 2019 16:49:44 -0800
Message-ID: <7hwombf6jb.fsf@baylibre.com>
References: <20190207132603.694-1-jbrunet@baylibre.com> <20190207132603.694-2-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207132603.694-2-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> The clk-msr node should be in cbus.
>
> Fixes: eeca2cf15e05 ("arm64: dts: meson: g12a: add clk measure support")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

This one I squashed with the original (in branch v5.1/dt64)

Kevin
