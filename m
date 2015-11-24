From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/6] mfd: axp20x: Split the driver into
 core and i2c bits
Date: Tue, 24 Nov 2015 17:21:31 +0200
Message-ID: <CAHp75VcPTYfnN4xj5d3Z51qtJ5CyK5U3T7qyfmXU4PcrqSHXgg@mail.gmail.com>
References: <1448336916-31212-1-git-send-email-wens@csie.org>
	<1448336916-31212-3-git-send-email-wens@csie.org>
	<CAHp75VesF5M6nJf6eaBO+Dg6nC3gj=rzL9YnQFAysQ4NFgOMHg@mail.gmail.com>
	<CAGb2v65EH8sP_ONASZ5gWZXi1D0GqiJvT=X0ieYWehnfqM1Z=A@mail.gmail.com>
	<CAHp75VdGAAh56dJRh=ETJLJGFguuw+6mNSfRQ7Br7tAjeZv+3w@mail.gmail.com>
	<CAGb2v6592Yvh0=Q3=fgzj8AdRb37D4mRj0vnyJ3gXqGFBv2saw@mail.gmail.com>
Reply-To: andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCT4VV5O2QKBB64A2KZAKGQELK5UBNQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAGb2v6592Yvh0=Q3=fgzj8AdRb37D4mRj0vnyJ3gXqGFBv2saw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 24, 2015 at 5:09 PM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> On Tue, Nov 24, 2015 at 8:35 PM, Andy Shevchenko
> <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Tue, Nov 24, 2015 at 1:28 PM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
>>> On Tue, Nov 24, 2015 at 5:37 PM, Andy Shevchenko
>>> <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>> On Tue, Nov 24, 2015 at 5:48 AM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
>>>>> The axp20x driver assumes the device is i2c based. This is not the
>>>>> case with later chips, which use a proprietary 2 wire serial bus
>>>>> by Allwinner called "Reduced Serial Bus".
>>>>>
>>>>> This patch follows the example of mfd/wm831x and splits it into
>>>>> an interface independent core, and an i2c specific glue layer.
>>>>> MFD_AXP20X and the new MFD_AXP20X_I2C are changed to tristate
>>>>> symbols, allowing the driver to be built as modules.
>>>>>
>>>>> Included but unused header files are removed as well.
>>
>> So=E2=80=A6
>>
>>>>> +       if (dev->of_node) {
>>>>
>>>> What about
>>>>
>>>> if (=E2=80=A6of_node) {
>>>>       const struct of_device_id *id;
>>>> =E2=80=A6
>>>> } else if ACPI_COMPANION(=E2=80=A6) {
>>
>> This should be has_acpi_companion().
>
> I don't think the "else if" is necessary. There's only 2 possible ways
> the device gets probed, either device tree or ACPI.

OK.

It would be ideal to move to unified device properties API at some
point, but it's out of scope of this series anyway.

>
>>>>       const struct acpi_device_id *id;
>>>> =E2=80=A6
>>>> } else {
>>>>  return -ENODEV;
>>>> }
>>>
>>> I really don't want to change code that I'm just moving around.
>>> Same goes for the other comments about this patch. I can do another
>>> patch on top of this to fix the style issues if it really bothers
>>> people.
>>
>> Fair enough.
>> My comments mostly about unnecessity of second parameter in the function=
s.
>>
>> So,  you already did some clean up in this patch (above), what about
>> to do another? I also prefer separate patch *before* you do a split.
>
> Sure. I'll do a patch or 2 before the split. Would you mind if I add your
> Suggested-by tag?

I would not.

--=20
With Best Regards,
Andy Shevchenko

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
