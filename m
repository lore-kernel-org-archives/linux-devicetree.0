From: Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 6/6] pinctrl: add pinctrl gpio binding support
Date: Sat, 26 May 2012 09:52:32 -0700
Message-ID: <CAA+hA=QMe6Yo2aLMBcbkYLDXSagb9L919hjdQaq8TyH4uKh9Mw@mail.gmail.com>
References: <1337952980-14621-1-git-send-email-b29396@freescale.com>
 <1337952980-14621-6-git-send-email-b29396@freescale.com>
 <4FBFBB74.901@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4FBFBB74.901-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, May 25, 2012 at 10:03 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wr=
ote:
> On 05/25/2012 07:36 AM, Dong Aisheng wrote:
>> From: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>> This patch implements a standard common binding for pinctrl gpio ranges.
>> Each SoC can add gpio ranges through device tree by adding a gpio-maps p=
roperty
>> under their pinctrl devices node with the format:
>> <&gpio $gpio-specifier $pin_offset $count>
>> while the gpio phandle and gpio-specifier are the standard approach
>> to represent a gpio in device tree.
>> Then we can cooperate it with the gpio xlate function to get the gpio nu=
mber
>> from device tree to set up the gpio ranges map.
>>
>> Then the pinctrl driver can call pinctrl_dt_add_gpio_ranges(pctldev, nod=
e)
>> to parse and register the gpio ranges from device tree.
>>
>> Signed-off-by: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>> Personally i'm not very satisfied with current solution due to a few rea=
sons:
>> 1) i can not user standard gpio api to get gpio number
>> 2) i need to reinvent a new api of_parse_phandles_with_args_ext which i'=
m not
>> sure if it can be accepted by DT maintainer.
>> If i did not invent that API, i need to rewrite a lot of duplicated code
>> with slight differences with the exist functions like of_get_named_gpio_=
flags
>> and of_parse_phandle_with_args for the special pinctrl gpio maps format.
>>
>> So i just sent it out first to see people's comment and if any better so=
lution.
>>
>> One alternative solution is that that the gpio-maps into two parts:
>> pinctrl-gpios =3D <&gpio_phandle gpio-specifier ..>
>> pinctrl-gpio-maps =3D <pin_id count ..>
>> Then we can reuse the standard gpio api altough it's not better than the
>> original one.
>
> The problem I see with that is that it splits what is essentially a
> single array with phandle+specifier+pin-id+count into two separate
> arrays. Anyone reading/editing the DT needs to fully understand this,
> and keep the entries in the two properties in the same order. Putting
> everything into a single property makes this much more obvious to me. I
Yes, i agree with you.
That's why i insisted to send this format first.

> personally don't see any issue with the
> of_parse_phandles_with_args_ext() function; it seems pretty clean to me.
>
Thanks, you gave me some confidence on it.

>> diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
>
>> + =A0 =A0 if (!nranges) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(pctldev->dev, "no gpio ranges found\n"=
);
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
>> + =A0 =A0 }
>
> In the case of a generic pinctrl IP block that can support an external
> GPIO controller but happens not to be hooked up to one within a
> particular SoC, that might not be an error. However, that situation is
> pretty unlikely, so I think it's find to call dev_err() for now, and we
> can change it later if we need.
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 ranges[i].base =3D ranges[i].gc->of_xlate(rang=
es[i].gc, &gpiospec, NULL);
>
> I believe Grant wants to change the of_xlate prototype in order to be
> able to return a different gc value, so this will probably need slight
> rework work with that change, once they're both approved. Still, I think
> this is fine for now.
>
I looked Grant's commit 3d0f7cf0f "gpio: Adjust of_xlate API to
support multiple GPIO
chips", it seemed i need make some changes here since
of_node_to_gpiochip is broken now
after support banked gpio. Thus the gc got here may not correct for
some special gpio
controllers.

>> + =A0 =A0 =A0 =A0 =A0 =A0 if (ranges[i].base < 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 ranges[i].base +=3D ranges[i].gc->base;
>> + =A0 =A0 =A0 =A0 =A0 =A0 ranges[i].pin_base =3D gpiospec.args[gpiospec.=
args_count - 2];
>> + =A0 =A0 =A0 =A0 =A0 =A0 ranges[i].npins =3D gpiospec.args[gpiospec.arg=
s_count - 1];
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 gpiochip_put(ranges[i].gc);
>
> I wonder if this shouldn't happen until the pinctrl device is free'd,
> and all the GPIO ranges are removed from it?
>
Hmm, that may bring some complexities since non-dt case also needs
to be covered if we do that...

> If we don't do that, I would argue that we shouldn't store ranges[i].gc,
> since it might become invalid - I believe the only use of it is within
> this function?
>
In my option, i think it's ok to store it since they're just some data
to describe
hw properties. The gpio function may become invalid but not data.
Is it reasonable to you?

>> + =A0 =A0 =A0 =A0 =A0 =A0 of_node_put(gpiospec.np);
>> + =A0 =A0 }
>
> Aside from the comments I've made, this series all seems reasonable.
> There certainly are alternative ways of doing some of it, but I don't
> see any other approach having any particular advantage over this one.
> So, the series,
>
> Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Thanks.

Regards
Dong Aisheng
