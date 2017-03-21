From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] dtc updates for 4.12
Date: Tue, 21 Mar 2017 14:55:22 -0500
Message-ID: <CAL_JsqL3z1dqYZ68jtt2coNhM8sbZZWimuCku2mTHWDuS+kj6g@mail.gmail.com>
References: <20170321161958.9658-1-robh@kernel.org> <CAOesGMiWFPERPapOLCW4iqSuFWiqesBBjGN0ny6XjzFXNfKr4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMiWFPERPapOLCW4iqSuFWiqesBBjGN0ny6XjzFXNfKr4g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 21, 2017 at 2:15 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> On Tue, Mar 21, 2017 at 9:19 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> This series syncs dtc with current mainline. The primary motivation is
>> to pull in the new checks I've worked on. This gives lots of new
>> warnings which are turned off by default.
>>
>> Arm-soc folks, I've left the PCI checks enabled as they are pretty much
>> all real errors and there aren't that many (about 1200, but that's lots
>> of duplicates). I have a patch for some of them.
>
> Yay for better warnings!
>
> But as with all changes of this kind, when new warnings are introduced
> please give people some time to remove them without turning them on by
> default. We had a cycle like that already.

Which I quickly fixed and learned my lesson. That's why I tried
getting this out earlier as well.

> Main reason is that it becomes too hard to spot new warnings when they
> come in if the logs are flooded with 1200 existing warnings.

Yeah. Since almost everything is an include, the warnings really multiply.

> How many of them do you have patches for, per chance? If we can see
> them show up quickly the answer to the above might be a bit different.

Okay, I lied or lost them... It looks like it is 79 unique warnings
for arm. I'll take a stab at fixing them.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
