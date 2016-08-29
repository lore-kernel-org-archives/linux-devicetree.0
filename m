From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4 v2] soc: qcom: add EBI2 device tree bindings
Date: Mon, 29 Aug 2016 15:22:53 +0200
Message-ID: <CACRpkdbfLXk9_Pgz-Qghgd49fq7rJsTHYvVH4L8C+w2_Aftt7g@mail.gmail.com>
References: <1472028758-29272-1-git-send-email-linus.walleij@linaro.org>
 <1472028758-29272-2-git-send-email-linus.walleij@linaro.org> <201608291516.59380.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201608291516.59380.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 29, 2016 at 3:16 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Wednesday 24 August 2016, Linus Walleij wrote:
>> +
>> +ebi2@1a100000 {
>> +     compatible = "qcom,apq8060-ebi2";
>> +     #address-cells = <2>;
>> +     #size-cells = <1>;
>> +     ranges = <0 0x0 0x1a800000 0x00800000>,
>> +              <1 0x0 0x1b000000 0x00800000>,
>> +              <2 0x0 0x1b800000 0x00800000>,
>> +              <3 0x0 0x1d000000 0x00800000>,
>> +              <4 0x0 0x1c800000 0x00800000>,
>> +              <5 0x0 0x1c000000 0x00800000>;
>> +     reg = <0x1a100000 0x1000>, <0x1a110000 0x1000>;
>> +     reg-names = "ebi2", "xmem";
>
> ...
>
>> +     foo-ebi2@1b800000 {
>> +             compatible = "foo";
>> +             reg = <2 0x1b800000 0x100>;
>> +             (...)
>> +     };
>> +};
>
> In this example, the addresses don't match: I assume the child
> node should be listed as
>
>         foo-ebi@2,0 {
>                 reg = <2 0 0x100>;
>         };
>
> instead.

Yeah it's a plain mistake, sorry..

Noticed it too when following up in the other thread.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
