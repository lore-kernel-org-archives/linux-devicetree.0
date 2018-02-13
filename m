From: "Enrico Weigelt, metux IT consult" <metux-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: RFC: build config via DT names
Date: Tue, 13 Feb 2018 13:16:59 +0000
Message-ID: <1b395f6c-5a07-6f44-3b16-7a06a273e291@gmx.de>
References: <63f25fea-f163-f9cc-b5b2-f6f291d7f8d2@gmx.de>
 <d55f95cc-228b-e65f-b46c-2f314f4fa582@gmail.com>
 <52140da5-0d49-c861-d752-8de9e4927380@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52140da5-0d49-c861-d752-8de9e4927380-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12.02.2018 23:24, Frank Rowand wrote:

> There is a tool to aid this process: scripts/dtc/dt_to_config.  It is not
> a 100% solution, but it is very helpful.
> 
> The problem is difficult enough that this tool led to a conference talk.
> The slides are at https://elinux.org/images/5/50/Dt_debugging_part_2.pdf
> which is linked to from
> https://elinux.org/Device_Tree_presentations_papers_articles#linux_kernel_configuration

I believe my approach can make this much simpler, at least for most
drivers: the maintainers would explicitly add proper config flags,
instead of letting the tool guess it.

Of course, it would take some amount of work to do that for all drivers,
but we could do that step by step.


--mtx
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
