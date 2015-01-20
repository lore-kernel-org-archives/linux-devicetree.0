From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] of: Custom printk format specifier for device node
Date: Tue, 20 Jan 2015 20:06:15 +0200
Message-ID: <B282C7F7-D221-4D7D-AB33-533C0204C4CF@konsulko.com>
References: <1421764441-11928-1-git-send-email-pantelis.antoniou@konsulko.com> <CAL_JsqLVJjq3Ov=J-5LtXiTQPLvR5Y=+tB1i16k_rN3j5dODFQ@mail.gmail.com> <E7065DB3-DD6B-4110-A066-8C7268186831@konsulko.com> <1421776794.2724.1.camel@perches.com>
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421776794.2724.1.camel-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Joe,

> On Jan 20, 2015, at 19:59 , Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org> wrote:
>=20
> On Tue, 2015-01-20 at 16:52 +0200, Pantelis Antoniou wrote:
>> Hi Rob,
>>=20
>>> On Jan 20, 2015, at 16:47 , Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
>>>=20
>>> On Tue, Jan 20, 2015 at 8:34 AM, Pantelis Antoniou
>>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>>> 90% of the usage of device node's full_name is printing it out
>>>> in a kernel message. Preparing for the eventual delayed allocation
>>>> introduce a custom printk format specifier that is both more
>>>> compact and more pleasant to the eye.
> []
>>>> diff --git a/Documentation/printk-formats.txt b/Documentation/prin=
tk-formats.txt
> []
>>>> +Device tree nodes:
>>>> +
>>>> +       %pO{,1,2}
>>>=20
>>> 'O' is not very obvious, but I imagine we are somewhat limted in ou=
r
>>> choice here?
>>>=20
>>=20
>> All the good women are married, all the handsome men are gay, all th=
e obvious
>> format specifiers are taken.
>=20
> Not really at all.
>=20
> I quite dislike '0' as the format type specifier for
> a device tree node as there's no mnemonic mapping.
>=20

There=92s only so many characters one can use; [DdNn] are taken. And it=
=92s O !=3D 0.

I am open to suggestions.

Regards

=97 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
