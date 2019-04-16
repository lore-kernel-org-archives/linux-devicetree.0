From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/2] dt-bindings: Add isl68137 as a trivial device
Date: Tue, 16 Apr 2019 08:54:39 -0700
Message-ID: <20190416155439.GB8871@roeck-us.net>
References: <20190416154147.125602-1-venture@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190416154147.125602-1-venture@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Patrick Venture <venture@google.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, trivial@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 16, 2019 at 08:41:47AM -0700, Patrick Venture wrote:
> The isl68137 is a digital output 7-phrase configurable PWM controller
> with an AVSBus interface from Intersil.
> 
> Signed-off-by: Patrick Venture <venture@google.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 92184ef0db2e..747fd3f689dc 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -104,6 +104,8 @@ properties:
>            - isil,isl29028
>              # Intersil ISL29030 Ambient Light and Proximity Sensor
>            - isil,isl29030
> +            # Intersil ISL68137 Digital Output Configurable PWM Controller
> +          - isil,isl68137
>              # 5 Bit Programmable, Pulse-Width Modulator
>            - maxim,ds1050
>              # Low-Power, 4-/12-Channel, 2-Wire Serial, 12-Bit ADCs
> -- 
> 2.21.0.392.gf8f6787159e-goog
> 
