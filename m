From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 2/6] Documentation: DT: Add optional 'timeout-sec'
 property for sp805
Date: Wed, 23 May 2018 15:29:15 -0700
Message-ID: <20180523222915.GA16779@roeck-us.net>
References: <1527107527-8093-1-git-send-email-ray.jui@broadcom.com>
 <1527107527-8093-3-git-send-email-ray.jui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1527107527-8093-3-git-send-email-ray.jui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ray Jui <ray.jui@broadcom.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Robin Murphy <robin.murphy@arm.com>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On Wed, May 23, 2018 at 01:32:03PM -0700, Ray Jui wrote:
> Update the SP805 binding document to add optional 'timeout-sec'
> devicetree property
> 
> Signed-off-by: Ray Jui <ray.jui@broadcom.com>
> Reviewed-by: Scott Branden <scott.branden@broadcom.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  Documentation/devicetree/bindings/watchdog/arm,sp805.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/arm,sp805.txt b/Documentation/devicetree/bindings/watchdog/arm,sp805.txt
> index de93a4d..9cd7470 100644
> --- a/Documentation/devicetree/bindings/watchdog/arm,sp805.txt
> +++ b/Documentation/devicetree/bindings/watchdog/arm,sp805.txt
> @@ -18,6 +18,8 @@ Required properties:
>  
>  Optional properties:
>  - interrupts : Should specify WDT interrupt number.
> +timeout-sec : Should specify default WDT timeout in seconds. If unset, the
> +              default timeout in the driver is 30 seconds

That looks odd, with the changed indentation and the missing '-'
in front of 'timeout-sec'.

Guenter
