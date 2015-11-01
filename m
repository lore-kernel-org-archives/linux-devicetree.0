From: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 4/6] reset: sunxi: Add Allwinner H3 bus resets
Date: Sun, 1 Nov 2015 14:21:41 +0100
Message-ID: <563611E5.3000206@gmail.com>
References: <1445964626-6484-1-git-send-email-jenskuske@gmail.com>
 <1445964626-6484-5-git-send-email-jenskuske@gmail.com>
 <13919923.o3Dj9msmoa@wuerfel>
Reply-To: jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCC5XIE2SIHBBZNM3CYQKGQEBNLFECI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <13919923.o3Dj9msmoa@wuerfel>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 30/10/15 09:27, Arnd Bergmann wrote:
> On Tuesday 27 October 2015 17:50:24 Jens Kuske wrote:
>>
>> +static int sun8i_h3_bus_reset_xlate(struct reset_controller_dev *rcdev,
>> +                                   const struct of_phandle_args *reset_spec)
>> +{
>> +       unsigned int index = reset_spec->args[0];
>> +
>> +       if (index < 96)
>> +               return index;
>> +       else if (index < 128)
>> +               return index + 32;
>> +       else if (index < 160)
>> +               return index + 64;
>> +       else
>> +               return -EINVAL;
>> +}
>> +
>>
> 
> This looks like you are doing something wrong and should either
> put the actual number into DT, or use a two-cell representation,
> with the first cell indicating the block (0, 1 or 2), and the
> second cell the index.
> 

I tried to fix up the somewhat strange register layout here.

>From the datasheet:
BUS_SOFT_RST_REG0	0x02C0	Bus Software Reset Register 0
BUS_SOFT_RST_REG1	0x02C4	Bus Software Reset Register 1
BUS_SOFT_RST_REG2	0x02C8	Bus Software Reset Register 2
BUS_SOFT_RST_REG3	0x02D0	Bus Software Reset Register 3
BUS_SOFT_RST_REG4	0x02D8	Bus Software Reset Register 4

0x2cc and 0x2d4 are unused for some reason, but the regs are named 0-4,
so it lead to some confusion with the actual numbers in DT.
If we shouldn't do this I would be ok with putting the actual number
into DT too.

Jens
