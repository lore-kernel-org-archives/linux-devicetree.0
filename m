From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] of: Custom printk format specifier for device node
Date: Tue, 20 Jan 2015 10:16:59 -0800
Message-ID: <1421777819.2724.5.camel@perches.com>
References: <1421764441-11928-1-git-send-email-pantelis.antoniou@konsulko.com>
	 <CAL_JsqLVJjq3Ov=J-5LtXiTQPLvR5Y=+tB1i16k_rN3j5dODFQ@mail.gmail.com>
	 <E7065DB3-DD6B-4110-A066-8C7268186831@konsulko.com>
	 <1421776794.2724.1.camel@perches.com>
	 <B282C7F7-D221-4D7D-AB33-533C0204C4CF@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <B282C7F7-D221-4D7D-AB33-533C0204C4CF@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Rob Herring <robherring2@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Grant Likely <grant.likely@secretlab.ca>, Randy Dunlap <rdunlap@infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2015-01-20 at 20:06 +0200, Pantelis Antoniou wrote:
> On Jan 20, 2015, at 19:59 , Joe Perches <joe@perches.com> wrote:
> > On Tue, 2015-01-20 at 16:52 +0200, Pantelis Antoniou wrote:
> >>> On Jan 20, 2015, at 16:47 , Rob Herring <robherring2@gmail.com> w=
rote:
> >>> On Tue, Jan 20, 2015 at 8:34 AM, Pantelis Antoniou
> >>> <pantelis.antoniou@konsulko.com> wrote:
> >>>> 90% of the usage of device node's full_name is printing it out
> >>>> in a kernel message. Preparing for the eventual delayed allocati=
on
> >>>> introduce a custom printk format specifier that is both more
> >>>> compact and more pleasant to the eye.
> > []
> >>>> diff --git a/Documentation/printk-formats.txt b/Documentation/pr=
intk-formats.txt
> > []
> >>>> +Device tree nodes:
> >>>> +
> >>>> +       %pO{,1,2}
> >>>=20
> >>> 'O' is not very obvious, but I imagine we are somewhat limted in =
our
> >>> choice here?
> >>>=20
> >>=20
> >> All the good women are married, all the handsome men are gay, all =
the obvious
> >> format specifiers are taken.
> >=20
> > Not really at all.
> >=20
> > I quite dislike '0' as the format type specifier for
> > a device tree node as there's no mnemonic mapping.
> >=20
> There=E2=80=99s only so many characters one can use; [DdNn] are taken=
=2E And it=E2=80=99s O !=3D 0.

The '[Dd]' entry type doesn't just have to be used for dentries.
It could also be used for Device Tree Nodes via 'DTN[x]'

'T' for tree could also be used.
