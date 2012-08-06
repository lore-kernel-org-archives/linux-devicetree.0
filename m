From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v2 2/4] PM / OPP: Initialize OPP table from device tree
Date: Sun, 05 Aug 2012 23:43:04 -0500
Message-ID: <501F4B58.4020308@gmail.com>
References: <1344179121-17738-1-git-send-email-shawn.guo@linaro.org> <1344179121-17738-3-git-send-email-shawn.guo@linaro.org> <501F30F8.1040105@gmail.com> <20120806031916.GC22302@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20120806031916.GC22302@S2101-09.ap.freescale.net>
Sender: cpufreq-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Kevin Hilman <khilman@ti.com>, Nishanth Menon <nm@ti.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Mike Turquette <mturquette@linaro.org>, devicetree-discuss@lists.ozlabs.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Shilimkar Santosh <santosh.shilimkar@ti.com>, Richard Zhao <richard.zhao@freescale.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 08/05/2012 10:19 PM, Shawn Guo wrote:
> On Sun, Aug 05, 2012 at 09:50:32PM -0500, Rob Herring wrote:
>>> +Properties:
>>> +- operating-points: An array of 3-tuples items, and each item consists
>>
>> 3 tuples?
>>
> It's the case of v1, and I forgot updating it.  Thanks for spotting it.
> 
>>> +  of frequency and voltage like <freq-kHz vol-uV>.
>>> +	freq: clock frequency in kHz
>>> +	vol: voltage in microvolt
>>
>> Although maybe 3 fields would be good for a flags field? I'm concerned
>> it's a pretty generic name and not very future proof. What about
>> transition times? Not sure how you would represent that as it probably
>> depends on which points you are changing between rather than a property
>> of the opp.
>>
> This is a binding for OPP, which does not define transition times.
> 
> As for cpufreq, we only need to represent a possible maximum transition
> latency.  The driver will ask regulator subsystem for voltage latency,
> while the clock latency is defined in DT. 
> 
>> I think this whole function can be written more concisely. Just iterate
>> over the property and avoid the intermediate array allocation.
>>
> I'm not sure about that, since directly iterating over the property
> means we have to take care of all these sanity checks done in API
> of_property_read_u32_array().
> 

This won't work?:

of_property_for_each_u32(...) {
	if (i & 0x1) {
		volt = val;
		ret = opp_add(dev, freq, volt);
		if (ret)
			...
	} else
		freq = val * 1000;

	i++;
}

Rob
