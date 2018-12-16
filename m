From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH V4 1/2] dt-bindings: iio: accel: mma8452: add optional
 power supply property
Date: Sun, 16 Dec 2018 10:46:00 +0000
Message-ID: <20181216104600.32d90291@archlinux>
References: <1544504839-10958-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544504839-10958-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "knaack.h@gmx.de" <knaack.h@gmx.de>, "lars@metafoo.de" <lars@metafoo.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "martink@posteo.de" <martink@posteo.de>, Leonard Crestez <leonard.crestez@nxp.com>, "rtresidd@electromag.com.au" <rtresidd@electromag.com.au>, "gustavo@embeddedor.com" <gustavo@embeddedor.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "preid@electromag.com.au" <preid@electromag.com.au>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Tue, 11 Dec 2018 05:13:14 +0000
Anson Huang <anson.huang@nxp.com> wrote:

> The accelerometer's power supply could be controlled by regulator
> on some platforms, add optional property "vdd/vddio" power supply
> to let device tree to pass phandles to the regulators to driver.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

I'll not be pushing this out as non rebasing for a week or so
hence plenty of time to add additional reviews.

Thanks,

Jonathan
> ---
>  Documentation/devicetree/bindings/iio/accel/mma8452.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/accel/mma8452.txt b/Documentation/devicetree/bindings/iio/accel/mma8452.txt
> index 2100e9a..e132394 100644
> --- a/Documentation/devicetree/bindings/iio/accel/mma8452.txt
> +++ b/Documentation/devicetree/bindings/iio/accel/mma8452.txt
> @@ -20,6 +20,10 @@ Optional properties:
>    - interrupt-names: should contain "INT1" and/or "INT2", the accelerometer's
>  		     interrupt line in use.
>  
> +  - vdd-supply: phandle to the regulator that provides vdd power to the accelerometer.
> +
> +  - vddio-supply: phandle to the regulator that provides vddio power to the accelerometer.
> +
>  Example:
>  
>  	mma8453fc@1d {
