From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH V7 1/2] dt-bindings: iio: accel: mma8452: add power
 supplies  property
Date: Sat, 12 Jan 2019 19:06:32 +0000
Message-ID: <20190112190632.09399dfd@archlinux>
References: <1546938556-26969-1-git-send-email-Anson.Huang@nxp.com>
        <20190111143219.GA8867@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190111143219.GA8867@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Anson Huang <anson.huang@nxp.com>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "lars@metafoo.de" <lars@metafoo.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "martink@posteo.de" <martink@posteo.de>, "gustavo@embeddedor.com" <gustavo@embeddedor.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Leonard Crestez <leonard.crestez@nxp.com>, "rtresidd@electromag.com.au" <rtresidd@electromag.com.au>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Fri, 11 Jan 2019 08:32:19 -0600
Rob Herring <robh@kernel.org> wrote:

> On Tue, 8 Jan 2019 09:14:01 +0000, Anson Huang wrote:
> > The accelerometer's power supplies could be controllable on some
> > platforms, add property "vdd/vddio" power supply to let device tree
> > to pass phandles to the regulators to driver.
> > 
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/iio/accel/mma8452.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> >   
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.

On this occasion I've gone back and found Rob's Ack. On future occasions
I might just ignore a patch where Rob or someone else has pointed out
there previous tag / explanation for dropping it is missing.
Depends what mood I'm in :) (also Rob had pointed this out on v6 as well
so you should have been extra careful).

Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

Thanks,

Jonathan
