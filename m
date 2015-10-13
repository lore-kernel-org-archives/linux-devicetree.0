From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 2/2][UPDATE] ARM: dts: replace gpio-key,wakeup with wakeup-source property
Date: Tue, 13 Oct 2015 19:52:11 +0200
Message-ID: <1561585.uublXABoq2@diego>
References: <1444743164-17735-2-git-send-email-sudeep.holla@arm.com> <1444747133-22671-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444747133-22671-1-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kevin Hilman <khilman@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-rockchip@lists.infradead.org, Viresh Kumar <viresh.kumar@linaro.org>
List-Id: devicetree@vger.kernel.org

Am Dienstag, 13. Oktober 2015, 15:38:53 schrieb Sudeep Holla:
> Keyboard driver for GPIO buttons(gpio-keys) checks for the legacy
> "gpio-key,wakeup" boolean property to enable gpio buttons as wakeup
> source.
> 
> Few dts files assign value "1" to gpio-key,wakeup and in one instance a
> value "0" is assigned probably assuming it won't be enabled as a wakeup
> source. Since the presence of the boolean property indicates it is
> enabled, value of "0" have no value.
> 
> This patch replaces the legacy "gpio-key,wakeup" with the unified
> "wakeup-source" property which inturn fixes the above mentioned issue.
> 
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: linux-rockchip@lists.infradead.org
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  arch/arm/boot/dts/rk3066a-bqcurie2.dts      | 3 +--
>  arch/arm/boot/dts/rk3066a-rayeager.dts      | 2 +-
>  arch/arm/boot/dts/rk3188-radxarock.dts      | 2 +-
>  arch/arm/boot/dts/rk3288-evb.dtsi           | 2 +-
>  arch/arm/boot/dts/rk3288-firefly.dtsi       | 2 +-
>  arch/arm/boot/dts/rk3288-popmetal.dts       | 2 +-
>  arch/arm/boot/dts/rk3288-r89.dts            | 2 +-
[...]
>  arch/arm64/boot/dts/rockchip/rk3368-r88.dts | 2 +-

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
