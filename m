From: Frank Lee <tiny.windzz@gmail.com>
Subject: Re: [PATCH v3 1/3] thermal: sun8i: add thermal driver for h6
Date: Tue, 11 Jun 2019 08:31:25 +0800
Message-ID: <CAEExFWtjNridLsMXOnBe2mJOPhUOYJ6G3wGF3gx=0oQoQROOGg@mail.gmail.com>
References: <20190525181329.18657-1-tiny.windzz@gmail.com> <20190525181329.18657-2-tiny.windzz@gmail.com>
 <CA+E=qVdh1E8Y7dZO0JSS4DJE2bo=98MuSKRt7nmeFg-td7Ua9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+E=qVdh1E8Y7dZO0JSS4DJE2bo=98MuSKRt7nmeFg-td7Ua9Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: rui.zhang@intel.com, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, paulmck@linux.ibm.com, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, arm-linux <linux-arm-kernel@lists.infradead.org>, Linux PM <linux-pm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 11, 2019 at 7:29 AM Vasily Khoruzhick <anarsoul@gmail.com> wrot=
e:
>
> On Sat, May 25, 2019 at 11:17 AM Yangtao Li <tiny.windzz@gmail.com> wrote=
:
> >
> > This patch adds the support for allwinner thermal sensor, within
> > allwinner SoC. It will register sensors for thermal framework
> > and use device tree to bind cooling device.
>
> Hi Yangtao,
>
> Any plans on v4 of this series?
>

I am waiting for comment from Maxime.

I=E2=80=99ll support both h3 and h6 in v4.

Yangtao
