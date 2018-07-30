From: Arun Parameswaran <arun.parameswaran@broadcom.com>
Subject: Re: [PATCH v2 0/7] Add clock config and pm support to bcm iProc mdio
 mux
Date: Mon, 30 Jul 2018 09:57:30 -0700
Message-ID: <53a99d1b-f945-2ab6-d564-d4837fb8639d@broadcom.com>
References: <1532726613-6483-1-git-send-email-arun.parameswaran@broadcom.com>
 <20180728213233.GH4792@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180728213233.GH4792@lunn.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org


Hi Andrew,

On 18-07-28 02:32 PM, Andrew Lunn wrote:
> On Fri, Jul 27, 2018 at 02:23:26PM -0700, Arun Parameswaran wrote:
>> Hi,
>> The patchset is based on David Miller's "net-next" repo.
>>
>> The patchset extends the Broadcom iProc mdio mux to add support for
>> suspend/resume and the ability to configure the internal clock
>> divider. The patchset also sets the scan control register to
>> disable external master access.
> 
> Hi Arun
> 
> It would be good to modify the .dtsi files to make use of the new
> clock properties.
> 
The clock is done primarily for the newer Omega SoC. I hope, we will
upstream the devicetree file for Omega soon.

The existing NS2 and Stingray SoC's, default to proper values in the
hardware registers, so they did not need to specify the clock. They
will also work over sleep cycles for the same reason.

But, I will ask around to see if we can add the clock for those
SoC's as well.

Thanks
Arun

>       Andrew
> 
