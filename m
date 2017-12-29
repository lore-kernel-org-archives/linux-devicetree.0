From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 06/15] clk: Add Ingenic jz4770 CGU driver
Date: Fri, 29 Dec 2017 16:02:24 +0100
Message-ID: <1514559744.2198.1@smtp.crapouillou.net>
References: <20170702163016.6714-2-paul@crapouillou.net>
        <20171228135634.30000-1-paul@crapouillou.net>
        <20171228135634.30000-7-paul@crapouillou.net>
        <CAOFm3uEbEx+HTsOANchqiReuDBa96O0Y-V-igLGWPF-OxQ2jtw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <CAOFm3uEbEx+HTsOANchqiReuDBa96O0Y-V-igLGWPF-OxQ2jtw@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Philippe Ombredanne <pombredanne@nexb.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, Maarten ter Huurne <maarten@treewalker.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org


Dear Mr. Ombredanne,

Le ven. 29 d=E9c. 2017 =E0 13:55, Philippe Ombredanne=20
<pombredanne@nexb.com> a =E9crit :
> Dear Mr Crapouillou-Cercueil-Sir,
>=20
> On Thu, Dec 28, 2017 at 2:56 PM, Paul Cercueil <paul@crapouillou.net>=20
> wrote:
>>  Add support for the clocks provided by the CGU in the Ingenic JZ4770
>>  SoC.
>=20
> <snip>
>=20
>>  --- /dev/null
>>  +++ b/drivers/clk/ingenic/jz4770-cgu.c
>>  @@ -0,0 +1,487 @@
>>  +/*
>>  + * JZ4770 SoC CGU driver
>>  + *
>>  + * Copyright 2017, Paul Cercueil <paul@crapouillou.net>
>>  + *
>>  + * This program is free software; you can redistribute it and/or=20
>> modify
>>  + * it under the terms of the GNU General Public License version 2=20
>> or later
>>  + * as published by the Free Software Foundation.
>>  + */
>=20
> Do you mind using a simpler one-line SPDX identifier instead of this
> fine but clearly crapouillish legalese boilerplate? Unless you are
> trying to turn the kernel in a legal compendium, of course ;)
>=20
> This is documented in Thomas doc patches. This would apply to your
> entire patch set.
> Thank you for your kind consideration!

Sure, I wasn't aware about that new SPDX identifier thing. I'll do it=20
in V5.

Regards,
-Paul
=

