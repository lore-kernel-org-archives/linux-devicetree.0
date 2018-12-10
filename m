From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 1/2] dt-bindings: iio: light: isl29018: update power
 supply name
Date: Mon, 10 Dec 2018 17:23:58 -0600
Message-ID: <20181210232358.GA11621@bogus>
References: <1544425521-775-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544425521-775-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "jic23@kernel.org" <jic23@kernel.org>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "lars@metafoo.de" <lars@metafoo.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 10, 2018 at 07:11:19AM +0000, Anson Huang wrote:
> According to datasheet, the isl29018 has "vddd/vdda" power
> supply, and isl29023/isl29035 ONLY has "vdd" power supply,
> update the power supply name with "vdd" and "vdda" according
> to datasheet to cover all devices and avoid confusion.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  Documentation/devicetree/bindings/iio/light/isl29018.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/light/isl29018.txt b/Documentation/devicetree/bindings/iio/light/isl29018.txt
> index b9bbde3..36f737d 100644
> --- a/Documentation/devicetree/bindings/iio/light/isl29018.txt
> +++ b/Documentation/devicetree/bindings/iio/light/isl29018.txt
> @@ -15,7 +15,9 @@ Optional properties:
>    Refer to interrupt-controller/interrupts.txt for generic interrupt client
>    node bindings.
>  
> -  - vcc-supply: phandle to the regulator that provides power to the sensor.
> +  - vdd-supply: phandle to the regulator that provides vdd power to the sensor.
> +
> +  - vdda-supply: phandle to the regulator that provides vdda power to the sensor.

Is this in use? You can't just change things if it is.

Rob
