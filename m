From: Arend van Spriel <arend@broadcom.com>
Subject: Re: [Patch v5 2/2] gpio: Document GPIO hogging mechanism
Date: Mon, 12 Jan 2015 11:28:00 +0100
Message-ID: <54B3A1B0.1010005@broadcom.com>
References: <1419019671-25377-1-git-send-email-bparrot@ti.com>	<1419019671-25377-3-git-send-email-bparrot@ti.com> <CACRpkdb7Wq7-rBypqPkefejY5Qfq_KKx91H+DxKWv-TM2y04bg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb7Wq7-rBypqPkefejY5Qfq_KKx91H+DxKWv-TM2y04bg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Benoit Parrot <bparrot@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Jiri Prchal <jiri.prchal@aksignal.cz>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

On 01/12/15 11:20, Linus Walleij wrote:
> On Fri, Dec 19, 2014 at 9:07 PM, Benoit Parrot<bparrot@ti.com>  wrote:
>
>> Add GPIO hogging documentation to gpio.txt
>>
>> Signed-off-by: Benoit Parrot<bparrot@ti.com>
>> Reviewed-by: Alexandre Courbot<acourbot@nvidia.com>
>
> This is starting to look good ...
>
>> +               line_b {
>> +                       gpio-hog;
>> +                       gpios =<6 0>;
>> +                       state = "output-low";
>
> I don't like the state string.
>
> Instead have boolean properties for all states.
>
> line_b {
>      gpio-hog;
>      gpios =<6 0>;
>      output-low;
>      line-name = "foo-bar-gpio";
> }
>
> Then use of_property_read_bool() in the code to check which
> state is to be selected intially. You can check that no mutually
> exclusive state are selected, I don't like that an arbitrary string
> select the state like that, if we do it that way an enumerator would
> be better, I prefer bools.

To avoid the mutual exclusive state checking, would it not be more 
straightforward to use numeric enum values defined in boot/dts/include.

Regards,
Arend

> Yours,
> Linus Walleij
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

