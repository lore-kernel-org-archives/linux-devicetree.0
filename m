From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 1/5] ARM64: dts: meson: uart: fix address space range
Date: Mon, 08 Jan 2018 09:54:54 +0100
Message-ID: <1515401694.5048.69.camel@baylibre.com>
References: <20180106001044.108163-1-yixun.lan@amlogic.com>
         <20180106001044.108163-2-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180106001044.108163-2-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, 2018-01-06 at 08:10 +0800, Yixun Lan wrote:
> The address space range is actually 0x18, fixed here.
> 
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi |  4 ++--
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi  | 10 +++++-----
>  2 files changed, 7 insertions(+), 7 deletions(-)
