From: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org>
Subject: Re: new cpu iteration code...
Date: Thu, 19 Sep 2013 15:03:36 +0100
Message-ID: <523B0438.7000902@arm.com>
References: <20130918.173726.1443745664398441126.davem@davemloft.net> <523AC214.4040601@arm.com> <523AFB6C.5070300@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <523AFB6C.5070300-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 19/09/13 14:26, Rob Herring wrote:
> On 09/19/2013 04:21 AM, Sudeep KarkadaNagesha wrote:
>> Hi David,
>>
>> On 18/09/13 22:37, David Miller wrote:
>>>
>>> I'm getting a flood of kernel log warnings on bootup now with
>>> the generic of_get_cpu_node() code, it is wrong for sparc64
>>> on several levels.
>>>
>>> There is never a root "/cpus" node, so this code always fails.
>>> Usually the "cpu" nodes are simply listed at the top-level.
>>>
>>
>> As per ePAPR:
> 
> Sparc is OpenFirmware not FDT which the ePAPR is concerned with.
> 
Thanks, I wasn't aware that SPARC is not using FDT.

Regards,
Sudeep


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
