From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v2 1/4] clocksource: rockchip: Make the driver more
 compatible
Date: Tue, 29 Sep 2015 06:18:03 +0200
Message-ID: <560A10FB.7040408@linaro.org>
References: <1443147298-12603-1-git-send-email-wxt@rock-chips.com>
 <1443147298-12603-2-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443147298-12603-2-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Caesar Wang <wxt@rock-chips.com>, heiko@sntech.de, will.deacon@arm.com, catalin.marinas@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 09/25/2015 04:14 AM, Caesar Wang wrote:
> Build the arm64 SoCs (e.g.: RK3368) on Rockchip platform,
> There are some failure with build up on timer driver for rockchip.
>
> Says:
> /tmp/ccdAnNy5.s:47: Error: missing immediate expression at  operand 1=
 --
> `dsb`
> ...
>
> The problem was different semantics of dsb on btw arm32 and arm64,
> Here we can convert the dsb with insteading of dsb(sy).The "sy" param
> is the default which you are allow to omit, so on arm32 dsb()and dsb(=
sy)
> are the same.
>
> Signed-off-by: Caesar Wang <wxt@rock-chips.com>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
