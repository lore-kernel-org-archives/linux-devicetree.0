From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v10 3/4] ARM: dts: rockchip: add syscon-reboot-mode DT node
Date: Thu, 21 Jul 2016 00:01:23 +0200
Message-ID: <3833029.abRAq4Ccmc@diego>
References: <1467811081-20700-1-git-send-email-andy.yan@rock-chips.com> <1467811714-20878-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467811714-20878-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Yan <andy.yan@rock-chips.com>
Cc: sre@kernel.org, robh+dt@kernel.org, john.stultz@linaro.org, k.kozlowski@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, jun.nie@linaro.org, matthias.bgg@gmail.com, moritz.fischer@ettus.com
List-Id: devicetree@vger.kernel.org

Hi Andy,

Am Mittwoch, 6. Juli 2016, 21:28:34 schrieb Andy Yan:
> Rockchip platform use a SYSCON mapped register store
> the reboot mode magic value for bootloader to use when
> system reboot. So add syscon-reboot-mode driver DT node
> for rk3xxx/rk3036/rk3288 based platform
> 
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

just as a heads up, with the driver part applied, this part looks good as 
well. we're of course very close to the 4.7 release, so this will need to wait 
until after 4.8-rc1 as I'll need to do a shared branch for the rockchip_boot-
mode.h . I can do the separation myself then , so there is no need to resend
anything.


Heiko
