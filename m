From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] gpio: Add Cadence GPIO driver
Date: Fri, 21 Dec 2018 11:37:04 +0100
Message-ID: <CACRpkdZJoPKacABqSbxKOZnt7vUar_1_H7q7Brxxo6e2oBnfRw@mail.gmail.com>
References: <20181217153652.20056-1-jank@cadence.com> <20181217153652.20056-3-jank@cadence.com>
 <CAMpxmJXrjyK3m4JwgkxwkHjSj-ugb7UzwNrYcBwYjWwj+JBNxw@mail.gmail.com>
 <CACRpkdYq5Eg2DrwdED-yTZ4kMoCxew+0rdU-b4zuinOf7BEr6Q@mail.gmail.com>
 <CAMpxmJUnfnHmopyOfHRZrN1KoqZx_Bsra1BTiGud6UVmzz1ryA@mail.gmail.com>
 <220ECBA7-CD30-4221-8878-0DA93390DDCC@global.cadence.com> <CAMpxmJX5ScpYCL0DhM99U=sbhU4VOxaA+gPzBJ698gs0-UFMxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMpxmJX5ScpYCL0DhM99U=sbhU4VOxaA+gPzBJ698gs0-UFMxQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Janek Kotas <jank@cadence.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio <linux-gpio@vger.kernel.org>, linux-devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 18, 2018 at 3:06 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> wt., 18 gru 2018 o 14:54 Janek Kotas <jank@cadence.com> napisa=C5=82(a):

> > I can reimplement the driver using regmap, but It seems in such case
> > I won=E2=80=99t be able to use the Generic GPIO Infrastructure, would I=
?
> > So I would need to provide functions for setting direction, etc.
> > I think it would make the driver code bigger.
>
> Indeed. If anything: gpio-mmio would need to be converted to using regmap=
.

Ouch, let's go with this for now.

I think for gpio-mmio we have two new cases we really need to cover:
- port-mapped I/O (x86)
- regmap I/O

Augmenting gpio-mmio for these could probably strip out quite a
bunch of code from several drivers.

Yours,
Linus Walleij
