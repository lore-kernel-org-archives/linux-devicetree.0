From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v8] arm64: dts: meson-axg: switch uart_ao clock to CLK81
Date: Fri, 05 Jan 2018 15:01:58 -0800
Message-ID: <7hvagf29ll.fsf@baylibre.com>
References: <20171215141741.175985-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171215141741.175985-1-yixun.lan@amlogic.com> (Yixun Lan's
        message of "Fri, 15 Dec 2017 22:17:41 +0800")
Sender: linux-kernel-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, Qiufang Dai <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Yixun Lan <yixun.lan@amlogic.com> writes:

> Switch the uart_ao pclk to CLK81 since the clock driver is ready.
>
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>

Applied to v4.16/dt64 with Neil's tag.

Kevin
