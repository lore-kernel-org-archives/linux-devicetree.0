From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] gpio: dt-bindings: document the concept of GPIO banks
Date: Fri, 8 Apr 2016 11:30:20 +0200
Message-ID: <CACRpkdY02Skx4v80PjmAN_0U0KGHhEzVOKnu2GWjAsG61zoU_Q@mail.gmail.com>
References: <1459415459-8107-1-git-send-email-linus.walleij@linaro.org>
	<CAL_JsqK+n-EwHx52=d9-dTJaVsSOzRS+PAmyCYwe6HK=kDoyGQ@mail.gmail.com>
	<56FD2689.1080707@atmel.com>
	<CAL_JsqKzzoSOFY9b9jwOVa4EZdzzRDusOEtDuOwnB7Q3x6W=eQ@mail.gmail.com>
	<56FD399A.8090600@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56FD399A.8090600-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 31, 2016 at 4:52 PM, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
> On 03/31/2016 04:48 PM, Rob Herring wrote:

>>>> We generally avoid indexing blocks in DT.
>>
>> Which is a global number space that might not work in all cases. I
>> don't think gpio should be using aliases either. If you need to
>> describe the connections between nodes, then keep that between nodes.
>
> Couldn't we use gpio-ranges ?

GPIO ranges are normally for cross-referencing GPIO blocks to
pin controllers but in essence, yes we *could*.

But what people will do is to use that backwards to calculate
the bank ID.

They would just get the GPIO base offset from the
range and /32 to get the bank ID. All over the place...
Also for GPIO controllers without pin control back-ends.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
