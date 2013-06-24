From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] GPIO: Add support for dual channel in gpio-xilinx.c
Date: Mon, 24 Jun 2013 12:01:05 +0200
Message-ID: <CACRpkdbeBrcD4G4Sqcvtro4+46B1A_1pybXX6YHJsy2UPoNy5Q@mail.gmail.com>
References: <4b90b06fce0475b579cfba4d968b4778359154f6.1369826814.git.michal.simek@xilinx.com>
	<CACRpkdY4xaCOe28nu-NrYQ7pafjhj8-xqFcJRF9iJUy3SrCVrA@mail.gmail.com>
	<51A8387C.4030704@monstr.eu>
	<CACRpkdbHiaK6YPgXyxNgEeZxAsddK4x0vS-q3YfyXnj_BgHvuw@mail.gmail.com>
	<51A852A1.7020505@monstr.eu>
	<CACRpkdbL4pqiF8zxMi28SRTJ9AESiFt0wJMhK1oBio_cfFhpsQ@mail.gmail.com>
	<51C2B47A.6010906@monstr.eu>
	<CACRpkdbWXFLgcUJ-gcUArRotJMoX4JBU9mmheooJBWsLR=QHOA@mail.gmail.com>
	<51C2E0AF.7040702@monstr.eu>
	<CACRpkdbcq+e099mT+TVwv9vDjXwkf8QdB_4b4UXuysPF+40oUQ@mail.gmail.com>
	<51C2F1A7.3030805@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51C2F1A7.3030805@monstr.eu>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <monstr@monstr.eu>, Arnd Bergmann <arnd@arndb.de>
Cc: Michal Simek <michal.simek@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 20, 2013 at 2:12 PM, Michal Simek <monstr@monstr.eu> wrote:

> xlnx,is-dual is always present in the HW and in all DTSes and it
> is generated for several years
>
> Based on my experience with hardware guys what happen when they add
> new channel is that they will use xlnx,is-dual = 2 for 3 channels,
> xlnx,is-dual = 3 for 4 channels, etc. They won't care about names
> but they are working like that.
>
> It means for me is really problematic it try to work with this
> value as boolean even that name is confusing.

OK I will have to live with this.

The problem with reviewing DT bindings is that for me as a
subsystem maintainer I'm interacting with a quite complex
universe:

1. Bindings from people like the MIPS camp where some people
  obviously sat down in a committee meeting and tried to define
  a binding in advance, which is then deployed and we have to
  support. Sometimes a real nice piece of work such as the
  PCI hose mappings.

2. Bindings that we need to evolve as part of this community
  review process, where the judgement of a mapping's
  applicability and sanity is very much up to the subsystem
  maintainer. (This is the vast class of bindings.)

3. Bindings that John Doe from Idaho came up with in his
  basement and then deployed to the entire world, so that
  we cannot review or amend it but just have to support as
  they are because they are already live in numerous
  systems.

This would be a case of (3) whereas I'm mostly used to
a binding discussion of type (2) and that is why this gets
so locked up.

> That's why it is much easier for me to start to use new property
> which will describe number of channels but this value is not
> used in design tools. Let's say number-of-channels = 1 or 2
> in DT binding which will describe number channels in this IP.
> Is this acceptable for you?

This is much nicer and readable.

Yours,
Linus Walleij
