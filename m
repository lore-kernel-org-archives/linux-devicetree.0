From: Maciej Purski <m.purski@samsung.com>
Subject: Re: [PATCH v3 3/4] regulator: core: Parse coupled regulators
 properties
Date: Thu, 21 Dec 2017 11:08:19 +0100
Message-ID: <4866dd1c-e9bb-24e4-9b4a-294d01edde78@samsung.com>
References: <1512639975-22241-1-git-send-email-m.purski@samsung.com>
        <CGME20171207094753eucas1p27b835787f92a1da8c46b9a2692376288@eucas1p2.samsung.com>
        <1512639975-22241-4-git-send-email-m.purski@samsung.com>
        <20171212113511.GF16323@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20171212113511.GF16323@sirena.org.uk>
Content-language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: devicetree@vger.kernel.org



On 12/12/2017 12:35 PM, Mark Brown wrote:
> On Thu, Dec 07, 2017 at 10:46:14AM +0100, Maciej Purski wrote:
>> (...)
>> +	mutex_lock(&regulator_list_mutex);
>> +	regulator_resolve_coupling(rdev);
>> +	mutex_unlock(&regulator_list_mutex);
>> +
> 
> I'd really expect us to be failing to probe if we run into an error.
> Otherwise we could end up doing bad things to the hardware at runtime
> later on, or confusing ourselves and crashing with partially set up
> datastructures.  


We cannot fail to probe if some of the regulators are not registered 
successfully, as depending on the probing sequence, there will be some 
regulators, which won't be available when registering others. We can fail when 
resolving coupling if we encounter other errors such as max_spread not provided 
or disability to set voltage. Maybe that is what you meant.

> It's also not 100% clear to me how we handle the case
> where only some of the coupled regulators have probed.
> 

I have two ideas how to handle it. We can prohibit setting the voltage and 
always fail on attempt to set voltage of a coupled regulator. Or we can just 
ignore it and set voltage of the regulator without checking the unregistered ones.
