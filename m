From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] of: fdt: fix memory range check
Date: Wed, 24 Sep 2014 15:51:00 +0100
Message-ID: <5422DA54.4020806@linaro.org>
References: <1411466349-14166-1-git-send-email-srinivas.kandagatla@linaro.org> <20140924143844.B2218C40738@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140924143844.B2218C40738@trevor.secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 24/09/14 15:38, Grant Likely wrote:
>> --- a/drivers/of/fdt.c
>> >+++ b/drivers/of/fdt.c
>> >@@ -937,7 +937,7 @@ void __init __weak early_init_dt_add_memory_arch(u64 base, u64 size)
>> >  		return;
>> >  	}
>> >
>> >-	if (base + size > MAX_PHYS_ADDR) {
>> >+	if (base + size - 1 > MAX_PHYS_ADDR) {
>> >  		pr_warning("Ignoring memory range 0x%lx - 0x%llx\n",
>> >  				ULONG_MAX, base + size);
>> >  		size = MAX_PHYS_ADDR - base;
> By that logic, the above two lines need to be repaired also:
Thanks for fixing this too.
>
> 		pr_warning("Ignoring memory range 0x%lx - 0x%llx\n",
> 				MAX_PHYS_ADDR + 1, base + size);

I think the first argument should be printed in 0x%llx format as there 
would be a 32bit overflow for MAX_PHYS_ADDR + 1.

> 		size = MAX_PHYS_ADDR - base + 1;
>
> I've fixed it up and applied, thanks.

--srini
