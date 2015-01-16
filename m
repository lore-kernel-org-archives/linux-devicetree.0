From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [Patch v5 2/2] gpio: Document GPIO hogging mechanism
Date: Fri, 16 Jan 2015 11:20:56 +0100
Message-ID: <CACRpkdbkBt5o1hZhJf4ao9f=nBdCupP45-YLvxym7gB7H5h_Bg@mail.gmail.com>
References: <1419019671-25377-1-git-send-email-bparrot@ti.com>
	<1419019671-25377-3-git-send-email-bparrot@ti.com>
	<CACRpkdb7Wq7-rBypqPkefejY5Qfq_KKx91H+DxKWv-TM2y04bg@mail.gmail.com>
	<20150112163902.GE5834@ti.com>
	<CAAVeFuLF7EVR-Xta=eNegmGWX9AFu9xmyhXisGCTwc1ds3t1cA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAVeFuLF7EVR-Xta=eNegmGWX9AFu9xmyhXisGCTwc1ds3t1cA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jiri Prchal <jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 12, 2015 at 10:43 PM, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Jan 13, 2015 at 1:39 AM, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org> wrote:
>> Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote on Mon [2015-Jan-12 11:20:14 +0100]:

>>> line_b {
>>>     gpio-hog;
>>>     gpios = <6 0>;
>>>     output-low;
>>>     line-name = "foo-bar-gpio";
>>> }
>>>
>>> Then use of_property_read_bool() in the code to check which
>>> state is to be selected intially. You can check that no mutually
>>> exclusive state are selected, I don't like that an arbitrary string
>>> select the state like that, if we do it that way an enumerator would
>>> be better, I prefer bools.
>>
>> I am sorry but that is how it was originally in the first patch.
>> Alexandre's review comment suggested this method in [1] and [2] (below).
>>
>> Alexandre, any comments?
>>
>> [1] http://marc.info/?l=linux-gpio&m=141456662426151&w=2
>>
>> [2] http://marc.info/?l=linux-gpio&m=141715982424744&w=2
>
> When Linus and I are in conflict, follow Linus. Arnd's suggestion of
> having enums defined in (IIUC) include/dt-bindings/gpio and using them
> sounds good to me too and might make everyone happy (no possibility of
> conflicting definitions + no strings). Linus, could you comment on it?

I'm fine with bools or enums, just not strings, sorry for the mess.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
