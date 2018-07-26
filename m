From: Arun Parameswaran <arun.parameswaran@broadcom.com>
Subject: Re: [PATCH 7/7] net: phy: Add pm support for scan ctrl register to
 bcm mdio mux
Date: Thu, 26 Jul 2018 12:51:01 -0700
Message-ID: <f2521267-c774-6a56-ac5f-f777346b779c@broadcom.com>
References: <1532630184-29450-1-git-send-email-arun.parameswaran@broadcom.com>
 <1532630184-29450-8-git-send-email-arun.parameswaran@broadcom.com>
 <20180726192050.GJ10686@lunn.ch>
 <170a4731-b091-aef4-2d66-2950114e41fc@broadcom.com>
 <20180726193634.GM10686@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180726193634.GM10686@lunn.ch>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On 18-07-26 12:36 PM, Andrew Lunn wrote:
> On Thu, Jul 26, 2018 at 12:33:05PM -0700, Arun Parameswaran wrote:
>>
>>
>> On 18-07-26 12:20 PM, Andrew Lunn wrote:
>>> On Thu, Jul 26, 2018 at 11:36:24AM -0700, Arun Parameswaran wrote:
>>>> Add support for saving and restoring the 'scan control' register
>>>> in the Broadcom iProc mdio mux driver.
>>>
>>> Hi Arun
>>>
>>> I don't see anything setting this register. So why is it necessary to
>>> save it over suspend/resume?
>>>
>>>      Andrew
>>>
>> Hi Andrew
>> In the Omega SoC (only), this register was defaulted incorrectly (to use
>> a test mode) by the hardware. So we added the setup of the register to
>> the early bootloader (ATF).
>>
>> We still need to restore this register while resuming from sleep.
> 
> Hi Arun
> 
> It is better to not rely on the bootloader and have the driver do it.
> That makes it easier for people to swap to alternative bootloaders.
> 
>      Andrew
> 
I will make the change to set the register in the driver.

Thanks
Arun
