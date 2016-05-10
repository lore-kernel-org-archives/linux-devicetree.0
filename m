From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 2/3] of: Support hashtable lookups for phandles
Date: Tue, 10 May 2016 09:26:11 -0500
Message-ID: <CAL_JsqKc3Jgqz=gkhZjp2uH8X8jbKHz7B21QK_MCBgMD3+37cQ@mail.gmail.com>
References: <1462817488-8370-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1462817488-8370-3-git-send-email-pantelis.antoniou@konsulko.com>
 <CAMuHMdXBnxTaKB4io4j4jbbUh+QU0b_Fj8zYi_K_7NZSE33YpQ@mail.gmail.com>
 <CAL_JsqLsztrWr8mQwCHzA+qkrRev0Kfr--BkMiPVRVycZp0A=Q@mail.gmail.com> <B0B8EAD0-838D-43BF-9B54-B8F7E30FF226@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <B0B8EAD0-838D-43BF-9B54-B8F7E30FF226@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Frank Rowand <frowand.list@gmail.com>, Matt Porter <mporter@konsulko.com>, Grant Likely <grant.likely@secretlab.ca>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, Marek Vasut <marex@denx.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 10, 2016 at 8:45 AM, Pantelis Antoniou
<pantelis.antoniou@konsulko.com> wrote:
> Hi Rob,
>
>> On May 10, 2016, at 00:11 , Rob Herring <robherring2@gmail.com> wrot=
e:
>>
>> On Mon, May 9, 2016 at 3:38 PM, Geert Uytterhoeven <geert@linux-m68k=
=2Eorg> wrote:
>>> Hi Pantelis,
>>>
>>> On Mon, May 9, 2016 at 8:11 PM, Pantelis Antoniou
>>> <pantelis.antoniou@konsulko.com> wrote:
>>>> --- a/drivers/of/base.c
>>>> +++ b/drivers/of/base.c
>>>
>>>> @@ -1073,9 +1097,14 @@ struct device_node *of_find_node_by_phandle=
(phandle handle)
>>>>                return NULL;
>>>>
>>>>        raw_spin_lock_irqsave(&devtree_lock, flags);
>>>> -       for_each_of_allnodes(np)
>>>> -               if (np->phandle =3D=3D handle)
>>>> -                       break;
>>>> +       /* when we're ready use the hash table */
>>>> +       if (of_phandle_ht_available() && !in_interrupt())
>>>
>>> I guess the !in_interrupt() test is because of the locking inside
>>> rhashtable_lookup_fast()?
>>
>> Not a use we should support. Just warn for anyone parsing DT in
>> interrupt context.
>>
>
> That=E2=80=99s not about users calling in interrupt context. It=E2=80=
=99s when we=E2=80=99re
> very early in the boot sequence we=E2=80=99re under interrupt context=
 and
> calls to the hash methods cannot be made.

I don't understand. When exactly are we in interrupt context?

Rob
