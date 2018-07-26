From: Arun Parameswaran <arun.parameswaran@broadcom.com>
Subject: Re: [PATCH 5/7] net: phy: Add support to configure clock in Broadcom
 iProc mdio mux
Date: Thu, 26 Jul 2018 12:20:46 -0700
Message-ID: <8c163cc7-aa52-4a17-9cba-762c8542e721@broadcom.com>
References: <1532630184-29450-1-git-send-email-arun.parameswaran@broadcom.com>
 <1532630184-29450-6-git-send-email-arun.parameswaran@broadcom.com>
 <20180726191340.GH10686@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180726191340.GH10686@lunn.ch>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org



On 18-07-26 12:13 PM, Andrew Lunn wrote:
>> @@ -175,6 +198,12 @@ static int mdio_mux_iproc_probe(struct platform_device *pdev)
>>  		return PTR_ERR(md->base);
>>  	}
>>  
>> +	md->core_clk = devm_clk_get(&pdev->dev, NULL);
>> +	if (IS_ERR(md->core_clk)) {
>> +		dev_info(&pdev->dev, "core_clk not specified\n");
>> +		md->core_clk = NULL;
>> +	}
>> +
> 
> In the binding, you say the clock is optional. This is a rather strong
> message for something which is optional. I think it would be better to
> not output anything.
> 
>     Andrew
> 
Will remove the message.

Thanks
Arun
