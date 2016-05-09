From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 3/4] of: changesets: Introduce changeset helper methods
Date: Mon, 9 May 2016 10:08:10 -0500
Message-ID: <CAL_JsqLccQq5jebRU4NWc2_Hwbpak7eEnkPZjtV6mHeiTxswhQ@mail.gmail.com>
References: <1462800045-10943-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1462800045-10943-4-git-send-email-pantelis.antoniou@konsulko.com>
 <CAL_JsqJY7BcKV2djvSGq8KoQKPyFdFvs395w4L2o5+Lbc3ng4Q@mail.gmail.com> <F8E336E9-E400-4918-8E65-B3EFFC943D20@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <F8E336E9-E400-4918-8E65-B3EFFC943D20@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Matt Porter <mporter@konsulko.com>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, Marek Vasut <marex@denx.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 9, 2016 at 9:34 AM, Pantelis Antoniou
<pantelis.antoniou@konsulko.com> wrote:
> Hi Rob,
>
>> On May 9, 2016, at 17:27 , Rob Herring <robherring2@gmail.com> wrote=
:
>>
>> On Mon, May 9, 2016 at 8:20 AM, Pantelis Antoniou
>> <pantelis.antoniou@konsulko.com> wrote:
>>> Changesets are very powerful, but the lack of a helper API
>>> makes using them cumbersome. Introduce a simple copy based
>>> API that makes things considerably easier.

[...]

>>> +       /*
>>> +        * NOTE: There is no check for zero length value.
>>> +        * In case of a boolean property, this will allocate a valu=
e
>>> +        * of zero bytes. We do this to work around the use
>>> +        * of of_get_property() calls on boolean values.
>>> +        */
>>> +       new_value =3D kmemdup(value, length, GFP_KERNEL);
>>> +       if (!new_value)
>>> +               goto out_no_value;
>>> +
>>> +       of_property_set_flag(prop, OF_DYNAMIC);
>>> +
>>> +       prop->name =3D new_name;
>>> +       prop->value =3D new_value;
>>> +       prop->length =3D length;
>>> +
>>> +       if (!update)
>>> +               ret =3D of_changeset_add_property(ocs, np, prop);
>>> +       else
>>> +               ret =3D of_changeset_update_property(ocs, np, prop)=
;
>>> +
>>> +       if (ret !=3D 0)
>>
>> if (!ret)
>>  return 0;
>>
>>
>
>>> +               goto out_no_add;
>>> +
>>> +       return 0;
>>> +
>>> +out_no_add:
>>
>> ... and remove all this.
>>
>
> Err, there=E2=80=99s an exit path here from kmemdup (goto err_no_valu=
e).
> We=E2=80=99ll be leaking memory on error.

No you won't. "This" is the hunk above it. The error handling would
still be here:

>>> +       kfree(prop->value);
>>> +out_no_value:
>>> +       kfree(prop->name);
>>> +out_no_name:
>>> +       kfree(prop);
>>> +out_no_prop:
>>> +       return ret;
>>> +}
