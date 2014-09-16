From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [PATCH 1/7] clk: sunxi: Add post clk divider
 for factor clocks
Date: Tue, 16 Sep 2014 16:11:27 +0800
Message-ID: <CAGb2v655SryUfMyhY2aeVSHzK8+ykNEZ9CiNJcA610Dkbv0pMg@mail.gmail.com>
References: <1410000448-9999-1-git-send-email-wens@csie.org>
 <1410000448-9999-2-git-send-email-wens@csie.org> <54145822.4020607@elopez.com.ar>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBRHB36QAKGQEHG526SI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <54145822.4020607-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Sat, Sep 13, 2014 at 10:43 PM, Emilio L=C3=B3pez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org> =
wrote:
> Hi,
>
> El 06/09/14 a las 07:47, Chen-Yu Tsai escibi=C3=B3:
>
>> Some factor clocks, mostly PLLs, have an extra fixed divider just before
>> the clock output. Add an option to the factor clk driver config data to
>> specify this divider.
>>
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> ---
>>   drivers/clk/sunxi/clk-factors.c | 3 +++
>>   drivers/clk/sunxi/clk-factors.h | 1 +
>>   2 files changed, 4 insertions(+)
>>
>> diff --git a/drivers/clk/sunxi/clk-factors.c
>> b/drivers/clk/sunxi/clk-factors.c
>> index 2057c8a..435111d 100644
>> --- a/drivers/clk/sunxi/clk-factors.c
>> +++ b/drivers/clk/sunxi/clk-factors.c
>> @@ -64,6 +64,9 @@ static unsigned long clk_factors_recalc_rate(struct
>> clk_hw *hw,
>>         /* Calculate the rate */
>>         rate =3D (parent_rate * (n + config->n_start) * (k + 1) >> p) / =
(m +
>> 1);
>>
>> +       if (config->post_div)
>> +               rate /=3D config->post_div;
>> +
>>         return rate;
>>   }
>>
>> diff --git a/drivers/clk/sunxi/clk-factors.h
>> b/drivers/clk/sunxi/clk-factors.h
>> index d2d0efa..ce70c65 100644
>> --- a/drivers/clk/sunxi/clk-factors.h
>> +++ b/drivers/clk/sunxi/clk-factors.h
>> @@ -16,6 +16,7 @@ struct clk_factors_config {
>>         u8 pshift;
>>         u8 pwidth;
>>         u8 n_start;
>> +       u8 post_div;
>>   };
>>
>>   struct clk_factors {
>>
>
> For the record, I liked your solution on[1] more, as it's in line with wh=
at
> we're doing on the other sunxi platforms, instead of adding features in
> factors to cover for some cases. But it's your and Maxime's call, as I
> haven't written any of the sun6i code so far.

I'm OK either way. It's really up to Maxime whether he likes the DT
representation.

> Cheers!
>
> Emilio
>
> [1] https://patchwork.kernel.org/patch/4228541/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
