From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 1/2] ARM: dts: imx6qdl-sabrelite: fix USB PHY reset
Date: Mon, 24 Jul 2017 10:03:14 -0300
Message-ID: <CAOMZO5CnJv6qfn5qWuJ-NkLWhenGV8pX8shS0u7+a7tymNSJdg@mail.gmail.com>
References: <20170724085005.22101-1-gary.bisson@boundarydevices.com>
 <20170724125958.11939-1-gary.bisson@boundarydevices.com> <20170724125958.11939-2-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170724125958.11939-2-gary.bisson@boundarydevices.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gary Bisson <gary.bisson@boundarydevices.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 24, 2017 at 9:59 AM, Gary Bisson
<gary.bisson@boundarydevices.com> wrote:
> Declared as a regulator since the driver doesn't have a reset-gpios
> property for this.
>
> This ensures that the PHY is woken up, not depending on the state the
> second stage bootloader leaves the pin.
>
> This is a workaround until a proper mechanism is provided to reset such
> devices like the pwrseq library [1] for instance.
>
> [1] https://lkml.org/lkml/2017/2/10/779
>
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
