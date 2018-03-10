From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 0/4] ARM: sunxi: Clean and improvements for multi-cluster SMP
Date: Sat, 10 Mar 2018 16:16:02 +0800
Message-ID: <CAGb2v67WVY0zPUhqy0nZOhKEfZskZvKcvUrUA_wghw=37Eq3sA@mail.gmail.com>
References: <20180308150012.19045-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180308150012.19045-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Mylene Josserand <mylene.josserand@bootlin.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 8, 2018 at 11:00 PM, Chen-Yu Tsai <wens@csie.org> wrote:
> Hi,
>
> This series is a bit of cleanup and improvement for the new
> multi-cluster SMP code for Allwinner A80 and A83T (soon) SoCs.
>
> The first patch is just a typo fix.
>
> The second and third patch add the use of the "enable-method" cpu
> property to enable SMP, instead of matching against the machine
> compatible. However, due to how init calls are sequenced, we still
> need to use a platform early_init call.
>
> The last patch splits out parts of the SoC-specific init code, i.e.
> the device node matching parts. This should help with Mylene's work
> on adding support for the A83T.
>
> Please have a look.
>
> Regards
> ChenYu
>
> Chen-Yu Tsai (4):
>   ARM: sunxi: mc-smp: Fix "lookback" typo
>   ARM: sunxi: mc-smp: Use DT enable-method for sun9i A80 SMP
>   ARM: dts: sun9i: Add enable-method for SMP support for the A80 SoC
>   ARM: sunxi: mc-smp: Split out SoC-specific device node lookup sequence

Merged all 4 patches.

ChenYu
