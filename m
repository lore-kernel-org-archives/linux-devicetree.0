From: Robert Richter <rrichter@marvell.com>
Subject: Re: [PATCH v3 4/4] edac: Add support for Amazon's Annapurna Labs L2
 EDAC
Date: Tue, 3 Sep 2019 08:46:24 +0000
Message-ID: <20190903084614.mthff6hzbchkw7t2@rric.localdomain>
References: <1563197049-12679-1-git-send-email-hhhawa@amazon.com>
 <1563197049-12679-5-git-send-email-hhhawa@amazon.com>
 <20190903072655.kz5x7n3477dg4yap@rric.localdomain>
 <2bce020a-bf7e-1d54-48c3-0aa6d23c84d8@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2bce020a-bf7e-1d54-48c3-0aa6d23c84d8@amazon.com>
Content-Language: en-US
Content-ID: <0F1F622723E9814484DCF6155A64ADD3@namprd18.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Hawa, Hanna" <hhhawa@amazon.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "bp@alien8.de" <bp@alien8.de>, "mchehab@kernel.org" <mchehab@kernel.org>, "james.morse@arm.com" <james.morse@arm.com>, "davem@davemloft.net" <davem@davemloft.net>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>, "dwmw@amazon.co.uk" <dwmw@amazon.co.uk>, "benh@amazon.com" <benh@amazon.com>, "ronenk@amazon.com" <ronenk@amazon.com>, "talel@amazon.com" <talel@amazon.com>, "jonnyc@amazon.com" <jonnyc@amazon.com>, "hanochu@amazon.com" <hanochu@>
List-Id: devicetree@vger.kernel.org

On 03.09.19 11:28:41, Hawa, Hanna wrote:
> On 9/3/2019 10:27 AM, Robert Richter wrote:
> > On 15.07.19 16:24:09, Hanna Hawa wrote:
> > > Adds support for Amazon's Annapurna Labs L2 EDAC driver to detect and
> > > report L2 errors.
> > >=20
> > > Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
> > > ---
> > >   MAINTAINERS               |   6 ++
> > >   drivers/edac/Kconfig      |   8 ++
> > >   drivers/edac/Makefile     |   1 +
> > >   drivers/edac/al_l2_edac.c | 187 +++++++++++++++++++++++++++++++++++=
+++++++++++
> > >   4 files changed, 202 insertions(+)
> > >   create mode 100644 drivers/edac/al_l2_edac.c
> >=20
> >  From a brief look at it, it seems some of my comments from 2/4 apply
> > here too. Please look through it.
>=20
> Thanks for your review, will look and fix on top of v5.

I have later seen your newer versions posted which haven't made it
into my inbox. But looking at the changelog my comments are still
valid. Thanks for addressing them.

>From the changelog:

"Changes since v1:
-----------------
- Split into two drivers"

This is good, but recent practice is also to have all the drivers for
the same piece of hardware in a single file, see e.g. thunderx_edac.c.
I don't know how detailed this was discussed already, but I would
prefer to join the code.

-Robert
