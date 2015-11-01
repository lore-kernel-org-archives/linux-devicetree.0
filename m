From: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/6] clk: sunxi: Let divs clocks read the
 base factor clock name from devicetree
Date: Sun, 1 Nov 2015 14:11:12 +0100
Message-ID: <56360F70.3050400@gmail.com>
References: <1445964626-6484-1-git-send-email-jenskuske@gmail.com>
 <1445964626-6484-2-git-send-email-jenskuske@gmail.com>
 <CAGb2v670cXEPcUFLtsCMFD+s6zUSt+wQg553QXCQHtDtRh9Xmg@mail.gmail.com>
Reply-To: jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCC5XIE2SIHBBYNM3CYQKGQEAA6XRQQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAGb2v670cXEPcUFLtsCMFD+s6zUSt+wQg553QXCQHtDtRh9Xmg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 30/10/15 08:46, Chen-Yu Tsai wrote:
> On Wed, Oct 28, 2015 at 12:50 AM, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
[..]
>> @@ -991,8 +985,30 @@ static void __init sunxi_divs_clk_setup(struct device_node *node,
>>         if (data->ndivs)
>>                 ndivs = data->ndivs;
>>
>> +       /* Try to find a name for base factor clock */
>> +       for (i = 0; i < ndivs; i++) {
>> +               if (data->div[i].self) {
>> +                       of_property_read_string_index(node, "clock-output-names",
>> +                                                     i, &factors.name);
>> +                       break;
>> +               }
>> +       }
>> +       /* If we don't have a .self clk use the first output-name up to '_' */
> 
> This actually only works for the sun4i divs clocks. sun6i-a31-pll6 uses a
> different naming convention. sun4i-a10-pll2 uses yet another, though that's
> not a divs clock. Maybe we should work on unifying them. Maxime?

All the divs clocks I could find either have a .self (handled by the
first case above) or follow this naming convention, so it should work.
But if we find a better way to clean up the divs without breaking
devicetree bindings (as far as I understood we must not break them, am I
right there?) I'd be happy with that too.

Jens


> 
> Other than these 2 bits of information, this patch looks good.
> 
> 
> Regards
> ChenYu
> 
>> +       if (factors.name == NULL) {
>> +               of_property_read_string_index(node, "clock-output-names",
>> +                                                     0, &clk_name);
>> +
>> +               for (i = 0; i < SUNXI_DIVS_BASE_NAME_MAX_LEN - 1 &&
>> +                                               clk_name[i] != '_' &&
>> +                                               clk_name[i] != '\0'; i++)
>> +                       base_name[i] = clk_name[i];
>> +
>> +               base_name[i] = '\0';
>> +               factors.name = base_name;
>> +       }
>> +
>>         /* Set up factor clock that we will be dividing */
>> -       pclk = sunxi_factors_clk_setup(node, data->factors);
>> +       pclk = sunxi_factors_clk_setup(node, &factors);
>>         parent = __clk_get_name(pclk);
>>
>>         reg = of_iomap(node, 0);
>> --
>> 2.6.2
>>
> 
