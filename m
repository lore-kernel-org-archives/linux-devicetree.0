From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 01/12] coresight replicator: Cleanup programmable
 replicator naming
Date: Wed, 28 Jun 2017 11:33:46 -0500
Message-ID: <20170628163346.p54iktif4vehvvut@rob-hp-laptop>
References: <1498490576-1350-1-git-send-email-suzuki.poulose@arm.com>
 <1498490576-1350-2-git-send-email-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1498490576-1350-2-git-send-email-suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Pratik Patel <pratikp-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "Ivan T . Ivanov" <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 26, 2017 at 04:22:45PM +0100, Suzuki K Poulose wrote:
> The Linux coresight drivers define the programmable ATB replicator as
> Qualcom replicator, while this is designed by ARM. This can cause confusion

Qualcomm

> to a user selecting the driver. Cleanup all references to make it
>  explicitly clear. This patch :
> 
>  1) Replace the compatible string for the replicator :
> 	qcom,coresight-replicator1x => arm,coresight-dynamic-replicator
>  2) Changes the Kconfig symbol (since this is not part of any defconfigs)
> 	 CORESIGHT_QCOM_REPLICATOR => CORESIGHT_DYNAMIC_REPLICATOR
>  3) Improves the help message in the Kconfig.
>  4) Changes the name of the driver and the file :
> 	coresight-replicator-qcom => coresight-dynamic-replicator
> 
> Cc: Pratik Patel <pratikp-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Ivan T. Ivanov <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
> ---
> Changes since V1:
>  - Since the driver doesn't use the compatible string, change the
>    recommended compatible string.
>  - Rename the driver file to coresight-dynamic-replicator.c
> ---
>  Documentation/devicetree/bindings/arm/coresight.txt            |  4 ++--
>  drivers/hwtracing/coresight/Kconfig                            | 10 +++++-----
>  drivers/hwtracing/coresight/Makefile                           |  2 +-
>  ...esight-replicator-qcom.c => coresight-dynamic-replicator.c} |  5 ++---
>  4 files changed, 10 insertions(+), 11 deletions(-)
>  rename drivers/hwtracing/coresight/{coresight-replicator-qcom.c => coresight-dynamic-replicator.c} (97%)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
