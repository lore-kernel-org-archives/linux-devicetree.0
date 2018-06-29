From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v1] ARM: dts: imx51-zii-rdu1: correct touchscreen axis
 inversion
Date: Fri, 29 Jun 2018 10:55:55 +0200
Message-ID: <1530262555.22468.63.camel@pengutronix.de>
References: <20180628225626.26203-1-nick@shmanahar.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180628225626.26203-1-nick@shmanahar.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nick Dyer <nick@shmanahar.org>, Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Chris Healy <cphealy@gmail.com>
List-Id: devicetree@vger.kernel.org

Am Donnerstag, den 28.06.2018, 23:56 +0100 schrieb Nick Dyer:
> The RMI4 touchscreen driver applied inversion and axis swap in the
> wrong order, violating the DT binding for those properties. This was fixed in
> 645a397, so correct the RDU1 DT to apply the inversion to the
> correct axis.
> 
> Tested on Zii RDU1 00-5105-30 rev B
> 
> Signed-off-by: Nick Dyer <nick@shmanahar.org>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
>  arch/arm/boot/dts/imx51-zii-rdu1.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/imx51-zii-rdu1.dts b/arch/arm/boot/dts/imx51-zii-rdu1.dts
> index 68f5c1d5ecd0..b1d83fb08150 100644
> --- a/arch/arm/boot/dts/imx51-zii-rdu1.dts
> +++ b/arch/arm/boot/dts/imx51-zii-rdu1.dts
> @@ -553,7 +553,7 @@
>  
> >  		rmi4-f11@11 {
> >  			reg = <0x11>;
> > -			touchscreen-inverted-y;
> > +			touchscreen-inverted-x;
> >  			touchscreen-swapped-x-y;
> >  			syna,sensor-type = <1>;
> >  		};
