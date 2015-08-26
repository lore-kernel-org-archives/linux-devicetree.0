From: Caesar Wang <wxt@rock-chips.com>
Subject: Re: [RESEND PATCH v16 3/4] soc: rockchip: power-domain: Add power
 domain driver
Date: Wed, 26 Aug 2015 17:27:59 +0800
Message-ID: <55DD869F.9010309@rock-chips.com>
References: <1440487486-6154-1-git-send-email-wxt@rock-chips.com> <1440487486-6154-4-git-send-email-wxt@rock-chips.com> <7hwpwjaxxv.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7hwpwjaxxv.fsf@deeprootsystems.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: Caesar Wang <wxt@rock-chips.com>, devicetree@vger.kernel.org, ulf.hansson@linaro.org, linux@arm.linux.org.uk, heiko@sntech.de, arnd@arndb.de, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, dmitry.torokhov@gmail.com, tomasz.figa@gmail.com, dianders@chromium.org, linux-rockchip@lists.infradead.org, "jinkun.hong" <jinkun.hong@rock-chips.com>, robh+dt@kernel.org, galak@codeaurora.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



=E5=9C=A8 2015=E5=B9=B408=E6=9C=8826=E6=97=A5 04:57, Kevin Hilman =E5=86=
=99=E9=81=93:
> Caesar Wang <wxt@rock-chips.com> writes:
>
>> This driver is found on RK3288 SoCs.
>>
>> In order to meet high performance and low power requirements, a powe=
r
>> management unit is designed or saving power when RK3288 in low power
>> mode.
>> The RK3288 PMU is dedicated for managing the power of the whole chip=
=2E
>>
>> PMU can work in the Low Power Mode by setting bit[0] of PMU_PWRMODE_=
CON
>> register. After setting the register, PMU would enter the Low Power =
mode.
>> In the low power mode, pmu will auto power on/off the specified powe=
r
>> domain, send idle req to specified power domain, shut down/up pll an=
d
>> so on. All of above are configurable by setting corresponding regist=
ers.
>>
>> Signed-off-by: jinkun.hong <jinkun.hong@rock-chips.com>
>> Signed-off-by: Caesar Wang <wxt@rock-chips.com>
> [...]
>
>> diff --git a/drivers/soc/rockchip/Kconfig b/drivers/soc/rockchip/Kco=
nfig
>> new file mode 100644
>> index 0000000..87a09c3
>> --- /dev/null
>> +++ b/drivers/soc/rockchip/Kconfig
>> @@ -0,0 +1,13 @@
>> +#
>> +# Rockchip Soc drivers
>> +#
>> +config PM_GENERIC_DOMAINS
> Why are you (re)defining this config option?  This name is already us=
ed in kernel/pm/Kconfig.

=46ixed.

----
Thanks,
Caesar

> Kevin
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
