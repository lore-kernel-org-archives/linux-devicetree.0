From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [PATCH v4 4/6] reset: sunxi: Add Allwinner H3
 bus resets
Date: Mon, 23 Nov 2015 15:41:52 +0800
Message-ID: <CAGb2v665C-EM4t1h3rQ=hNR=1Z4J2mp7DRy_zM8-OkCXzZ03iw@mail.gmail.com>
References: <1445964626-6484-1-git-send-email-jenskuske@gmail.com>
 <1445964626-6484-5-git-send-email-jenskuske@gmail.com> <13919923.o3Dj9msmoa@wuerfel>
 <20151104163014.GB6114@lukather> <20151105074730.fd6a9d57a1f2c7933478c680@free.fr>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBV4GZOZAKGQENKO6DNQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20151105074730.fd6a9d57a1f2c7933478c680-GANU6spQydw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: moinejf-GANU6spQydw@public.gmane.org
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 5, 2015 at 2:47 PM, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org> wrote:
> On Wed, 4 Nov 2015 08:30:14 -0800
> Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>
>> Hi Arnd,
>>
>> On Fri, Oct 30, 2015 at 09:27:03AM +0100, Arnd Bergmann wrote:
>> > On Tuesday 27 October 2015 17:50:24 Jens Kuske wrote:
>> > >
>> > > +static int sun8i_h3_bus_reset_xlate(struct reset_controller_dev *rcdev,
>> > > +                                   const struct of_phandle_args *reset_spec)
>> > > +{
>> > > +       unsigned int index = reset_spec->args[0];
>> > > +
>> > > +       if (index < 96)
>> > > +               return index;
>> > > +       else if (index < 128)
>> > > +               return index + 32;
>> > > +       else if (index < 160)
>> > > +               return index + 64;
>> > > +       else
>> > > +               return -EINVAL;
>> > > +}
>> > > +
>> > >
>> >
>> > This looks like you are doing something wrong and should either
>> > put the actual number into DT,
>>
>> This is the actual number, except that there's some useless registers
>> in between. Allwinner documents it like that:
>>
>> 0x0   Reset 0
>> 0x4   Reset 1
>> 0xc   Reset 2
>>
>> So we have to adjust the offset to account with the blank register in
>> between (0x8).
>>
>> > or use a two-cell representation, with the first cell indicating the
>> > block (0, 1 or 2), and the second cell the index.
>>
>> And the missing register is not a block either.
>>
>> That would also imply either changing the bindings of that driver (and
>> all the current DTS that are using it), or introducing a whole new
>> driver just to deal with some extraordinary offset calculation.
>
> In the H3, the holes are not used, but what would occur if these holes
> would be used for some other purpose in future SoCs? Double mapping?

We'd have a different compatible string for it.

My suggestion for the resets is to just split them into 3 nodes: AHB
(since AHB1 and AHB2 devices are mixed together in the bunch), APB1,
and APB2 reset controls.

This follows what we have for existing SoCs, and gets rid of the unused
hole. We can use the existing "allwinner,sun6i-a31-clock-reset" and
"allwinner,sun6i-a31-ahb1-reset" compatibles.


Regards
ChenYu
