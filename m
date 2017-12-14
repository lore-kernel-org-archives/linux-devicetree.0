From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2] ARM64: dts: meson-axg: add ethernet mac controller
Date: Thu, 14 Dec 2017 17:45:47 +0100
Message-ID: <1513269947.2261.9.camel@baylibre.com>
References: <20171214030242.113152-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171214030242.113152-1-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>, devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 2017-12-14 at 11:02 +0800, Yixun Lan wrote:
> ---
> Changes in v2 since [1]:
>  - rebase to kevin's v4.16/dt64 branch
>  - add Neil's Reviewed-by
>  - move clock info to board.dts instead of in soc.dtsi

You got this comment regarding the pwm clock setup. the setup of the pwm clocks
depends on the use case, so should defined depending on the requirement on the
board

This is not the case for the ethmac, the clock setup will be same for every
board, unless I missed something. the clock bindings should be defined in
meson-axg.dtsi, I think

>  - drop "meson-axg-dwmac" compatible string, since we didn't use this
>    we could re-add it later when we really need.
>  - note: to make ethernet work properly,it depend on clock & pinctrl[2],
>    to compile the DTS, the patch [3] is required.
>    the code part will be taken via clock & pinctrl subsystem tree.
