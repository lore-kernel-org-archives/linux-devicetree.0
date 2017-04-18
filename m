From: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: gpu: add bindings for the ARM Mali
 Midgard GPU
Date: Tue, 18 Apr 2017 10:15:08 +0100
Message-ID: <b8cf7acd-83e9-49fb-0800-19a76b8dcce5@collabora.com>
References: <cover.1491118230.git.guillaume.tucker@collabora.com>
 <db45d0d68957d699f13a0d92f4f84d8ebfd0270e.1491118230.git.guillaume.tucker@collabora.com>
 <20170404020056.d7osj7rmog22xbjd@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20170404020056.d7osj7rmog22xbjd@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Wookey <wookey-Xpnwy/r4z8dg9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Reitan <john.reitan-5wv7dgnIgG8@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 04/04/17 03:00, Rob Herring wrote:
> On Sun, Apr 02, 2017 at 08:59:44AM +0100, Guillaume Tucker wrote:
>> The ARM Mali Midgard GPU family is present in a number of SoCs
>> from many different vendors such as Samsung Exynos and Rockchip.
>>
>> Import the device tree bindings documentation from the r16p0
>> release of the Mali Midgard GPU kernel driver:
>>
>>   https://developer.arm.com/-/media/Files/downloads/mali-drivers/kernel/mali-midgard-gpu/TX011-SW-99002-r16p0-00rel0.tgz
>>
>> The following optional bindings have been omitted in this initial
>> version as they are only used in very specific cases:
>>
>>   * snoop_enable_smc
>>   * snoop_disable_smc
>>   * jm_config
>>   * power_model
>>   * system-coherency
>>   * ipa-model
>>
>> The example has been simplified accordingly.
>>
>> The compatible string definition has been limited to
>> "arm,mali-midgard" to avoid checkpatch.pl warnings and to match
>> what the driver actually expects (as of r16p0 out-of-tree).
>>
>> CC: John Reitan <john.reitan-5wv7dgnIgG8@public.gmane.org>
>> Signed-off-by: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
>> ---
>>  .../devicetree/bindings/gpu/arm,mali-midgard.txt   | 53 ++++++++++++++++++++++
>>  1 file changed, 53 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
>> new file mode 100644
>> index 000000000000..da8fc6d21bbf
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
>> @@ -0,0 +1,53 @@
>> +#
>> +# (C) COPYRIGHT 2013-2016 ARM Limited.
>> +# Copyright (C) 2017 Collabora Ltd
>> +#
>> +# This program is free software and is provided to you under the terms of the
>> +# GNU General Public License version 2 as published by the Free Software
>> +# Foundation, and any use by you of this program is subject to the terms
>> +# of such GNU licence.
>> +#
>> +
>> +
>> +ARM Mali Midgard GPU
>> +====================
>> +
>> +Required properties:
>> +
>> +- compatible : Should be "arm,mali-midgard".
>
> As Neil said...

Sure; as discussed in my previous emails.

>> +- reg : Physical base address of the device and length of the register area.
>> +- interrupts : Contains the three IRQ lines required by Mali Midgard devices.
>> +- interrupt-names : Contains the names of IRQ resources in the order they were
>> +  provided in the interrupts property. Must contain: "JOB, "MMU", "GPU".
>> +
>> +Optional:
>> +
>> +- clocks : Phandle to clock for the Mali Midgard device.
>> +- clock-names : Shall be "clk_mali".
>
> "clk_" is redundant. Actually, if there is only 1 clock, then just drop
> names. But there's not at least a core and bus clock?

Only one clock needs to be provided with the Midgard GPU
architecture.  It shares the same bus and system memory as the
CPU.  So I'll remove clock-names in patch v3.

>> +- mali-supply : Phandle to regulator for the Mali device. Refer to
>> +  Documentation/devicetree/bindings/regulator/regulator.txt for details.
>> +- operating-points : Refer to Documentation/devicetree/bindings/power/opp.txt
>> +  for details.
>
> Is this going to be sufficient vs. operating-points-v2? Or should it be
> a power domain with OPPs?

In principle, switching to operating-points-v2 should be very
straightforward.  I have smoke-tested the driver with an
operating-points-v2 table and a phandle to it inside the gpu node
in place of operating-points and it seems to be working fine.  At
least it parsed the OPPs and got initialised correctly.

My understanding is that operating-points (v1) are not deprecated
so we could keep the bindings as-is, but please let me know
otherwise and I can try to address that in my next patch version.
In the documentation, it should only be the case of replacing
operating-points with operating-points-v2.

>> +
>> +Example for a Mali-T602:
>> +
>> +gpu@0xfc010000 {
>
> Drop the '0x'.

OK, I'm also updating the example with lower-case IRQ names, no
clock-names etc...

Thanks,
Guillaume
