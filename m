From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [RFC PATCH 02/13] of: Remove excessive printks to reduce clutter
Date: Thu, 27 Oct 2016 16:51:01 +0300
Message-ID: <022037BA-60BC-4A85-B51A-04F96E854952@konsulko.com>
References: <1477429146-27039-1-git-send-email-frowand.list@gmail.com> <1477429146-27039-3-git-send-email-frowand.list@gmail.com> <CAL_Jsq+TWZw+VcbYZp_xmFR-yitY8bn+gqe1Q2N42UFZAYsZKg@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+TWZw+VcbYZp_xmFR-yitY8bn+gqe1Q2N42UFZAYsZKg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob, Frank,

> On Oct 27, 2016, at 15:21 , Rob Herring <robh+dt@kernel.org> wrote:
>=20
> On Tue, Oct 25, 2016 at 3:58 PM,  <frowand.list@gmail.com> wrote:
>> From: Frank Rowand <frank.rowand@am.sony.com>
>=20
> Maybe some should be debug?
>=20

Yes, please do not get rid of them completely.
Leave them at least as debug level so that if there=E2=80=99s a problem
there=E2=80=99s a way to figure out why something happened.

>> Signed-off-by: Frank Rowand <frank.rowand@am.sony.com>
>> ---
>> drivers/of/resolver.c | 28 ----------------------------
>> 1 file changed, 28 deletions(-)
>>=20
>> diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
>> index 4ff0220d7aa2..93a7ca0bf98c 100644
>> --- a/drivers/of/resolver.c
>> +++ b/drivers/of/resolver.c
>> @@ -116,8 +116,6 @@ static int __of_adjust_phandle_ref(struct =
device_node *node,
>>=20
>>        propval =3D kmalloc(rprop->length, GFP_KERNEL);
>>        if (!propval) {
>> -               pr_err("%s: Could not copy value of '%s'\n",
>> -                               __func__, rprop->name);
>>                return -ENOMEM;
>>        }
>=20
> I would remove the brackets in this patch rather than separately.
>=20
>>        memcpy(propval, rprop->value, rprop->length);


Regards

=E2=80=94 Pantelis
