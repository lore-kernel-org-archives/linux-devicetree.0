From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH v2] of: resolver: Add missing of_node_get and of_node_put
Date: Fri, 12 Feb 2016 09:58:03 +0200
Message-ID: <D5B54AEC-F0D6-4155-8633-27A7EFF13B3C@konsulko.com>
References: <20160203180901.GA27874@amitoj-Inspiron-3542> <CAL_JsqLSHrJWNJijv2Y1ZsXVa98PVBhg2kHn+t_eoH90GDLGAA@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLSHrJWNJijv2Y1ZsXVa98PVBhg2kHn+t_eoH90GDLGAA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Amitoj Kaur Chawla <amitoj1606@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> On Feb 12, 2016, at 01:18 , Rob Herring <robh+dt@kernel.org> wrote:
>=20
> On Wed, Feb 3, 2016 at 12:09 PM, Amitoj Kaur Chawla
> <amitoj1606@gmail.com> wrote:
>> In __of_find_node_by_full_name, add an of_node_get when detecting th=
e
>> desired element, to ensure that it ends up with a reference count th=
at is
>> one greater than on entering the function.
>>=20
>> Also in __of_find_node_by_full_name, add an of_node_put on breaking
>> out of the for_each_child_of_node loop, to ensure that the reference
>> count of the returned value is not double incremented. This change
>> was made using Coccinelle.
>=20
> Pantelis, are you convinced this is correct (albeit somewhat pointles=
s)?
>=20

This is good enough. It=E2=80=99s a local method and we won=E2=80=99t e=
ver try to use
it outside of the resolver. We need to fix the reference counting prope=
rly
sometime in the future.

> Rob

Regards

=E2=80=94 Pantelis
