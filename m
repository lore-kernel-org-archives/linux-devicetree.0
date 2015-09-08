From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v5 0/2] dtc: Dynamic DT support
Date: Tue, 8 Sep 2015 09:43:56 +0300
Message-ID: <B94B72BA-28A4-4FF6-A7B9-D11C2635E39F@konsulko.com>
References: <1440614674-7055-1-git-send-email-pantelis.antoniou@konsulko.com> <20150908040024.GC24774@voom.redhat.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150908040024.GC24774-1s0os16eZneny3qCrzbmXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi David,

> On Sep 8, 2015, at 07:00 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>=
 wrote:
>=20
> On Wed, Aug 26, 2015 at 09:44:32PM +0300, Pantelis Antoniou wrote:
>> Enable the generation of symbol & fixup information for
>> use with dynamic DT loading.
>>=20
>> Changes since v4:
>> * Rebase to latest dtc version.
>> * Completely redesigned the generation of resolution data.
>> Now instead of being generated as part of blob generation
>> they are created in the live tree.
>> * Consequently the patchset is much smaller.
>> * Added -A auto-label alias generation option.
>> * Addressed maintainer comments.
>> * Added syntactic sugar for overlays in the form of .dtsi
>> * Added /dts-v1/ /plugin/ preferred plugin form and deprecate
>> the previous form (although still works for backward compatibility)
>>=20
>> Changes since v3:
>> * Rebase to latest dtc version.
>>=20
>> Changes since v2:
>> * Split single patch to a patchset.
>> * Updated to dtc mainline.
>> * Changed __local_fixups__ format
>> * Clean up for better legibility.
>=20
> Sorry it's taken me so long to get to this.  I was sick after the
> conference, and then had backlog of day-job work to do.  I haven't ha=
d
> time to look at this yet, but I haven't forgotten it.
>=20

No worries.

Conference flu is a real killer.

Regards

=E2=80=94 Pantelis

> --=20
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _o=
ther_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson
