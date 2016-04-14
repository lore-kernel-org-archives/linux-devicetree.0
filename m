From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Question] refcount of DT node
Date: Thu, 14 Apr 2016 09:10:44 -0700
Message-ID: <570FC104.80808@gmail.com>
References: <CAK7LNATFUW2KXUpFas6C_SJ0C7Qb1DWU0njLg-FCYciK2U6Oag@mail.gmail.com> <20160414084849.GT19428@n2100.arm.linux.org.uk> <20160414095957.GB10273@leverpostej> <06E9E2D3-4627-4970-ABBB-34B5ED620709@konsulko.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <06E9E2D3-4627-4970-ABBB-34B5ED620709-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 4/14/2016 3:02 AM, Pantelis Antoniou wrote:
> Hi Mark,
>=20
>> On Apr 14, 2016, at 12:59 , Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrot=
e:
>>
>> On Thu, Apr 14, 2016 at 09:48:49AM +0100, Russell King - ARM Linux w=
rote:
>>> On Thu, Apr 14, 2016 at 04:47:57PM +0900, Masahiro Yamada wrote:
>>>> Hi experts.
>>>>
>>>> My understanding of refcount of DT node is poor.
>>>
>>> The message from DT people is... don't worry about DT node refcount=
ing.
>>> Do whatever you want with it, they don't care whether you have corr=
ect
>>> refcounting or not.
>>>
>>> The background behind that is that I've tried to fix the refcountin=
g,
>>> and even had the coccinelle people generate some stuff to work on t=
his
>>> issue, but DT people's attitude towards it is "don't bother".
>>>
>>> So yes, people may get it wrong, but it seems it's something that D=
T
>>> people want ignored.
>>
>> I'm not sure that's quite fair; the last discussion I recall about t=
his
>> ended up concluding that we need a better API, rather than papering =
over
>> problems.
>>
>> That said, there isn't much obvious progress on that front.
>>
>> Frank, Pantelis, Rob, were there any conclusions on this from ELC, o=
r is
>> this something that needs someone to propose something?
>>
>=20
> Frank mentioned that he wants a new API. I have some ideas about it t=
oo.
>=20
> My take is that drivers should never do reference counting, we have t=
o figure
> out a way for DT access using copy semantics or locks.
>=20
> References would still be required for core DT code, but that=E2=80=99=
s a sane subset.

Yes.  Nothing concrete about implementation was decided at ELC, but thi=
s issue
is on my todo list.

-Frank

>=20
>> Mark.
>>
>> [1] http://permalink.gmane.org/gmane.linux.drivers.devicetree/153777
>=20
> Regards
>=20
> =E2=80=94 Pantelis
>=20
> .
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
