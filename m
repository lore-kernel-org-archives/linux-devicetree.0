From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: Amlogic: Add Meson8 and Meson8b SMP
 related documentation
Date: Mon, 17 Jul 2017 12:53:07 -0500
Message-ID: <20170717175307.ntxkhmynwuroak7v@rob-hp-laptop>
References: <20170713103113.21560-1-martin.blumenstingl@googlemail.com>
 <20170713103113.21560-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170713103113.21560-2-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 13, 2017 at 12:31:08PM +0200, Martin Blumenstingl wrote:
> From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
> 
> With this patch we add documentation for:
> 
> * power-management-unit: the PMU is used to bring up the cores during
>   SMP operations
> * sram: among other things the sram is used to store the first code
>   executed by the core when it is powered up
> * cpu-enable-method: the CPU enable method used by Amlogic Meson8 and
>   Meson8b SoCs
> 
> Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
> [also add Meson8 to the documentation]
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> ---
>  .../devicetree/bindings/arm/amlogic/pmu.txt        | 18 ++++++++++++
>  .../devicetree/bindings/arm/amlogic/smp-sram.txt   | 32 ++++++++++++++++++++++
>  Documentation/devicetree/bindings/arm/cpus.txt     |  2 ++
>  3 files changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/amlogic/pmu.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/amlogic/smp-sram.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
