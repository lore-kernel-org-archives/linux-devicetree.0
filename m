From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 8/9] ARM: dts: sun7i: bananapi-m1-plus: Add
 PMIC regulators and OPPs for cpufreq
Date: Tue, 12 Jul 2016 10:12:46 +0800
Message-ID: <CAGb2v655vL=U7MyzTY_Khx-bCWorb-WbQCaFm_e-yH8+dGhddQ@mail.gmail.com>
References: <1467796250-22010-1-git-send-email-wens@csie.org>
 <1467796250-22010-9-git-send-email-wens@csie.org> <20160709081827.GF4522@lukather>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBNNESG6AKGQE5NYOIQQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160709081827.GF4522@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Sat, Jul 9, 2016 at 4:18 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hi,
>
> On Wed, Jul 06, 2016 at 05:10:49PM +0800, Chen-Yu Tsai wrote:
>> The Bananapi M1+, like other Allwinner A20 based boards, uses the AXP209
>> PMIC to supply its power. The vendor FEX file's DVFS table suggests the
>> board's CPU power rail has a voltage drop of 25 ~ 50 mV.
>>
>> Add the PMIC regulator nodes and copy the DVFS table from the FEX file.
>>
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts | 48 ++++++++++++++++++++++--
>>  1 file changed, 44 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts b/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
>> index ba5bca0fe997..7bb418bd1b6e 100644
>> --- a/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
>> +++ b/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
>> @@ -105,6 +105,22 @@
>>       status = "okay";
>>  };
>>
>> +&cpu0 {
>> +     cpu-supply = <&reg_dcdc2>;
>> +
>> +     /* The custom DVFS table suggests a voltage drop of 25 ~ 50 mV */
>> +     operating-points = <
>> +             /* kHz    uV */
>> +             1080000 1450000
>> +             912000  1425000
>> +             864000  1350000
>> +             720000  1250000
>> +             528000  1150000
>> +             312000  1100000
>> +             144000  1050000
>> +             >;
>> +};
>> +
>
> We've always tried to not use all the non-sense OPPs coming from the
> FEX files. Have you experienced any issues with the default ones?

I'll find some time to run a stress test on it.

> The other patches have been queued either for 4.8 as fixes, or 4.9.

Thanks!

ChenYu

>
> Thanks!
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
