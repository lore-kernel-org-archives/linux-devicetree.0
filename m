From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 06/13] of: Remove prefix "__of_" and prefix "__" from
 local function names
Date: Thu, 27 Oct 2016 11:58:00 -0500
Message-ID: <CAL_JsqJdBAeAUfODEzvpNELmLj9ib1CKwQVsEVGsFYAnBuj_Kw@mail.gmail.com>
References: <1477429146-27039-1-git-send-email-frowand.list@gmail.com>
 <1477429146-27039-7-git-send-email-frowand.list@gmail.com>
 <CAL_JsqL9KWw7Mkz8nwZWDot+3OPBC2AesYuvu3dEofiB7BGeGQ@mail.gmail.com> <58122CC0.3090700@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <58122CC0.3090700-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 27, 2016 at 11:35 AM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 10/27/16 05:47, Rob Herring wrote:
>> On Tue, Oct 25, 2016 at 3:58 PM,  <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
>>
>> I prefer to leave the prefixes and this is getting into pointless churn.
>>
>>>
>>> Signed-off-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
>>> ---
>>>  drivers/of/resolver.c | 10 +++++-----
>>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>
> If I was just submitting this as a single patch, I would agree.
>
> But since I am making so many other changes, I think it makes
> sense to do this as part of this series.  It is broken apart
> as a separate patch to be easy to review and not pollute any
> of the other patches in the series.
>
> The prefixes add no value for a local function, but they do
> add noise when reading code.

The value is when reading the calling function, you know the function
is a DT related function. You don't know it's a static function
without looking up the function name. That said, I wouldn't object to
code originally written either way, I just don't see the value in
changing it.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
