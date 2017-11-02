From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH 4/7] MIPS: Octeon: Add Free Pointer Unit (FPA) support.
Date: Thu, 2 Nov 2017 09:27:01 -0700
Message-ID: <fc2d71e2-cdd4-1cf8-13b0-ea462b5e7e75@caviumnetworks.com>
References: <20171102003606.19913-1-david.daney@cavium.com>
 <20171102003606.19913-5-david.daney@cavium.com>
 <d473b10c-ae5d-efa1-7329-de7b68152725@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d473b10c-ae5d-efa1-7329-de7b68152725@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, David Daney <david.daney@cavium.com>, linux-mips@linux-mips.org, ralf@linux-mips.org, James Hogan <james.hogan@mips.com>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, "Steven J. Hill" <steven.hill@cavium.com>, devicetree@vger.kernel.org, Carlos Munoz <cmunoz@cavium.com>
List-Id: devicetree@vger.kernel.org

On 11/01/2017 08:29 PM, Florian Fainelli wrote:
> Le 11/01/17 à 17:36, David Daney a écrit :
>> From: Carlos Munoz <cmunoz@cavium.com>
>>
>>  From the hardware user manual: "The FPA is a unit that maintains
>> pools of pointers to free L2/DRAM memory. To provide QoS, the pools
>> are referenced indirectly through 1024 auras. Both core software
>> and hardware units allocate and free pointers."
> 
> This looks like a possibly similar implement to what
> drivers/net/ethernet/marvell/mvneta_bm.c, can you see if you can make
> any use of genpool_* and include/net/hwbm.h here as well?

Yikes!  Is it permitted to put function definitions that are not "static 
inline" in header files?

The driver currently doesn't use page fragments, so I don't think that 
the hwbm thing can be used.

Also the FPA unit is used to control RED and back pressure in the PKI 
(packet input processor), which are features that are features not 
considered in hwbm.

The OCTEON-III hardware also uses the FPA for non-packet-buffer memory 
allocations.  So for those, it seems that hwbm is also not a good fit.

David Daney
