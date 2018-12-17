From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V5 1/2] dt-bindings: iio: accel: mma8452: add power
 supplies  property
Date: Mon, 17 Dec 2018 15:42:15 -0600
Message-ID: <20181217214215.GA16536@bogus>
References: <1545023805-31250-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1545023805-31250-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "jic23@kernel.org" <jic23@kernel.org>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "lars@metafoo.de" <lars@metafoo.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "martink@posteo.de" <martink@posteo.de>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "gustavo@embeddedor.com" <gustavo@embeddedor.com>, Leonard Crestez <leonard.crestez@nxp.com>, "rtresidd@electromag.com.au" <rtresidd@electromag.com.au>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "preid@electromag.com.au" <preid@electromag.com.au>
List-Id: devicetree@vger.kernel.org

On Mon, 17 Dec 2018 05:22:49 +0000, Anson Huang wrote:
> The accelerometer's power supplies could be controllable on some
> platforms, add property "vdd/vddio" power supply to let device tree
> to pass phandles to the regulators to driver.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  Documentation/devicetree/bindings/iio/accel/mma8452.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
