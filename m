From: matthew.gerlach@linux.intel.com
Subject: Re: [PATCH v5 4/4] fpga pr ip: Platform driver for Altera Partial
 Reconfiguration IP.
Date: Mon, 20 Mar 2017 16:42:56 -0700 (PDT)
Message-ID: <alpine.DEB.2.20.1703201634030.2531@mgerlach-VirtualBox>
References: <1489174827-6033-1-git-send-email-matthew.gerlach@linux.intel.com>        <1489174827-6033-5-git-send-email-matthew.gerlach@linux.intel.com> <20170318192750.716e9b28@crub>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170318192750.716e9b28@crub>
Sender: linux-kernel-owner@vger.kernel.org
To: Anatolij Gustschin <agust@denx.de>
Cc: atull@kernel.org, moritz.fischer@ettus.com, linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org



On Sat, 18 Mar 2017, Anatolij Gustschin wrote:

> Hi Matthew,
>

Hi Anatolij,

Thanks for all the feedback.  I will create another patch set 
incorporating your suggestions.


> On Fri, 10 Mar 2017 11:40:27 -0800
> matthew.gerlach@linux.intel.com matthew.gerlach@linux.intel.com wrote:
>
> ...
>> +#include "altera-pr-ip-core.h"
>
> Shouldn't we put this header to include/linux? Compiling the
> out-of-tree modules using alt_pr_register/alt_pr_unregister
> will not work if this header is in drivers/fpga.

I was not sure if someone would want to access these functions outside of 
drivers/fpga.  I think it does make sense to move it to 
include/linux/fpga.

>
> ...
>> +
>> +module_platform_driver(alt_pr_platform_driver);
>
> Please add MODULE_LICENSE("GPL v2") here. Otherwise, when built as
> a module it cannot be loaded because the alt_pr register/unregister
> functions are exported as GPL only. Also please add module author
> and description.
>

Got it. Thanks!

> Thanks,
>
> Anatolij
> --
> To unsubscribe from this list: send the line "unsubscribe linux-fpga" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
