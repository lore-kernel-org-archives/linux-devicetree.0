From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/5] clk: sunxi: Add support for USB
 clock-register reset bits
Date: Thu, 06 Feb 2014 17:58:59 +0100
Message-ID: <52F3BF53.8000408@redhat.com>
References: <1390426587-16287-1-git-send-email-hdegoede@redhat.com> <1390426587-16287-2-git-send-email-hdegoede@redhat.com> <52E80746.9020500@elopez.com.ar>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBYH6Z2LQKGQEFQ2NYZI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <52E80746.9020500-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 01/28/2014 08:38 PM, Emilio L=F3pez wrote:
> Hi Hans,
>
> El 22/01/14 18:36, Hans de Goede escribi=F3:
>> The usb-clk register is special in that it not only contains clk gate bi=
ts,
>> but also has a few reset bits. This commit adds support for this by allo=
wing
>> gates type sunxi clks to also register a reset controller.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
> (snip)
>>   static const struct gates_data sun4i_axi_gates_data __initconst =3D {
>> @@ -818,6 +873,7 @@ static void __init sunxi_gates_clk_setup(struct devi=
ce_node *node,
>>                        struct gates_data *data)
>>   {
>>       struct clk_onecell_data *clk_data;
>> +    struct gates_reset_data *reset_data;
>>       const char *clk_parent;
>>       const char *clk_name;
>>       void *reg;
>> @@ -861,6 +917,21 @@ static void __init sunxi_gates_clk_setup(struct dev=
ice_node *node,
>>       clk_data->clk_num =3D i;
>>
>>       of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
>> +
>> +    /* Register a reset controler for gates with reset bits */
>> +    if (data->reset_mask =3D=3D 0)
>> +        return;
>> +
>> +    reset_data =3D kzalloc(sizeof(*reset_data), GFP_KERNEL);
>> +    if (!reset_data)
>> +        return;
>> +
>> +    reset_data->reg =3D reg;
>> +    reset_data->lock =3D &clk_lock;
>> +    reset_data->rcdev.nr_resets =3D hweight32(data->reset_mask);
>
> I know I made you change this, but after having a second look into nr_res=
ets, I think your original implementation makes more sense. This will break=
 if you use a mask with holes on it. Sorry :(

No problem, just changed it back :)

Regards,

Hans

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/groups/opt_out.
