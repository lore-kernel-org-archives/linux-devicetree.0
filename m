From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 03/10] clk: sunxi: Let divs clocks read
 the base factor clock name from devicetree
Date: Mon, 18 May 2015 22:45:29 +0800
Message-ID: <CAGb2v64SQZ74E5zn3XwgLtBh_PN=24bQ8RJ4oj8C+Gy0qAgtHA@mail.gmail.com>
References: <1431707940-19372-1-git-send-email-jenskuske@gmail.com>
 <1431707940-19372-4-git-send-email-jenskuske@gmail.com> <CAGb2v64y8+bdya3N=gK-YEie3A9nVM5nuxRZTVPXYSaN6WzPoQ@mail.gmail.com>
 <5559ADBE.7060506@gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBJHW46VAKGQEMKZNSCA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <5559ADBE.7060506-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, VishnuPatekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 18, 2015 at 5:15 PM, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi,
>
> On 05/16/15 04:10, Chen-Yu Tsai wrote:
>> 2015=E5=B9=B45=E6=9C=8816=E6=97=A5 =E4=B8=8A=E5=8D=8812:39=E6=96=BC "Jen=
s Kuske" <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=E5=AF=AB=E9=81=93=EF=BC=9A
> [..]
>>> @@ -1141,6 +1133,7 @@ static void __init sunxi_divs_clk_setup(struct
>> device_node *node,
>>>         struct clk_gate *gate =3D NULL;
>>>         struct clk_fixed_factor *fix_factor;
>>>         struct clk_divider *divider;
>>> +       struct factors_data factors =3D *data->factors;
>
> Isn't this a copy?

You're right. Sorry for the noise.

>
>>>         void __iomem *reg;
>>>         int ndivs =3D SUNXI_DIVS_MAX_QTY, i =3D 0;
>>>         int flags, clkflags;
>>> @@ -1149,8 +1142,17 @@ static void __init sunxi_divs_clk_setup(struct
>> device_node *node,
>>>         if (data->ndivs)
>>>                 ndivs =3D data->ndivs;
>>>
>>> +       /* Try to find a name for base factor clock */
>>> +       for (i =3D 0; i < ndivs; i++) {
>>> +               if (data->div[i].self) {
>>> +                       of_property_read_string_index(node,
>> "clock-output-names",
>>> +                                                     i, &factors.name)=
;
>>
>> Please excuse the bad formatting.
>> I'm at the airport without my laptop.
>>
>> This will not work. All the static factors_data structs are const.
>> You should make a copy of it, maybe on the stack,
>> update the .name field, and pass that to sunxi_factors_clk_setup().
>>
>
> If I didn't miss anything, or misunderstood what you want to copy, this
> should be working fine.
>
> Jens
>

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
