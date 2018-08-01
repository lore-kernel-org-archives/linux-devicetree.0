From: Arun Parameswaran <arun.parameswaran@broadcom.com>
Subject: Re: [PATCH v3 7/8] net: phy: Add support to configure clock in
 Broadcom iProc mdio mux
Date: Wed, 1 Aug 2018 12:55:56 -0700
Message-ID: <9af7e7a3-54d4-8802-f64a-fc4f9c49c8b9@broadcom.com>
References: <1533146186-8374-1-git-send-email-arun.parameswaran@broadcom.com>
 <1533146186-8374-8-git-send-email-arun.parameswaran@broadcom.com>
 <0cc6db4f-7008-0ad3-58d7-9e93060f152f@gmail.com>
 <20180801184659.GG30658@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180801184659.GG30658@n2100.armlinux.org.uk>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>, Florian Fainelli <f.fainelli@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, netdev@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Russell, Florian,

On 18-08-01 11:46 AM, Russell King - ARM Linux wrote:
> On Wed, Aug 01, 2018 at 11:40:33AM -0700, Florian Fainelli wrote:
>> On 08/01/2018 10:56 AM, Arun Parameswaran wrote:
>>>  static int iproc_mdio_wait_for_idle(void __iomem *base, bool result)
>>> @@ -204,6 +225,20 @@ static int mdio_mux_iproc_probe(struct platform_device *pdev)
>>>  		return -ENOMEM;
>>>  	}
>>>  
>>> +	md->core_clk = devm_clk_get(&pdev->dev, NULL);
>>> +	if (IS_ERR(md->core_clk)) {
>>> +		if (PTR_ERR(md->core_clk) == -EPROBE_DEFER)
>>> +			return -EPROBE_DEFER;
>>> +
>>> +		md->core_clk = NULL;
>>
>> I would simplify this a bit:
>>
>> 	if (IS_ERR(md->core_clk) && PTR_ERR(md->core_clk) == -EPROBE_DEFER)
> 
> Even better is:
> 
> 	if (md->core_clk == ERR_PTR(-EPROBE_DEFER))
> 

The clock is an optional parameter. But I realize, that I did not handle all
the error cases.

My intention was to proceed with probe if the clock is not found in the DT.
If the clock is specified in the DT, make use of it.

So, should I modify to something like:

md->core_clk = devm_clk_get(&pdev->dev, NULL);
if (md->core_clk == ERR_PTR(-ENOENT)) {
	/* clock is optional, without it the default
	 * rate divider register values will be used
	 */
	md->core_clk = NULL;
} else if (IS_ERR(md->core_clk)) {
	return PTR_ERR(md->core_clk);
} else {
	rc = clk_prepare_enable(md->core_clk);
	...
}

Thanks
Arun
