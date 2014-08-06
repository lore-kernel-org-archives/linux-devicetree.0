From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mtd: nand: stm_nand_bch: add new driver
Date: Wed, 6 Aug 2014 11:44:40 +0100
Message-ID: <20140806104440.GC10136@lee--X1>
References: <1401268805-26043-1-git-send-email-lee.jones@linaro.org>
 <20140703002237.GM3599@ld-irv-0074>
 <20140731164709.GK9030@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140731164709.GK9030@lee--X1>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, "Gupta, Pekon\"" <pekon@ti.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Boris BREZILLON <b.brezillon.dev@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, 31 Jul 2014, Lee Jones wrote:
> On Wed, 02 Jul 2014, Brian Norris wrote:
> > On Wed, May 28, 2014 at 10:20:05AM +0100, Lee Jones wrote:

[...]

> > > +	if (IS_ERR(pdata))
> > > +		return PTR_ERR(pdata);
> > > +
> > > +	ppdata.of_node =3D stm_of_get_partitions_node(np, 0);
> >=20
> > So you only support a single bank, at chip-select 0? Is this a
> > hardware limitation, or simply software? You might consider whether=
 this
> > needs to be noted in the DT binding too -- it currently suggests th=
at
> > this can be plural.
>=20
> Yes, only one bank.  Chip select is not possible.

Sorry, not only one bank.

We can have multiple banks, but only one chip.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
