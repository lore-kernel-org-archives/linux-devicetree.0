From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 6/6] MAINTAINERS: add entry for Amlogic Thermal driver
Date: Wed, 31 Jul 2019 14:52:11 +0200
Message-ID: <3c522eb3-5cf7-6a79-3282-864d8b783a51@baylibre.com>
References: <20190731121409.17285-1-glaroque@baylibre.com>
 <20190731121409.17285-7-glaroque@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190731121409.17285-7-glaroque@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guillaume La Roque <glaroque@baylibre.com>, daniel.lezcano@linaro.org, khilman@baylibre.com
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 31/07/2019 14:14, Guillaume La Roque wrote:
> Add myself as maintainer for Amlogic Thermal driver.
> 
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fb2b12f75c37..299f27d11058 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15910,6 +15910,15 @@ F:	Documentation/driver-api/thermal/cpu-cooling-api.rst
>  F:	drivers/thermal/cpu_cooling.c
>  F:	include/linux/cpu_cooling.h
>  
> +THERMAL DRIVER FOR AMLOGIC SOCS
> +M:	Guillaume La Roque <glaroque@baylibre.com>
> +L:	linux-pm@vger.kernel.org
> +L:	linux-amlogic@lists.infradead.org
> +W:	http://linux-meson.com/
> +S:	Supported
> +F:	drivers/thermal/amlogic_thermal.c
> +F:	Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> +
>  THINKPAD ACPI EXTRAS DRIVER
>  M:	Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
>  L:	ibm-acpi-devel@lists.sourceforge.net
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
