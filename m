From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: RFC: build config via DT names
Date: Mon, 12 Feb 2018 15:24:54 -0800
Message-ID: <52140da5-0d49-c861-d752-8de9e4927380@gmail.com>
References: <63f25fea-f163-f9cc-b5b2-f6f291d7f8d2@gmx.de>
 <d55f95cc-228b-e65f-b46c-2f314f4fa582@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d55f95cc-228b-e65f-b46c-2f314f4fa582-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Enrico Weigelt, metux IT consult" <metux-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Enrico,

On 02/12/18 15:13, Frank Rowand wrote:
> + devicetree mail list
> 
> On 02/10/18 07:52, Enrico Weigelt, metux IT consult wrote:
>> Hi folks,
>>
>> I've regularily have the task of configuring a kernel for a given DT.
>> To make this a little bit easier, I'd like to do this automatically.
>>
>> The tuff task here is getting a mapping between dt compatible strings
>> and corresponding CONFIG_* flags. Automatically extracting it from the
>> source code seems pretty tricky, especially w/ corner cases (eg. some
>> drivers support groups of devices, depending on config options) - IMHO
>> it will need some code changes anyways.
>>
>> Therefore I propose a simple approach using the existing Kconfig system:
>>
>> Add an extra (toplevel) menu and config flag naming scheme which
>> directly map DT compatible strings to config flags. For example:
>>
>>> fsl,mpc5200-gpio <=> CONFIG_DTDEV_FSL_MPC5200_GPIO
>>
>>> config CONFIG_DTDEV_FSL_MPC5200_GPIO
>>>     tristate "fsl,mpc5200-gpio"
>>>     select GPIO_MPC5200
>>
>> Note that these flags are separate from the actual drivers - they just
>> enable them automatically. Of course they'll have to be maintained by
>> the driver maintainers.
>>
>>
>> What do you think about this idea ?
>>
>>
>> --mtx

As you note, it can be quite tricky getting the correct kernel configuration
for a given devicetree.

There is a tool to aid this process: scripts/dtc/dt_to_config.  It is not
a 100% solution, but it is very helpful.

The problem is difficult enough that this tool led to a conference talk.
The slides are at https://elinux.org/images/5/50/Dt_debugging_part_2.pdf
which is linked to from
https://elinux.org/Device_Tree_presentations_papers_articles#linux_kernel_configuration

dt_to_config and configuration issues are discussed in slides 33 - 80.

-Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
