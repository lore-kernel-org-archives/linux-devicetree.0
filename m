From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: Re: [PATCH 2/2] hwrng: msm: Add PRNG support for MSM SoC's
Date: Wed, 09 Oct 2013 11:23:43 +0300
Message-ID: <5255128F.8090107@mm-sol.com>
References: <1380811955-18085-1-git-send-email-svarbanov@mm-sol.com> <1380811955-18085-3-git-send-email-svarbanov@mm-sol.com> <524DC4B1.4050100@codeaurora.org> <524EED4E.8090505@mm-sol.com> <524EEEC5.7090803@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <524EEEC5.7090803@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, linux-kernel@vger.kernel.org, Rob Landley <rob@landley.net>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On 10/04/2013 07:37 PM, Stephen Boyd wrote:
> On 10/04/13 09:31, Stanimir Varbanov wrote:
>>
>>>> +static int msm_rng_probe(struct platform_device *pdev)
>>>> +{
>>>> +	struct msm_rng *rng;
>>>> +	struct device_node *np;
>>>> +	struct resource res;
>>>> +	int ret;
>>>> +
>>>> +	np = of_node_get(pdev->dev.of_node);
>>>> +	if (!np)
>>>> +		return -ENODEV;
>>> This is unnecessary.
>> I used this call because CONFIG_OF_DYNAMIC could be enabled at some
>> time. Isn't that possible? I saw that of_node_get|put is used in .probe
>> on few places in drivers.
> 
> So far we aren't selecting that config on ARM.
> 
> If you look at of_device_alloc() you'll see
> 
>     dev->dev.of_node = of_node_get(np);
> 
> so any platform devices created from of_platform_populate won't have
> their of_node go away.

Thanks for the pointers, it makes sense. I'll remove the calls to
of_node_get|put.

regards,
Stan
