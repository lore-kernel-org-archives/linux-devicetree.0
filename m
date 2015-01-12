From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [Patch v5 2/2] gpio: Document GPIO hogging mechanism
Date: Tue, 13 Jan 2015 06:43:33 +0900
Message-ID: <CAAVeFuLF7EVR-Xta=eNegmGWX9AFu9xmyhXisGCTwc1ds3t1cA@mail.gmail.com>
References: <1419019671-25377-1-git-send-email-bparrot@ti.com>
 <1419019671-25377-3-git-send-email-bparrot@ti.com> <CACRpkdb7Wq7-rBypqPkefejY5Qfq_KKx91H+DxKWv-TM2y04bg@mail.gmail.com>
 <20150112163902.GE5834@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150112163902.GE5834@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benoit Parrot <bparrot@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Jiri Prchal <jiri.prchal@aksignal.cz>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 13, 2015 at 1:39 AM, Benoit Parrot <bparrot@ti.com> wrote:
> Linus Walleij <linus.walleij@linaro.org> wrote on Mon [2015-Jan-12 11:20:14 +0100]:
>> On Fri, Dec 19, 2014 at 9:07 PM, Benoit Parrot <bparrot@ti.com> wrote:
>>
>> > Add GPIO hogging documentation to gpio.txt
>> >
>> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
>> > Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
>>
>> This is starting to look good ...
>>
>> > +               line_b {
>> > +                       gpio-hog;
>> > +                       gpios = <6 0>;
>> > +                       state = "output-low";
>>
>> I don't like the state string.
>>
>> Instead have boolean properties for all states.
>>
>> line_b {
>>     gpio-hog;
>>     gpios = <6 0>;
>>     output-low;
>>     line-name = "foo-bar-gpio";
>> }
>>
>> Then use of_property_read_bool() in the code to check which
>> state is to be selected intially. You can check that no mutually
>> exclusive state are selected, I don't like that an arbitrary string
>> select the state like that, if we do it that way an enumerator would
>> be better, I prefer bools.
>
> I am sorry but that is how it was originally in the first patch.
> Alexandre's review comment suggested this method in [1] and [2] (below).
>
> Alexandre, any comments?
>
> [1] http://marc.info/?l=linux-gpio&m=141456662426151&w=2
>
> [2] http://marc.info/?l=linux-gpio&m=141715982424744&w=2

When Linus and I are in conflict, follow Linus. Arnd's suggestion of
having enums defined in (IIUC) include/dt-bindings/gpio and using them
sounds good to me too and might make everyone happy (no possibility of
conflicting definitions + no strings). Linus, could you comment on it?
