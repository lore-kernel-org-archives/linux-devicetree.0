From: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v10 3/4] ARM: dts: rockchip: add syscon-reboot-mode DT
 node
Date: Thu, 21 Jul 2016 16:28:40 +0800
Message-ID: <5a7f6e2f-c7f5-6402-c0ed-364eda7da40e@rock-chips.com>
References: <1467811081-20700-1-git-send-email-andy.yan@rock-chips.com>
 <1467811714-20878-1-git-send-email-andy.yan@rock-chips.com>
 <3833029.abRAq4Ccmc@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3833029.abRAq4Ccmc@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
Cc: sre@kernel.org, robh+dt@kernel.org, john.stultz@linaro.org, k.kozlowski@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, jun.nie@linaro.org, matthias.bgg@gmail.com, moritz.fischer@ettus.com
List-Id: devicetree@vger.kernel.org

Hi Heiko:


On 2016=E5=B9=B407=E6=9C=8821=E6=97=A5 06:01, Heiko St=C3=BCbner wrote:
> Hi Andy,
>
> Am Mittwoch, 6. Juli 2016, 21:28:34 schrieb Andy Yan:
>> Rockchip platform use a SYSCON mapped register store
>> the reboot mode magic value for bootloader to use when
>> system reboot. So add syscon-reboot-mode driver DT node
>> for rk3xxx/rk3036/rk3288 based platform
>>
>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> just as a heads up, with the driver part applied, this part looks goo=
d as
> well. we're of course very close to the 4.7 release, so this will nee=
d to wait
> until after 4.8-rc1 as I'll need to do a shared branch for the rockch=
ip_boot-
> mode.h . I can do the separation myself then , so there is no need to=
 resend
> anything.

     Got it, thanks!
>
> Heiko
>
>
>
