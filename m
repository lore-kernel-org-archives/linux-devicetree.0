From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: [PATCH] of: Custom printk format specifier for device node
Date: Tue, 20 Jan 2015 16:05:54 +0000
Message-ID: <yw1x8ugxe8t9.fsf@unicorn.mansr.com>
References: <1421764441-11928-1-git-send-email-pantelis.antoniou@konsulko.com>
	<CAL_JsqLVJjq3Ov=J-5LtXiTQPLvR5Y=+tB1i16k_rN3j5dODFQ@mail.gmail.com>
	<CAMuHMdWnjawtgkKGuL8b4A17EhDS6B0L-1_uhSnvEXXk5dNjwQ@mail.gmail.com>
	<25E49021-E94D-4DFA-AC37-1D4A3AAE9F88@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <25E49021-E94D-4DFA-AC37-1D4A3AAE9F88@konsulko.com> (Pantelis
	Antoniou's message of "Tue, 20 Jan 2015 17:27:42 +0200")
Sender: linux-doc-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robherring2@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Grant Likely <grant.likely@secretlab.ca>, Randy Dunlap <rdunlap@infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Pantelis Antoniou <pantelis.antoniou@konsulko.com> writes:

> Hi Geert,
>
>> On Jan 20, 2015, at 17:24 , Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
>>=20
>> On Tue, Jan 20, 2015 at 3:47 PM, Rob Herring <robherring2@gmail.com>=
 wrote:
>>>> +       Examples:
>>>> +
>>>> +       %pO     /foo/bar@0              - Node full name
>>>> +       %pO0    /foo/bar@0              - Same as above
>>>> +       %pO1    /foo/bar@0[10]          - Node full name + phandle
>>>> +       %pO2    /foo/bar@0[10:DdPB]     - Node full name + phandle=
 + node flags
>>>> +                                        D - dynamic
>>>> +                                        d - detached
>>>> +                                        P - Populated
>>>> +                                        B - Populated bus
>>>=20
>>> We should think about what else we want to print for a node. Perhap=
s
>>> 'On' for name, 'Oc' for compatible, etc.
>>=20
>> I was just going to say "The least verbose variant is name, not full=
_name=E2=80=9D.
>>=20
>
> Unfortunately in the context of device tree nodes =E2=80=98name' is u=
sually
> not what you want to print to identify the node in question. =E2=80=98=
name=E2=80=99 is
> usually not unique.

Name and address without the full path is usually a good compromise
between uniqueness (it is usually unique for memory-mapped things) and
verbosity.

--=20
M=C3=A5ns Rullg=C3=A5rd
mans@mansr.com
