From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH] regulator: ti-abb: Add support for interleaved LDO registers
Date: Tue, 21 Jan 2014 14:06:25 -0600
Message-ID: <52DED341.3030503@ti.com>
References: <1389900750-27625-1-git-send-email-nm@ti.com> <20140121185553.GW17314@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140121185553.GW17314@sirena.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/21/2014 12:55 PM, Mark Brown wrote:
> On Thu, Jan 16, 2014 at 01:32:30PM -0600, Nishanth Menon wrote:
> 
>> -	abb->base = devm_ioremap_resource(dev, res);
> 
>> +	abb->base = devm_ioremap_nocache(dev, res->start, resource_size(res));
> 
> devm_ioremap_resouce() should do the right thing if the memory region is
> marked as uncacheable (with IORESOURCE_CACHEABLE not set).  Since I
> can't see the OF code actually setting that flag on the resources unless
> I'm missing something this change isn't needed?
> 
Without this change, on DRA7 I get:
[    0.579500] abb_mpu: 1060 <--> 1210 mV
[    0.580321] abb_ivahd: 1055 <--> 1250 mV
[    0.580583] ti_abb 4ae07e20.regulator-abb-dspeve: can't request
region for resource [mem 0x4ae07e20-0x4ae07e2f]
[    0.580610] ti_abb: probe of 4ae07e20.regulator-abb-dspeve failed
with error -16
[    0.581216] abb_gpu: 1090 <--> 1280 mV

with the change in the patch, I get:
[    0.589750] abb_mpu: 1060 <--> 1210 mV
[    0.590522] abb_ivahd: 1055 <--> 1250 mV
[    0.591331] abb_dspeve: 1055 <--> 1250 mV
[    0.592097] abb_gpu: 1090 <--> 1280 mV

reference dts:
https://github.com/nmenon/linux-2.6-playground/blob/abb-rev-v3.14-rc1-vnext-20140121/arch/arm/boot/dts/dra7.dtsi#L562
-- 
Regards,
Nishanth Menon
