From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 00/13] of: Make drivers/of/resolver.c more readable
Date: Thu, 27 Oct 2016 09:36:53 -0700
Message-ID: <58122D25.5030809@gmail.com>
References: <1477429146-27039-1-git-send-email-frowand.list@gmail.com>
 <580FC874.4000401@gmail.com>
 <CAL_JsqKX4nahQ4o1FtPLfqqbYM2-pm9QbsobaaRzo8z7arJEjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKX4nahQ4o1FtPLfqqbYM2-pm9QbsobaaRzo8z7arJEjQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/27/16 05:03, Rob Herring wrote:
> On Tue, Oct 25, 2016 at 4:02 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 10/25/16 13:58, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>>> From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
>>>
>>> drivers/of/resolve.c is a bit difficult to read.  Clean it up so
>>> that review of future overlay related patches will be easier.
>>
>> < snip >
>>
>> Hi Pantelis,
>>
>> Can you test this patch series on some real hardware?
> 
> Did you run unit tests?

Yes.

But I will be much happier after Pantelis runs tests on real
hardware (which he agrees to do in another reply).

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
