Return-Path: <SRS0=h8Uo=HW=goldelico.com=hns@kernel.org>
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 4/7] dt-bindings: gnss: add u-blox binding
From: H. Nikolaus Schaller <hns@goldelico.com>
In-Reply-To: <20180502081637.GE2285@localhost>
Date: Thu, 3 May 2018 11:35:21 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <5242FCAD-3139-4A9C-B9FA-7BBAA0E6AE57@goldelico.com>
References: <20180424163458.11947-1-johan@kernel.org> <20180424163458.11947-5-johan@kernel.org> <CAL_Jsq+mCp=geT8t_j+0fuTxAB7C9RYn6pESRpLc2GH273fM1Q@mail.gmail.com> <20180426091018.GU4615@localhost> <CAL_JsqK=xQBx2YCd0kDP0zLn_LAZb6Mi5UfSTQf2soooVz2unQ@mail.gmail.com> <20180502081637.GE2285@localhost>
To: Johan Hovold <johan@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, Pavel Machek <pavel@ucw.cz>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>


> Am 02.05.2018 um 10:16 schrieb Johan Hovold <johan@kernel.org>:
>=20
> On Tue, May 01, 2018 at 09:05:42AM -0500, Rob Herring wrote:
>> On Thu, Apr 26, 2018 at 4:10 AM, Johan Hovold <johan@kernel.org> =
wrote:
>>=20
>> Though with the enable-gpios I was debating the name for sirfstar a
>> bit because it isn't the normal drive it active to enable, but rather
>> a pulse to enable or disable.
>=20
> I had some concerns along those lines as well, and if you agree I'll
> change the property name to on_off-gpios (or onoff-gpios) which =
matches
> the vendor data sheets for this pin, and which I think would be =
better.

In our original submission of our w2sg bindings we also did call that
"on-off-gpios", but Rob suggested to use the standard way of =
"enable-gpios":

https://patchwork.kernel.org/patch/9738981/

We changed this and got his acked-by for our w2sg bindings:

https://patchwork.kernel.org/patch/10054911/

We also have found an agreed wording for the description:

- enable-gpios:  the GPIO that controls the module's power toggle
         input. A positive impulse of sufficent length toggles the
         power state.

But what should I expect from someone who constantly ignores, rejects
and belittles previous work of others and prefers to reinvent almost
the same thing and claims that it is 100% original work?

I am so heavily upset this time because we had been asked by reviewers =
if
it was not Neil Brown who laid the foundation and yes, we of course =
looked
how to formulate proper attribution:

https://patchwork.kernel.org/patch/10059705/

I stand to my view that this is a good example how to ruin the =
willingness
of volunteers to send submissions for review, since the paycheck a =
volunteer
receives uses the currency of being welcome, recognition and visibility =
in
the final git log.

And I had expected that reviewers from kernel.org are more =
generous/liberal
with code flaws (finding them is IMHO the sole purpose of the review =
process)
and don't expect that everyone has the same background.

Anyways, let's forget this type of discussion and come back to a =
technical
level:

I have realized that the w2sg0004 is an exception (although a Sirf chip)
that it does not provide a WAKEUP signal. And another significant
difference is that we have to keep the serdev UART enabled even if there
is no user-space client. Otherwise we are not able to detect unexpected
activity. So we unfortunately can't move serdev open/close into the =
.open
and .close ops but need to open it in probe.

Therefore, it is in my opinion still better to have a separate driver =
for
the w2sg0004 instead of hacking the support of this chip into your =
WAKEUP
capable sirfstar driver. So I suggest that you make WAKEUP a required
property.

We had faced a comparable decision last year with the ov9650 and ov9655 =
camera
sensors which are almost the same. But not same enough to integrate both =
into
a single driver.

So (despite my grown doubts about the review process), I'll now submit a =
v7
of our w2sg0004 driver, adjusted to your gnss framework API and tested =
on
GTA04 hardware. It is only covering the w2sg0004 module and not even =
claiming
to handle the w2sg0084(i) to avoid overlap with your work.

BR,
Nikolaus
