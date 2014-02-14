From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 2/2] of: search the best compatible match first in __of_match_node()
Date: Fri, 14 Feb 2014 10:23:42 -0600
Message-ID: <A27612FE-F84F-460D-B573-F891B75A70F2@kernel.crashing.org>
References: <1392355366-1445-1-git-send-email-haokexin@gmail.com> <1392355366-1445-3-git-send-email-haokexin@gmail.com> <CAL_JsqKq4_1K8EF+PZoP=0=H6tiRxbgdzs9UHHVdbHS014n74Q@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKq4_1K8EF+PZoP=0=H6tiRxbgdzs9UHHVdbHS014n74Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen N Chivers <schivers-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Feb 14, 2014, at 9:53 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On Thu, Feb 13, 2014 at 11:22 PM, Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
>> Currently, of_match_node compares each given match against all node'=
s
>> compatible strings with of_device_is_compatible.
>>=20
>> To achieve multiple compatible strings per node with ordering from
>> specific to generic, this requires given matches to be ordered from
>> specific to generic. For most of the drivers this is not true and al=
so
>> an alphabetical ordering is more sane there.
>>=20
>> Therefore, this patch introduces a function to match each of the nod=
e's
>> compatible strings against all given compatible matches without type=
 and
>> name first, before checking the next compatible string. This implies
>> that node's compatibles are ordered from specific to generic while
>> given matches can be in any order. If we fail to find such a match
>> entry, then fall-back to the old method in order to keep compatibili=
ty.
>>=20
>> Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Signed-off-by: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> Looks good to me. I'll put this in next for a few days. I'd really
> like to see some acks and tested-by's before sending to Linus.
>=20
> We could be a bit more strict here and fallback to the old matching i=
f
> the match table has any entries with name or type. I don't think that
> should be necessary though.
>=20
> Rob
>=20


Can you push the revert to Linus sooner, since currently a ton of board=
s wouldn=92t be working on the PPC side, so at least -rc3 has the possi=
bility of working for them.

- k
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
