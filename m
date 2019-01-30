From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH RFC 1/3] dt-bindings: hwmon: Add tachometer interrupt to
 pwm-fan
Date: Wed, 30 Jan 2019 09:28:15 -0800
Message-ID: <20190130172815.GC14781@roeck-us.net>
References: <1548860827-29796-1-git-send-email-stefan.wahren@i2se.com>
 <1548860827-29796-2-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548860827-29796-2-git-send-email-stefan.wahren@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Kamil Debski <kamil@wypas.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 30, 2019 at 04:07:05PM +0100, Stefan Wahren wrote:
> This adds the tachometer interrupt to the pwm-fan binding, which is
> necessary for RPM support.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  Documentation/devicetree/bindings/hwmon/pwm-fan.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.txt b/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
> index 49ca5d8..7f69b0b 100644
> --- a/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
> +++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
> @@ -8,6 +8,9 @@ Required properties:
>  
>  Optional properties:
>  - fan-supply    : phandle to the regulator that provides power to the fan
> +- interrupts    : contains a single interrupt specifier which describes the
> +                  tachometer pin output of a 2 pulse-per-revolution fan.
> +                  See interrupt-controller/interrupts.txt for the format.

So a hypothetical {1,4} pulse-per-revolution fan would explicitly not be
supported ? Why ?

Guenter
