From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] of: Custom printk format specifier for device node
Date: Tue, 20 Jan 2015 11:13:12 -0600
Message-ID: <CAL_JsqKkFDDdzHKZrzhSNkBF3+ewq-Vbb_LCOh0shwd9a=COKA@mail.gmail.com>
References: <1421764441-11928-1-git-send-email-pantelis.antoniou@konsulko.com>
 <CAL_JsqLVJjq3Ov=J-5LtXiTQPLvR5Y=+tB1i16k_rN3j5dODFQ@mail.gmail.com>
 <CAMuHMdWnjawtgkKGuL8b4A17EhDS6B0L-1_uhSnvEXXk5dNjwQ@mail.gmail.com>
 <25E49021-E94D-4DFA-AC37-1D4A3AAE9F88@konsulko.com> <yw1x8ugxe8t9.fsf@unicorn.mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <yw1x8ugxe8t9.fsf@unicorn.mansr.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, Grant Likely <grant.likely@secretlab.ca>, Randy Dunlap <rdunlap@infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 20, 2015 at 10:05 AM, M=C3=A5ns Rullg=C3=A5rd <mans@mansr.c=
om> wrote:
> Pantelis Antoniou <pantelis.antoniou@konsulko.com> writes:
>
>> Hi Geert,
>>
>>> On Jan 20, 2015, at 17:24 , Geert Uytterhoeven <geert@linux-m68k.or=
g> wrote:
>>>
>>> On Tue, Jan 20, 2015 at 3:47 PM, Rob Herring <robherring2@gmail.com=
> wrote:
>>>>> +       Examples:
>>>>> +
>>>>> +       %pO     /foo/bar@0              - Node full name
>>>>> +       %pO0    /foo/bar@0              - Same as above
>>>>> +       %pO1    /foo/bar@0[10]          - Node full name + phandl=
e
>>>>> +       %pO2    /foo/bar@0[10:DdPB]     - Node full name + phandl=
e + node flags
>>>>> +                                        D - dynamic
>>>>> +                                        d - detached
>>>>> +                                        P - Populated
>>>>> +                                        B - Populated bus
>>>>
>>>> We should think about what else we want to print for a node. Perha=
ps
>>>> 'On' for name, 'Oc' for compatible, etc.
>>>
>>> I was just going to say "The least verbose variant is name, not ful=
l_name=E2=80=9D.
>>>
>>
>> Unfortunately in the context of device tree nodes =E2=80=98name' is =
usually
>> not what you want to print to identify the node in question. =E2=80=98=
name=E2=80=99 is
>> usually not unique.
>
> Name and address without the full path is usually a good compromise
> between uniqueness (it is usually unique for memory-mapped things) an=
d
> verbosity.

How much of the address is in the name depends on how the address
translation is done. I don't think we really need to do full address
translations here.

%pOn     /foo/bar@0              - Node full name
%pOn0   bar@0              - Node name and unit address
%pOn1    /foo/bar@0[10]          - Node full name + phandle
%pOn2    /foo/bar@0[10:DdPB]     - Node full name + phandle + node flag=
s
%pOc      vendor,foo-bar          - Most significant compatible string

We could do phandle and/or node flags as separate specifiers such as
%pOf for flags.

I'm not proposing implementing all these now, but just want to make
sure we have a structure to do so later.

Rob
