From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V1] regulator: fixed: dt: add property for gpio open drain
 flag
Date: Mon, 07 May 2012 09:20:33 -0600
Message-ID: <4FA7E841.7020100@wwwdotorg.org>
References: <1336386499-20408-1-git-send-email-ldewangan@nvidia.com> <4FA7E4A3.6050004@wwwdotorg.org> <4FA7E57B.30804@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <4FA7E57B.30804@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "lrg@ti.com" <lrg@ti.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On 05/07/2012 09:08 AM, Laxman Dewangan wrote:
> On Monday 07 May 2012 08:35 PM, Stephen Warren wrote:
>> On 05/07/2012 04:28 AM, Laxman Dewangan wrote:
>>> Add property for the gpio flag open drain when registering
>>> fixed regulator.
>>> diff --git
>>> a/Documentation/devicetree/bindings/regulator/fixed-regulator.txt ...
>>> +- gpio-open-drain: GPIO is open drain type.
>>> +  If this property is missing then default assumption is false.
>> Given that there's a GPIOF_OPEN_DRAIN, isn't the GPIO specifier in the
>> gpio property meant to encode this somehow (the format is up to the GPIO
>> controller's binding) - the flags are returned by
>> of_get_named_gpio_flags().
>>
>> (especially given you asked me off-list about updating the GPIO binding
>> documentation with information about the flags that Tegra's binding
>> documented for this)
> 
> gpio of binding does not explain that there is always gpio flag 
> (GPIOF_*) in gpio cell argument. It is up to the chip specific gpio
> driver how they implement the argumnets.
> For the example of gpio-samsung have the 4 argument list and all are for
> different purpose. And if they want to set pin as open drain, it will
> not be possible  on their argument list as none of the cell argument
> reflect to GPIOF_* flag.
> For the case of tegra, there is no of_xlate() implementation and hence
> it is by default return as GPIOF_.
> 
> And the client driver which is indpendent of chip specific gpio driver
> should able to handle this.

Yes, there are some issues to be resolved here.

My point is that there's clear intent for of_gpio_simple_xlate() to
return the GPIO flags from a field in the GPIO specifier in device tree,
irrespective of whether some GPIO bindings don't allow this, or whether
this is fully documented.

However, this patch introduces an alternative mechanism to specify some
of the flags.

We shouldn't have two different mechanisms to represent this
information. How do we resolve the situation where a particular SoC's
GPIO binding allows the flags to be specified, and this patch allows the
open-drain flag to be specified, and the two values are different?

Either we should force all bindings to have some way of specifying the
flags, or we should remove the flags from all bindings and rely on
separate properties.

IIRC, a similar thing came up with GPIO inversion, perhaps in Arnd's
recent unified SDHCI bindings. However, I don't think we really resolved
the issue during the discussion there.
