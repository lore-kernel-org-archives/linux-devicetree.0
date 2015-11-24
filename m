From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/6] mfd: axp20x: Split the driver into core and i2c bits
Date: Tue, 24 Nov 2015 14:35:49 +0200
Message-ID: <CAHp75VdGAAh56dJRh=ETJLJGFguuw+6mNSfRQ7Br7tAjeZv+3w@mail.gmail.com>
References: <1448336916-31212-1-git-send-email-wens@csie.org>
	<1448336916-31212-3-git-send-email-wens@csie.org>
	<CAHp75VesF5M6nJf6eaBO+Dg6nC3gj=rzL9YnQFAysQ4NFgOMHg@mail.gmail.com>
	<CAGb2v65EH8sP_ONASZ5gWZXi1D0GqiJvT=X0ieYWehnfqM1Z=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGb2v65EH8sP_ONASZ5gWZXi1D0GqiJvT=X0ieYWehnfqM1Z=A@mail.gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 24, 2015 at 1:28 PM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> Hi,
>
> On Tue, Nov 24, 2015 at 5:37 PM, Andy Shevchenko
> <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Tue, Nov 24, 2015 at 5:48 AM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
>>> The axp20x driver assumes the device is i2c based. This is not the
>>> case with later chips, which use a proprietary 2 wire serial bus
>>> by Allwinner called "Reduced Serial Bus".
>>>
>>> This patch follows the example of mfd/wm831x and splits it into
>>> an interface independent core, and an i2c specific glue layer.
>>> MFD_AXP20X and the new MFD_AXP20X_I2C are changed to tristate
>>> symbols, allowing the driver to be built as modules.
>>>
>>> Included but unused header files are removed as well.

So=E2=80=A6

>>> +       if (dev->of_node) {
>>
>> What about
>>
>> if (=E2=80=A6of_node) {
>>       const struct of_device_id *id;
>> =E2=80=A6
>> } else if ACPI_COMPANION(=E2=80=A6) {

This should be has_acpi_companion().

>>       const struct acpi_device_id *id;
>> =E2=80=A6
>> } else {
>>  return -ENODEV;
>> }
>
> I really don't want to change code that I'm just moving around.
> Same goes for the other comments about this patch. I can do another
> patch on top of this to fix the style issues if it really bothers
> people.

=46air enough.
My comments mostly about unnecessity of second parameter in the functio=
ns.

So,  you already did some clean up in this patch (above), what about
to do another? I also prefer separate patch *before* you do a split.

>>> +       axp20x =3D devm_kzalloc(&i2c->dev, sizeof(*axp20x), GFP_KER=
NEL);
>>> +       if (!axp20x)
>>> +               return -ENOMEM;
>>> +
>>> +       ret =3D axp20x_i2c_match_device(axp20x, &i2c->dev);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       axp20x->dev =3D &i2c->dev;
>>> +       axp20x->irq =3D i2c->irq;
>>
>> If you move _match_device() here you will be able to drop away struc=
t
>> device * parameter.

--=20
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
