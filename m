From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH 3/7] MIPS: Octeon: Add a global resource manager.
Date: Thu, 2 Nov 2017 09:03:42 -0700
Message-ID: <caeae680-915a-d08c-d220-899db0970328@caviumnetworks.com>
References: <20171102003606.19913-1-david.daney@cavium.com>
 <20171102003606.19913-4-david.daney@cavium.com>
 <20171102122327.GE4772@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171102122327.GE4772@lunn.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, David Daney <david.daney@cavium.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, James Hogan <james.hogan@mips.com>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, "Steven J. Hill" <steven.hill@cavium.com>, devicetree@vger.kernel.org, Carlos Munoz <cmunoz@cavium.com>
List-Id: devicetree@vger.kernel.org

On 11/02/2017 05:23 AM, Andrew Lunn wrote:
>> +static void res_mgr_lock(void)
>> +{
>> +	unsigned int tmp;
>> +	u64 lock = (u64)&res_mgr_info->rlock;
>> +
>> +	__asm__ __volatile__(
>> +		".set noreorder\n"
>> +		"1: ll   %[tmp], 0(%[addr])\n"
>> +		"   bnez %[tmp], 1b\n"
>> +		"   li   %[tmp], 1\n"
>> +		"   sc   %[tmp], 0(%[addr])\n"
>> +		"   beqz %[tmp], 1b\n"
>> +		"   nop\n"
>> +		".set reorder\n" :
>> +		[tmp] "=&r"(tmp) :
>> +		[addr] "r"(lock) :
>> +		"memory");
>> +}
>> +
>> +static void res_mgr_unlock(void)
>> +{
>> +	u64 lock = (u64)&res_mgr_info->rlock;
>> +
>> +	/* Wait until all resource operations finish before unlocking. */
>> +	mb();
>> +	__asm__ __volatile__(
>> +		"sw $0, 0(%[addr])\n" : :
>> +		[addr] "r"(lock) :
>> +		"memory");
>> +
>> +	/* Force a write buffer flush. */
>> +	mb();
>> +}
> 
> It would be good to add some justification for using your own locks,
> rather than standard linux locks.

Yes, I will add that.


> 
> Is there anything specific to your hardware in this resource manager?
> I'm just wondering if this should be generic, put somewhere in lib. Or
> maybe there is already something generic, and you should be using it,
> not re-inventing the wheel again.

The systems built around this hardware may have other software running 
on CPUs that are not running the Linux kernel.  The data structures used 
to arbitrate usage of shared system hardware resources use exactly these 
locking primitives, so they cannot be changed to use the Linux locking 
implementation de jour.
