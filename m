Return-Path: <robherring2@gmail.com>
Date: Thu, 28 Mar 2019 10:19:08 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: hwmon: (adc128d818) Specify ti,mode
 property  size
Message-ID: <20190328151908.GA23332@bogus>
References: <20190313141125.GA26062@carlosaurelio.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190313141125.GA26062@carlosaurelio.net>
To: Carlos Menin <menin@carlosaurelio.net>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, 13 Mar 2019 11:11:26 -0300, Carlos Menin wrote:
> By default, cells in DT are 32-bit in size. The driver reads "ti,mode"
> using the function of_property_read_u8() which causes the value to be
> read incorrectly in little-endian architectures if the size is not
> specified.
> 
> Make it explicit in the binding documentation that this prorperty must
> be set as a 8-bit value.
> 
> Signed-off-by: Carlos Menin <menin@carlosaurelio.net>
> ---
>  Documentation/devicetree/bindings/hwmon/adc128d818.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
