From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 00/10] of_net: Add NVMEM support to of_get_mac_address
Date: Tue, 7 May 2019 10:57:36 -0500
Message-ID: <CAL_JsqL66PdCv7bFwfD9p6VQCcXOesz3EjPcYB9FGosgjOS8yw@mail.gmail.com>
References: <1556893635-18549-1-git-send-email-ynezz@true.cz> <20190505.214727.1839442238121977055.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190505.214727.1839442238121977055.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: =?UTF-8?Q?Petr_=C5=A0tetiar?= <ynezz@true.cz>, netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@bootlin.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, May 5, 2019 at 11:47 PM David Miller <davem@davemloft.net> wrote:
>
> From: Petr =C5=A0tetiar <ynezz@true.cz>
> Date: Fri,  3 May 2019 16:27:05 +0200
>
> > this patch series is a continuation of my previous attempt[1], where I'=
ve
> > tried to wire MTD layer into of_get_mac_address, so it would be possibl=
e to
> > load MAC addresses from various NVMEMs as EEPROMs etc.
>  ...
>
> Series applied, thank you.

Patch 1 at least is still be discussed. What was implemented based on
my comments on v2 is really broken. Now the allocated buffer is
tracked by both devm and DT refcounting. Whoever's ref count drops
first will free the buffer.

Rob
