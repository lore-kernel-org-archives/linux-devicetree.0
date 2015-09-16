From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 0/2] of: Dynamic DT updates
Date: Wed, 16 Sep 2015 22:09:04 +0300
Message-ID: <2A27041A-599E-4D43-955F-89D5D3D4944E@konsulko.com>
References: <1442419866-4982-1-git-send-email-pantelis.antoniou@konsulko.com> <CAL_JsqJORsJ8aA3DLuHAVovKX-wdx8m7_NCYA4kheumvyxScTg@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJORsJ8aA3DLuHAVovKX-wdx8m7_NCYA4kheumvyxScTg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> On Sep 16, 2015, at 19:43 , Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote=
:
>=20
> On Wed, Sep 16, 2015 at 11:11 AM, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> The two patches add a new API for using changeset which
>> makes things considerably easier.
>>=20
>> This patchset applies against Linus's tree as of today and
>> is dependent on the previous patchset I've send out earlier.
>> "of: overlay: kobject & sysfs'ation"
>=20
> Oh good, I'll ignore it until that is merged. ;) Seriously, this
> doesn't really look dependent. It doesn't involve ABIs either, so it
> is easier.
>=20

Oops. Sorry this dependency was for the patches that they were dropped.
This series is stand-alone.

> Rob
>=20
>>=20

Regards

=E2=80=94 Pantelis

>> Changes since v1:
>> * Dropped the indirect and target root patches until we
>> figure out what to do with the DT connector.
>>=20
>> Pantelis Antoniou (2):
>>  of: dynamic: Add __of_node_dupv()
>>  of: changesets: Introduce changeset helper methods
>>=20
>> drivers/of/dynamic.c | 280 +++++++++++++++++++++++++++++++++++++++++=
++++++++--
>> include/linux/of.h   |  74 ++++++++++++++
>> 2 files changed, 348 insertions(+), 6 deletions(-)
>>=20
>> --
>> 1.7.12
>>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
