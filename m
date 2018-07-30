From: Arun Parameswaran <arun.parameswaran@broadcom.com>
Subject: Re: [PATCH v2 6/7] net: phy: Add support to configure clock in
 Broadcom iProc mdio mux
Date: Mon, 30 Jul 2018 09:47:29 -0700
Message-ID: <b7b62b2f-2936-c8d0-3443-66d00713db20@broadcom.com>
References: <1532726613-6483-1-git-send-email-arun.parameswaran@broadcom.com>
 <1532726613-6483-7-git-send-email-arun.parameswaran@broadcom.com>
 <20180728000303.GA23816@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180728000303.GA23816@lunn.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Hi Andrew

On 18-07-27 05:03 PM, Andrew Lunn wrote:
>>  static void mdio_mux_iproc_config(struct iproc_mdiomux_desc *md)
>>  {
>>  	u32 val;
>> +	u32 divisor;
> 
> Hi Arun
> 
> Reverse Christmas tree please.
> 
> 	Andrew
> 
Ok, will send out an updated patch.

Thanks
Arun
