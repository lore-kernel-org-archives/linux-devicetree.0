From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 5/5] dt-bindings: iio: light: add vcnl4040 devicetree
 bindings
Date: Sun, 24 Mar 2019 17:25:29 +0000
Message-ID: <20190324172529.3f84a17c@archlinux>
References: <20190321154047.23236-1-angus@akkea.ca>
        <20190321154047.23236-6-angus@akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321154047.23236-6-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tomas Novotny <tomas@novotny.cz>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 21 Mar 2019 08:40:47 -0700
"Angus Ainslie (Purism)" <angus@akkea.ca> wrote:

> Document the vishay VCNL4040 devicetree bindings.
> 
> Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
Applied.

Thanks,

Jonathan
> ---
>  Documentation/devicetree/bindings/iio/light/vcnl4000.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/light/vcnl4000.txt b/Documentation/devicetree/bindings/iio/light/vcnl4000.txt
> index 4a9d558a412a..955af4555c90 100644
> --- a/Documentation/devicetree/bindings/iio/light/vcnl4000.txt
> +++ b/Documentation/devicetree/bindings/iio/light/vcnl4000.txt
> @@ -1,6 +1,6 @@
>  VISHAY VCNL4000 -  Ambient Light and proximity sensor
>  
> -This driver supports the VCNL4000/10/20 and VCNL4200 chips
> +This driver supports the VCNL4000/10/20/40 and VCNL4200 chips
>  
>  Required properties:
>  
> @@ -8,11 +8,13 @@ Required properties:
>          vishay,vcnl4000
>          vishay,vcnl4010
>          vishay,vcnl4020
> +        vishay,vcnl4040
>          vishay,vcnl4200
>  
>  	-reg: I2C address of the sensor, should be one from below based on the model:
>          0x13
>          0x51
> +        0x60
>  
>  Example:
>  
