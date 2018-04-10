Return-Path: <SRS0=MwFQ=G7=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.170]:17233 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751471AbeDJQGv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Apr 2018 12:06:51 -0400
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH v2 3/5] [RFC] gpio: pca953x: hack to map LEVEL irqs to EDGE irqs (may loose interrupts/hang)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAHp75VctneZKFrRr5bgq6w1L9JkDzbKW421aDLQU2jf9vZgmFA@mail.gmail.com>
Date: Tue, 10 Apr 2018 18:06:41 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <D32076BD-A605-4D62-AC22-33711CE0EB39@goldelico.com>
References: <cover.1522868422.git.hns@goldelico.com> <637f00dd7da98cfeffdc6080914a5f67b433da50.1522868423.git.hns@goldelico.com> <CAHp75VctneZKFrRr5bgq6w1L9JkDzbKW421aDLQU2jf9vZgmFA@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, devicetree <devicetree@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com
List-ID: <devicetree@vger.kernel.org>

Hi Andy,

> Am 10.04.2018 um 16:38 schrieb Andy Shevchenko =
<andy.shevchenko@gmail.com>:
>=20
> On Wed, Apr 4, 2018 at 10:00 PM, H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>=20
>> in driver code. Therefore, the pca953x driver rejects the
>> setup of the irq because it can only handle EDGE interrupts
>> so far.
>>=20
>> This hack translates level interrupts to edge interrupts
>> for the pca953x chips. This is enough for initial testing,
>> but not a good solution since interrupts may be lost.
>>=20
>> If for example the connected chip requests a IRQ_TYPE_LEVEL_LOW
>> this may have the reason that there may be multiple different
>> interrupt sources in the chip - wired-or together to the
>> input of the pca953x. Now if we do edge detecion only,
>> the first interrupt will generate an EDGE_FALLING, but a
>> second one won't ever if the first interrupt wasn't already
>> processed.
>>=20
>> IMHO a better solution would be to make the pca953x interrupt
>> handler check if the irq input is still in the active
>> level and run the device specific handler again.
>=20
> What I thought about is to enable such exclusively for "L" variants of
> the chips and check latched values.

Yes, something like this, although we have to think about if the same =
can't
be done for other chips.

The question is who will pick up this topic and when. My job for this =
chip
was to check if it can basically work and the hack shows that, but =
others
must make the driver perfect.

So for the moment I keep it in our workplace and remove it from the
patch set.

I am sure that there will be some more kernel developers as soon
as the Pyra handheld hardware is more widely available.

BR,
Nikolaus

