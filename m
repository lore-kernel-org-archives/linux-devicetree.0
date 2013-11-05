From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: undocumented compatible strings
Date: Tue, 5 Nov 2013 11:09:36 -0600
Message-ID: <0198783C-A824-4165-871C-9FDCFBCF04AA@codeaurora.org>
References: <527838F0.2000803@gmail.com> <CAOesGMh5GR+s5yHgJbQwOOgxvDP9Tn8+TJj=zYmN3L+YBKo-AA@mail.gmail.com> <CAL_JsqKp0RFX-3MQpNK=agQPBp358dsCQFCt0D=JY=9zzb=x1w@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKp0RFX-3MQpNK=agQPBp358dsCQFCt0D=JY=9zzb=x1w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Nov 5, 2013, at 7:59 AM, Rob Herring wrote:

> On Mon, Nov 4, 2013 at 10:01 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
>> On Mon, Nov 4, 2013 at 4:16 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> 
>>> Undocumented compatible strings in kernel sources:
>>> 1682m-rng
>>> electra-cf
>>> electra-ide
>>> pasemi,localbus
>>> pasemi,localbus-nand
>>> pasemi,pwrficient-rng
>>> pasemi,sdc
>> 
>> These will never be documented in the same way as flat device tree,
>> just as the IBM and Sparc bindings won't be.
> 
> Yes, I know. As well as FSL PPC...
> 
> We may need some way to filter these out from whatever checker we come
> up with. I was debating whether to add an undocumented, grandfathered
> bindings document to capture these.


The FSL PPC should have bindings, there are some cases that we put in things with simple nodes that had a compat, a reg, and maybe an irq w/o having a full binding.

- k

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
