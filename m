From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: vc5: Add support for IDT VersaClock 5P49V5935
Date: Tue, 4 Apr 2017 15:23:57 +0200
Message-ID: <CAMuHMdUOtY5i0_BoS7cKYzWKpA_fF3VssN4bZnNyFB117EpacQ@mail.gmail.com>
References: <1491311788-31905-1-git-send-email-alexey_firago@mentor.com>
 <1491311788-31905-3-git-send-email-alexey_firago@mentor.com> <72c66927-0acf-c888-2b4b-906a6c27e15c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <72c66927-0acf-c888-2b4b-906a6c27e15c-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexey Firago <alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 4, 2017 at 3:21 PM, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>On 04/04/2017 03:16 PM, Alexey Firago wrote:
>> +     switch (vc5->model) {
>> +     case IDT_VC5_5P49V5923:
>> +     case IDT_VC5_5P49V5933:
>> +             vc5->clk_fod_cnt = 2;
>> +             vc5->clk_out_cnt = 3;
>> +             break;
>> +     case IDT_VC5_5P49V5935:
>> +             vc5->clk_fod_cnt = 4;
>> +             vc5->clk_out_cnt = 5;
>> +             break;
>> +     default:
>> +             /* Should never go here */
>> +             dev_err(&client->dev, "unsupported IDT VC5 ID specified\n");
>> +             return -EINVAL;
>> +     }
>> +
>>       vc5->pin_xin = devm_clk_get(&client->dev, "xin");
>>       if (PTR_ERR(vc5->pin_xin) == -EPROBE_DEFER)
>>               return -EPROBE_DEFER;

>> @@ -744,7 +772,7 @@ static int vc5_probe(struct i2c_client *client,
>>       return 0;
>>
>>  err_clk:
>> -     if (vc5->model == IDT_VC5_5P49V5933)
>> +     if (vc5->model == IDT_VC5_5P49V5933 || vc5->model == IDT_VC5_5P49V5935)
>
> Maybe we should introduce some sort of flags to describe the VC
> properties instead of using the model all over the place ?

Yep, a structure describing the features (incl. fod_cnt and out_cnt), to be
pointed to by clk_vc5_of_match[].data.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
