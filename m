From: Enrico Weigelt <lkml-EcKl7qYKIbxeoWH0uzbU5w@public.gmane.org>
Subject: Re: RFC: build config via DT names
Date: Tue, 13 Feb 2018 16:21:52 +0000
Message-ID: <fcaefa19-defc-f09d-fa55-06384e2a545d@metux.net>
References: <63f25fea-f163-f9cc-b5b2-f6f291d7f8d2@gmx.de>
 <d55f95cc-228b-e65f-b46c-2f314f4fa582@gmail.com>
 <CAL_JsqJXJA+Z7b6SoUx=MVK_C=vcMRAibapriOi+Wss6L1ahsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJXJA+Z7b6SoUx=MVK_C=vcMRAibapriOi+Wss6L1ahsw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Enrico Weigelt, metux IT consult" <metux-Mmb7MZpHnFY@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 13.02.2018 15:19, Rob Herring wrote:

> Doubling the number of driver config options is not going to fly. 

These options would be in their own submenu (which could be disabled
completely) and use their own prefix. IMHO, even if they grow into big
numbers, the impact should be minimal.

> How would you handle multiple compatible strings per driver? 

Multiple entries in the submenu, each selecting the same driver.

> We have all the data, so we should be able to generate this which
> dt_to_config tries to do. 

I guess there're lots of corner cases that would need special magic.

> I think part of the problem is dt_to_config
> works at the source level for everything. Really we need a more robust
> way to map source files to config options and extracting match tables
> from drivers. Perhaps doing the latter with coccinelle which can match
> struct types, using the object files instead, or using module aliases
> (though that doesn't work for built-in drivers).

Configure by already compiled binaries ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info-EcKl7qYKIbxeoWH0uzbU5w@public.gmane.org -- +49-151-27565287
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
