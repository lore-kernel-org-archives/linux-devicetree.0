From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/2] dt-bindings: Add ir38064 as a trivial device
Date: Tue, 16 Apr 2019 08:54:19 -0700
Message-ID: <20190416155419.GA8871@roeck-us.net>
References: <20190416154138.124734-1-venture@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190416154138.124734-1-venture@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Patrick Venture <venture@google.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, trivial@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 16, 2019 at 08:41:38AM -0700, Patrick Venture wrote:
> The ir38064 is a voltage regulator from Infineon.
> 
> Signed-off-by: Patrick Venture <venture@google.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index d79fb22bde39..92184ef0db2e 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -92,6 +92,8 @@ properties:
>            - fsl,sgtl5000
>              # G751: Digital Temperature Sensor and Thermal Watchdog with Two-Wire Interface
>            - gmt,g751
> +            # Infineon IR38064 Voltage Regulator
> +          - infineon,ir38064
>              # Infineon SLB9635 (Soft-) I2C TPM (old protocol, max 100khz)
>            - infineon,slb9635tt
>              # Infineon SLB9645 I2C TPM (new protocol, max 400khz)
> -- 
> 2.21.0.392.gf8f6787159e-goog
> 
