From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH 4/7] MIPS: Octeon: Add Free Pointer Unit (FPA) support.
Date: Thu, 2 Nov 2017 12:12:33 -0700
Message-ID: <5bb88fc9-5acd-0997-15c8-a9164c789738@caviumnetworks.com>
References: <20171102003606.19913-1-david.daney@cavium.com>
 <20171102003606.19913-5-david.daney@cavium.com>
 <d473b10c-ae5d-efa1-7329-de7b68152725@gmail.com>
 <fc2d71e2-cdd4-1cf8-13b0-ea462b5e7e75@caviumnetworks.com>
 <70fa7ec2-3e6d-e420-ff57-b34dc7ec311e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <70fa7ec2-3e6d-e420-ff57-b34dc7ec311e@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, David Daney <david.daney@cavium.com>, linux-mips@linux-mips.org, ralf@linux-mips.org, James Hogan <james.hogan@mips.com>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, "Steven J. Hill" <steven.hill@cavium.com>, devicetree@vger.kernel.org, Carlos Munoz <cmunoz@cavium.com>
List-Id: devicetree@vger.kernel.org

On 11/02/2017 11:04 AM, Florian Fainelli wrote:
> On 11/02/2017 09:27 AM, David Daney wrote:
>> On 11/01/2017 08:29 PM, Florian Fainelli wrote:
>>> Le 11/01/17 à 17:36, David Daney a écrit :
>>>> From: Carlos Munoz <cmunoz@cavium.com>
>>>>
>>>>   From the hardware user manual: "The FPA is a unit that maintains
>>>> pools of pointers to free L2/DRAM memory. To provide QoS, the pools
>>>> are referenced indirectly through 1024 auras. Both core software
>>>> and hardware units allocate and free pointers."
>>>
>>> This looks like a possibly similar implement to what
>>> drivers/net/ethernet/marvell/mvneta_bm.c, can you see if you can make
>>> any use of genpool_* and include/net/hwbm.h here as well?
>>
>> Yikes!  Is it permitted to put function definitions that are not "static
>> inline" in header files?
> 
> Meh well, this is not even ressembling what we initially discussed, so I
> was hoping we could build more interesting features on top of this.
> 
>>
>> The driver currently doesn't use page fragments, so I don't think that
>> the hwbm thing can be used.
>>
>> Also the FPA unit is used to control RED and back pressure in the PKI
>> (packet input processor), which are features that are features not
>> considered in hwbm.
>>
>> The OCTEON-III hardware also uses the FPA for non-packet-buffer memory
>> allocations.  So for those, it seems that hwbm is also not a good fit.
> 
> OK, let me see if I understand how FPA works, can we say that this is
> more or less a buffer tokenizer in that, you give it a buffer physical
> address and it returns an unique identifier that the FPA uses for actual
> packet passing, transmission and other manipulations?


At a high level, think of the FPA as a FIFO containing DMA addresses 
used by hardware.  The FIFO property is not guaranteed, so it is best to 
consider it as a pool of buffer addresses.

Software pushes pointers into the FPA, and the hardware RX unit (PKI) 
pops them off when it needs an RX buffer.  The TX unit (PKO) and input 
queue (SSO) also use memory obtained from the FPA as backing store for 
their internal queues.

In addition to obtaining buffers, the PKI uses the number of entries in 
an FPA pool to control RED and back pressure.

There are other features not used by the driver like threshold 
interrupts, and pointer alignment so you don't have to calculate the 
buffer address from a pointer to the middle of the buffer when freeing.


> 
> There were a few funky things in the network driver, I will comment there.
> --
> Florian
> 
