From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PULL] DT fixes for 3.3
Date: Mon, 27 Feb 2012 14:06:46 -0700
Message-ID: <CACxGe6uzY4z22tS-Z7oNT7NTiwgXLxkzAi=zEydf2+8OhwZX7A@mail.gmail.com>
References: <4F4BE150.3000903@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4F4BE150.3000903@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 27, 2012 at 1:02 PM, Rob Herring <robherring2@gmail.com> wr=
ote:
> Grant,
>
> Please pull these few fixes and doc updates for 3.3.

Merged, thanks.

g.


>
> Rob
>
> The following changes since commit 6b21d18ed50c7d145220b0724ea7f2613a=
bf0f95:
>
> =A0Linux 3.3-rc5 (2012-02-25 12:18:16 -0800)
>
> are available in the git repository at:
> =A0git://sources.calxeda.com/kernel/linux.git fixes-for-grant
>
> Baruch Siach (1):
> =A0 =A0 =A0of/mdio: fix fixed link bus name
>
> Danny Kukawka (1):
> =A0 =A0 =A0of/fdt.c: asm/setup.h included twice
>
> Jamie Iles (1):
> =A0 =A0 =A0of: add picochip vendor prefix
>
> Tobias Klauser (1):
> =A0 =A0 =A0doc: dt: Fix broken reference in gpio-leds documentation
>
> =A0Documentation/devicetree/bindings/gpio/led.txt =A0 =A0 | =A0 =A06 =
+++---
> =A0.../devicetree/bindings/vendor-prefixes.txt =A0 =A0 =A0 =A0| =A0 =A0=
1 +
> =A0drivers/of/fdt.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 | =A0 =A01 -
> =A0drivers/of/of_mdio.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 | =A0 =A02 +-
> =A04 files changed, 5 insertions(+), 5 deletions(-)



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
