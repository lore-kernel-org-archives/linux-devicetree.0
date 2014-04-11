From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RESEND 2/5] pinctrl: berlin: add a pinctrl driver for
 Marvell Berlin SoCs
Date: Fri, 11 Apr 2014 15:35:06 +0200
Message-ID: <5347EF8A.8040600@gmail.com>
References: <1397135274-10764-1-git-send-email-antoine.tenart@free-electrons.com> <1397135274-10764-3-git-send-email-antoine.tenart@free-electrons.com> <5347AFF4.3050607@gmail.com> <20140411123737.GA5903@kwain>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140411123737.GA5903@kwain>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?QW50b2luZSBUw6luYXJ0?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/11/2014 02:37 PM, Antoine T=C3=A9nart wrote:
> On Fri, Apr 11, 2014 at 11:03:48AM +0200, Sebastian Hesselbarth wrote=
:
>> On 04/10/2014 03:07 PM, Antoine T=C3=A9nart wrote:
>>> The Marvell Berlin boards have a group based pinmuxing mechanism. T=
his
>>> driver adds the support for the BG2CD, BG2 and BG2Q. We actually do=
 not
>>> need any information about the pins here and only have the definiti=
on
>>> of the groups.
>>
[...]
>>> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
>>> index 4b835880cf80..fd5a01d4475f 100644
>>> --- a/drivers/pinctrl/Makefile
>>> +++ b/drivers/pinctrl/Makefile
>>> @@ -21,6 +21,7 @@ obj-$(CONFIG_PINCTRL_BF60x)	+=3D pinctrl-adi2-bf6=
0x.o
>>>   obj-$(CONFIG_PINCTRL_AT91)	+=3D pinctrl-at91.o
>>>   obj-$(CONFIG_PINCTRL_BCM2835)	+=3D pinctrl-bcm2835.o
>>>   obj-$(CONFIG_PINCTRL_BAYTRAIL)	+=3D pinctrl-baytrail.o
>>> +obj-$(CONFIG_PINCTRL_BERLIN)	+=3D pinctrl-berlin.o
>>
>> Please split the driver into common and soc-specific parts, and if
>> you do please put it into a subfolder berlin, too.
>
> The only SoC specific part is the group structure. I'll need to have
> functions in each SoC specific part calling ... only the common ones.
> Do you have a better solution in mind ?

We have a similar structure for mvebu, control is common, structure is
not. You'll have one common driver to register pinctrl and switch a
specific mux, and one file for each SoC holding the group structure
and function table.

If bg2 and bg2cd have the same group layout but different functions
assigned to it, you can either strictly separate by SoC or separate
by similarity. Have a look at e.g. pinctrl/mvebu/pinctrl-kirkwood.c,
although SoCs are different with respect to individual functions, we
have a variant mask to determine if a specific function is available
on that SoC.

But if bg2 and bg2cd are _very_ different from the functions assigned
to each group, I'd rather have two separate files, too.

Basically, folder structure will look like this:
drivers/pinctrl
   +- berlin/
      +- common.c : common code (pinctrl register, pinmux)
      +- common.h : common include (group structure, common callbacks)
      +- bg2.c    : BG2 specific group/function tables
      +- bg2cd.c  : BG2CD specific group/function tables
      +- bg2q.c   : BG2Q specific group/function tables
      +- ...

(BTW, as we know we are beneath drivers/pinctrl, drop the pinctrl-
prefix)

If we consider bg2cd as a variant of bg2, join the two files above
and have a variant mask as we have for Kirkwood.

[...]
>>> +	function_name =3D kzalloc(strlen(group_name) + 7, GFP_KERNEL);
>>> +	if (!function_name)
>>> +		return -ENOMEM;
>>> +	snprintf(function_name, strlen(group_name) + 7, "%s_mode%d", grou=
p_name,
>>> +			function);
>>
>> With proper mode tables above, this can refer to a const char* and y=
ou
>> can get rid of allocation here. Also, below you already allocated
>> function_names, how is this one different from the below?
>
> The one below is used to describe the available functions for a given=
 group
> while this one describe a function found in the device tree. It is us=
ed to check
> the function we want to use in the device is provided by the driver. =
The

Ah, ok. With numeric values for marvell,function and proper function=20
tables for each of the groups, you can just look up the group and loop
over the available functions. Or if you prefer strings, give a proper
name to each function in the table and use that string as DT match.

> function name used here may not actually exist. We could check the fu=
nction
> actually exists here (and find the previously allocated function name=
), but this
> check is handled by the pinctrl framework. This would end up in a dif=
ferent
> behaviour than the expected one, imho.
[...]
>>> +static int berlin_pinctrl_build_state(struct platform_device *pdev=
,
>>> +			      struct berlin_pinctrl_reg_base *bases,
>>> +			      unsigned nbases)
>>> +{
>>> +	struct berlin_pinctrl *pctrl =3D platform_get_drvdata(pdev);
>>> +	int i, j, cur_fct =3D 0;
>>> +
>>> +	pctrl->ngroups =3D pctrl->desc->ngroups;
>>> +	pctrl->nfunctions =3D 0;
>>> +
>>> +	for (i =3D 0; i < pctrl->ngroups; i++) {
>>> +		struct berlin_desc_group const *desc =3D pctrl->desc->groups + i=
;
>>> +		pctrl->nfunctions +=3D NFCTS(desc->bit_width);
>>> +	}
>>
>> As you need desc later on, make it global to this function. Then you
>> can also walk through it with desc++
>>
>> desc =3D pctrl->desc->groups;
>> for (i =3D 0; i < pctl->ngroups; i++, desc++)
>> 	pctrl->nfunctions =3D ...
>>
>> Having said that, the above assumes that each function is unique
>> but IIRC the idea of the function table was to group pins/groups
>> with the same function, e.g. function "gpio", groups 1,7,25,...
>
> Most of the functions you can use on the Berlin they will be unique a=
nd would
> only be used in one group, except for the 'gpio' one.

Yeah, I had a similar discussion about it back then for mvebu. IIRC, th=
e
correct answer is: Have a list of functions with groups assigned to it
no matter if there is only one group per function (or 40 per function a=
s
it will be for gpio).

Maybe Linus can give an update on how to deal with it?

Sebastian

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
