From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: undocumented compatible strings
Date: Tue, 5 Nov 2013 07:59:56 -0600
Message-ID: <CAL_JsqKp0RFX-3MQpNK=agQPBp358dsCQFCt0D=JY=9zzb=x1w@mail.gmail.com>
References: <527838F0.2000803@gmail.com>
	<CAOesGMh5GR+s5yHgJbQwOOgxvDP9Tn8+TJj=zYmN3L+YBKo-AA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMh5GR+s5yHgJbQwOOgxvDP9Tn8+TJj=zYmN3L+YBKo-AA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 4, 2013 at 10:01 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> On Mon, Nov 4, 2013 at 4:16 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> Undocumented compatible strings in kernel sources:
>> 1682m-rng
>> electra-cf
>> electra-ide
>> pasemi,localbus
>> pasemi,localbus-nand
>> pasemi,pwrficient-rng
>> pasemi,sdc
>
> These will never be documented in the same way as flat device tree,
> just as the IBM and Sparc bindings won't be.

Yes, I know. As well as FSL PPC...

We may need some way to filter these out from whatever checker we come
up with. I was debating whether to add an undocumented, grandfathered
bindings document to capture these.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
