From: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v10 3/4] ARM: dts: rockchip: add syscon-reboot-mode DT
 node
Date: Tue, 16 Aug 2016 18:51:46 +0800
Message-ID: <2b270880-62ee-0dc0-15e7-4e0b4bc76653@rock-chips.com>
References: <1467811081-20700-1-git-send-email-andy.yan@rock-chips.com>
 <3833029.abRAq4Ccmc@diego>
 <5a7f6e2f-c7f5-6402-c0ed-364eda7da40e@rock-chips.com>
 <1904400.cBk6EHq0Yx@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1904400.cBk6EHq0Yx@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: sre@kernel.org, robh+dt@kernel.org, john.stultz@linaro.org, k.kozlowski@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, jun.nie@linaro.org, matthias.bgg@gmail.com, moritz.fischer@ettus.com
List-Id: devicetree@vger.kernel.org

Hi Heiko:


On 2016年08月12日 02:23, Heiko Stuebner wrote:
> Hi Andy,
>
> Am Donnerstag, 21. Juli 2016, 16:28:40 CEST schrieb Andy Yan:
>> On 2016年07月21日 06:01, Heiko Stübner wrote:
>>> Am Mittwoch, 6. Juli 2016, 21:28:34 schrieb Andy Yan:
>>>> Rockchip platform use a SYSCON mapped register store
>>>> the reboot mode magic value for bootloader to use when
>>>> system reboot. So add syscon-reboot-mode driver DT node
>>>> for rk3xxx/rk3036/rk3288 based platform
>>>>
>>>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
>>>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>>> just as a heads up, with the driver part applied, this part looks good as
>>> well. we're of course very close to the 4.7 release, so this will need to
>>> wait until after 4.8-rc1 as I'll need to do a shared branch for the
>>> rockchip_boot- mode.h . I can do the separation myself then , so there is
>>> no need to resend anything.
>>       Got it, thanks!
> I've split the first patch and applied the 3 resulting dts patches now:
>
> https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=v4.9-shared/soc-hdr&id=18a21e2c079a01805607bb474b3536a99620d162
> https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=v4.9-armsoc/dts32&id=b60ab70bbeced9a780ba297ffc555bc3a8ae6045
> https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=v4.9-armsoc/dts64&id=2e9e2863c7bee8ef828924cb0cad900776cb6d08
>
> with some minor fixes, please double-check that I didn't mess up

     I've checked it, and tested it. All looks okay. Thanks.
>
>
> Thanks
> Heiko
>
>
>
