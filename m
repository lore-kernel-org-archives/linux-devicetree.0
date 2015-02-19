From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH 2/4] of: DT quirks infrastructure
Date: Thu, 19 Feb 2015 16:41:44 +0200
Message-ID: <23825C6A-7FF1-4D06-8802-F6964F71B97C@konsulko.com>
References: <1424271576-1952-1-git-send-email-pantelis.antoniou@konsulko.com> <1424271576-1952-3-git-send-email-pantelis.antoniou@konsulko.com> <54E54586.5070602@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54E54586.5070602@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: frowand.list@gmail.com
Cc: Grant Likely <grant.likely@secretlab.ca>, devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Koen Kooi <koen@dominion.thruhere.net>, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, Ludovic Desroches <ludovic.desroches@atmel.com>, linux-arm-kernel@lists.infradead.org, Matt Porter <matt.porter@linaro.org>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

Hi Frank,

> On Feb 19, 2015, at 04:08 , Frank Rowand <frowand.list@gmail.com> wro=
te:
>=20
> On 2/18/2015 6:59 AM, Pantelis Antoniou wrote:
>> Implement a method of applying DT quirks early in the boot sequence.
>>=20
>> A DT quirk is a subtree of the boot DT that can be applied to
>> a target in the base DT resulting in a modification of the live
>> tree. The format of the quirk nodes is that of a device tree overlay=
=2E
>=20
> The use of the word "quirk" is a different mental model for me than w=
hat
> this patch series appears to be addressing.  I would suggest totally
> removing the word "quirk" from this proposal to avoid confusing the
> mental models of future generations of kernel folks.
>=20

Naming things is hard to do. Suggestions?

> What this patch series seems to be proposing is a method to apply DT
> overlays as soon as unflatten_device_tree() completes.  In other word=
s,
> making the device tree a dynamic object, that is partially defined by
> the kernel during boot.  Well, to be fair, the kernel chooses among
> several possible alternatives encoded in the DT blob.  So the device
> tree is no longer a static object that describes the hardware of the
> system.  It may not sound like a big deal, but it seems to me to be
> a fundamental shift in what the device tree blob is.  Something that
> should be thought about carefully and not just applied as a patch to
> solve a point problem.
>=20

There is a fundamental shift going on about what hardware is. It is now=
here
as static as it used to be. It is time for the kernel to keep up.

> The stated use of this proposal is to create dynamic DT blobs that ca=
n
> describe many similar variants of a given system instead of creating
> unique DT blobs for each different system.
>=20

Yes.

> I obviously have not thought through the architectural implications y=
et,
> but just a quick example.  One of the issues we have been trying to f=
ix
> is device tree validation.  The not yet existent (except as a few pro=
of
> of concept attempts) validator would need to validate a device tree
> for each dynamic variant.  Probably not a big deal, but an example of
> the ripple effects this conceptual change implies.
>=20

I don=92t see what the big problem with the validator is. The =91quirk=92
are easily identified by the presence of the __overlay__ nodes and
the validator can apply each overlay and perform the validation check=20
at each resultant tree.
=20
> A second function that this patch is proposing is a method to enable
> or disable devices via command line options.  If I understand
> correctly, this is meant to solve a problem with run time overlays
> that require disabling a device previously enabled by the DT blob.
> If so, it seems like it could easily be implemented in a simpler
> generic way than in the board specific code in this patch series.
>=20

Disabling a device is the most common case, but other options are desir=
ed
too. For instance changing OPPs by a command line option, etc.

> I share the concerns that Mark Rutland has expressed in his comments
> about this series.
>=20
> < snip >
>=20
> I have read through the patches and will have comments on the code
> later if this proposal is seen as a good idea.
>=20

OK

> -Frank

Regards

=97 Pantelis
