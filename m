From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 3/3] mtd: nand: add NAND driver for Broadcom STB NAND
 controller
Date: Mon, 9 Mar 2015 10:31:31 -0700
Message-ID: <20150309173131.GT18140@ld-irv-0074>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
 <1425691129-1150-4-git-send-email-computersforpeace@gmail.com>
 <CACna6rzL2=aUjvDw0ccRCBd1tu2QOavZf15CiZfZeimMDoWEGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACna6rzL2=aUjvDw0ccRCBd1tu2QOavZf15CiZfZeimMDoWEGw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kevin Cernekee <cernekee@gmail.com>, sbranden@broadcom.com
List-Id: devicetree@vger.kernel.org

On Sat, Mar 07, 2015 at 02:21:26PM +0100, Rafa=C5=82 Mi=C5=82ecki wrote=
:
> On 7 March 2015 at 02:18, Brian Norris <computersforpeace@gmail.com> =
wrote:
> > +       /* NAND register range */
> > +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       ctrl->nand_base =3D devm_ioremap_resource(dev, res);
> > +       if (!ctrl->nand_base)
> > +               return -ENODEV;
>=20
> This is what I got during my first test:
> brcmstb_nand 11315e0.nand: can't request region for resource [mem
> 0x011315e0-0x011325df]
> Unable to handle kernel paging request at virtual address fffffff0
> (not sure why yet).
>=20
> Hint: devm_ioremap_resource does never return NULL

Thanks, fixed in 3 places.

I expect you've figured out your problem here by now.

Brian
