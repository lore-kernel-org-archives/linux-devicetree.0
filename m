From: Michael van der Westhuizen <michael@smart-africa.com>
Subject: Re: [PATCH 1/2] gpio: dwapb: Use human understandable gpio numbering.
Date: Thu, 16 Jul 2015 10:16:46 +0200
Message-ID: <60651945-976B-42B3-AD64-769AB10990C2@smart-africa.com>
References: <cover.1435777856.git.rcochran@linutronix.de> <d6b5ce85a17164970d454583560e07f7aed7b8ca.1435777856.git.rcochran@linutronix.de> <267A46E7-C5C5-4696-90CC-D44F4130B3EF@smart-africa.com> <CACRpkdavWungUrU02dxObW1BUK5uELFHgDQMXmQwqdzzem2zuA@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdavWungUrU02dxObW1BUK5uELFHgDQMXmQwqdzzem2zuA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Richard Cochran <richardcochran@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alan Tull <atull@altera.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Dinh Nguyen <dinguyen@altera.com>
List-Id: devicetree@vger.kernel.org


> On 16 Jul 2015, at 9:52 AM, Linus Walleij <linus.walleij@linaro.org> =
wrote:
>=20
> On Thu, Jul 2, 2015 at 9:05 AM, Michael van der Westhuizen
> <michael@smart-africa.com> wrote:
>=20
>> In my case, I have quite a lot of vendor-supplied code that needs th=
e numbers to
>> be stable and backward compatible.  This quickly devolves into a dis=
cussion of
>> GPIOs in sysfs as an ABI, which is not a discussion I want to have :=
)
>=20
> That is impossible to avoid.
>=20
> What you're saying is you just want to drill a hole in the boat and n=
ot
> have a discussion whether the boat is going to float after this or
> not.

Not at all.  I was just noting that this patch will touch on this topic=
, and it=E2=80=99s not a
topic that I would weigh in on as my opinions are irrelevant in this di=
scussion.

No incendiary topic intended :-)

Michael

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
