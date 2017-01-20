From: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: Export __of_find_all_nodes()
Date: Fri, 20 Jan 2017 10:59:35 +0100
Message-ID: <d02c2035-9176-9132-0725-9c645194cec5@nokia.com>
References: <20170118093849.32204-1-alexander.sverdlin@nokia.com>
 <587FDF1B.1060206@gmail.com> <d9525715-be49-1cfa-f623-084237e44b4c@nokia.com>
 <588140D4.1060103@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <588140D4.1060103-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Frank!

On 19/01/17 23:42, Frank Rowand wrote:
>>>> +EXPORT_SYMBOL_GPL(__of_find_all_nodes);
>>>>  
>>>>  /**
>>>>   * of_find_all_nodes - Get next node in global list
>>>>
>>> Quoting Rob from the last request for this:
>>>
>>> "What driver needs this? This isn't really a function I'd expect drivers to use."
>> This one and the one from previous patch/mail are used in a module which reads DT overlays
> If I understand correctly, that was a request to be able to use of_node_init() directly.
> Is that correct?

Correct. In case new node has to be added.

>> from pluggable extension boards, eventually performs some sanity checks/corrections and
>> applies these overlays. This eventual corrections require low-level access to DT.
> Are you saying that you want to modify the device tree data structure after the overlay
> is applied?
> 
> The idea of sanity checks is one that I am very interested in.  Could the sanity checks
> be done statically, either with the overlay source, or with the compiled overlay source?
> The idea behind that question is whether the checks could be done while the overlay is
> being developed, instead of at run time.
> 
> I am also curious about what sort of corrections are made and how it is determined what
> corrections to make.

In some cases these are just bugs, in other cases new DT bindings which change with Linux
version and in third either old overlay format, or even not overlay format.

But I see your point here. Actually it would be possible to convert all these cases to
overlay format and just apply an overlay. And all the API for this is already available.

Let us just abandon both export patches!

>> I cannot judge, how relevant this usecase is for the community, but I was driven by the fact,
>> that the functions which require the functions I export are defined statically in .h files
>> and therefore are exposed to the modules.
>>

-- 
Best regards,
Alexander Sverdlin.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
