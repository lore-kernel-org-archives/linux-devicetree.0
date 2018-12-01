From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: add B57891S0103 thermistor from
 Epcos
Date: Sat, 1 Dec 2018 10:37:38 -0800
Message-ID: <20181201183738.GA21777@roeck-us.net>
References: <20181117121248.32143-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181117121248.32143-1-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, Nov 17, 2018 at 12:12:57PM +0000, Peter Rosin wrote:
> These are Negative Temperature Coefficient thermistors, like the others
> in the list.
> 
> Signed-off-by: Peter Rosin <peda@axentia.se>

Atrictly speaking that should get an Ack from a DT maintainer, but it
doesn't make sense to me to hold up the series for a one-line addition.

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/hwmon/ntc_thermistor.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ntc_thermistor.txt b/Documentation/devicetree/bindings/hwmon/ntc_thermistor.txt
> index c3b9c4cfe8df..37f18d684f6a 100644
> --- a/Documentation/devicetree/bindings/hwmon/ntc_thermistor.txt
> +++ b/Documentation/devicetree/bindings/hwmon/ntc_thermistor.txt
> @@ -4,6 +4,7 @@ NTC Thermistor hwmon sensors
>  Requires node properties:
>  - "compatible" value : one of
>  	"epcos,b57330v2103"
> +	"epcos,b57891s0103"
>  	"murata,ncp15wb473"
>  	"murata,ncp18wb473"
>  	"murata,ncp21wb473"
