From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 4/4] iio: frequency: adf4371: Add support for output stage mute
Date: Wed, 26 Jun 2019 14:04:40 -0600
Message-ID: <CAL_JsqLmXi6Uy9W0tXX87tHuV99H05_+yc98mRUmX_JA0bG=4Q@mail.gmail.com>
References: <1561389236-26464-1-git-send-email-stefan.popa@analog.com> <20190626204820.513fb866@archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190626204820.513fb866@archlinux>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: Stefan Popa <stefan.popa@analog.com>, Mark Rutland <mark.rutland@arm.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Michael Hennerich <Michael.Hennerich@analog.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 26, 2019 at 1:48 PM Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Mon, 24 Jun 2019 18:13:56 +0300
> Stefan Popa <stefan.popa@analog.com> wrote:
>
> > Another feature of the ADF4371/ADF4372 is that the supply current to the
> > RF8P and RF8N output stage can shut down until the ADF4371 achieves lock
> > as measured by the digital lock detect circuitry. The mute to lock
> > detect bit (MUTE_LD) in REG25 enables this function.
> >
> > Signed-off-by: Stefan Popa <stefan.popa@analog.com>
> Bit of fuzz on this due to me ignoring patch 1 for now.
>
> Rob probably missed the binding as it was buried inside a patch that wasn't
> clearly labelled and it is unlike him to review part of the bindings in
> a series.

I wrote my reply this morning, but then got distracted with why the
meta-schema didn't catch the problem of missing a type definition. Now
it will once I commit it and fix the other cases that we already have.

Rob
