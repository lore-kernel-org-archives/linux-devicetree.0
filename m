From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: iio: light: add stk33xx
Date: Sun, 14 Jul 2019 16:21:49 +0100
Message-ID: <20190714162149.0812b187@archlinux>
References: <20190703180604.9840-1-luca@z3ntu.xyz>
        <20190703180604.9840-2-luca@z3ntu.xyz>
        <CAL_JsqJU5nBf+tzudpXVseeb8FMoJUK3ANJs3btb=6gbcG41EA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJU5nBf+tzudpXVseeb8FMoJUK3ANJs3btb=6gbcG41EA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Luca Weiss <luca@z3ntu.xyz>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Vivek Unune <npcomplete13@gmail.com>, Hannes Schmelzer <hannes.schmelzer@br-automation.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>, Martijn Braam <martijn@brixit.nl>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 5 Jul 2019 10:23:11 -0600
Rob Herring <robh+dt@kernel.org> wrote:

> On Wed, Jul 3, 2019 at 12:06 PM Luca Weiss <luca@z3ntu.xyz> wrote:
> >
> > Add binding documentation for the stk33xx family of ambient light
> > sensors.
> >
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > ---
> >  .../bindings/iio/light/stk33xx.yaml           | 49 +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/light/stk33xx.yaml  
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Hmm. Not totally sure it makes sense to list me as the maintainer,
but I don't suppose it really matters as I think the author has moved
onto other things and it'll fall back on me.

Anyone who wants to pick up this one is most welcome!

Applied to the togreg branch of iio.git and pushed out as testing for the
autobuilders to play with it.

Thanks,

Jonathan
