From: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH v2 5/6] soc: qcom: add OCMEM driver
Date: Wed, 19 Jun 2019 06:27:28 -0400
Message-ID: <20190619102728.GA894@onstation.org>
References: <20190619023209.10036-1-masneyb@onstation.org>
 <20190619023209.10036-6-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190619023209.10036-6-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, agross@kernel.org, david.brown@linaro.org, robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org
Cc: airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com, jonathan@marek.ca, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 18, 2019 at 10:32:08PM -0400, Brian Masney wrote:
> +++ b/include/soc/qcom/ocmem.h
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * The On Chip Memory (OCMEM) allocator allows various clients to allocate
> + * memory from OCMEM based on performance, latency and power requirements.
> + * This is typically used by the GPU, camera/video, and audio components on
> + * some Snapdragon SoCs.
> + *
> + * Copyright (C) 2019 Brian Masney <masneyb@onstation.org>
> + * Copyright (C) 2015 Red Hat. Author: Rob Clark <robdclark@gmail.com>
> + */
> +
> +#ifndef __OCMEM_H__
> +#define __OCMEM_H__
> +
> +enum ocmem_client {
> +	/* GMEM clients */
> +	OCMEM_GRAPHICS = 0x0,
> +	/*
> +	 * TODO add more once ocmem_allocate() is clever enough to
> +	 * deal with multiple clients.
> +	 */
> +	OCMEM_CLIENT_MAX,
> +};
> +
> +struct ocmem;
> +
> +struct ocmem_buf {
> +	unsigned long offset;
> +	unsigned long addr;
> +	unsigned long len;
> +};
> +
> +#if IS_ENABLED(CONFIG_QCOM_OCMEM)
> +
> +struct ocmem *of_get_ocmem(struct device *dev);
> +struct ocmem_buf *ocmem_allocate(struct ocmem *ocmem, enum ocmem_client client,
> +				 unsigned long size);
> +void ocmem_free(struct ocmem *ocmem, enum ocmem_client client,
> +		struct ocmem_buf *buf);
> +
> +#else /* IS_ENABLED(CONFIG_QCOM_OCMEM) */
> +
> +static inline struct ocmem *of_get_ocmem(struct device *dev)
> +{
> +	return NULL;

This, along with ocmem_allocate() below, need to return ERR_PTR(-ENOSYS).
adreno_gpu_ocmem_init() needs to check for this error code:

        ocmem = of_get_ocmem(dev);
        if (IS_ERR(ocmem)) {
                if (PTR_ERR(ocmem) == -ENXIO || PTR_ERR(ocmem) == -ENOSYS) {
                        /*
                         * Return success since either the ocmem property was
                         * not specified in device tree, or ocmem support is
                         * not compiled into the kernel.
                         */
                        return 0;
                }

                return PTR_ERR(ocmem);
        }

Brian



> +}
> +
> +static inline struct ocmem_buf *ocmem_allocate(struct ocmem *ocmem,
> +					       enum ocmem_client client,
> +					       unsigned long size)
> +{
> +	return NULL;
> +}
> +
> +static inline void ocmem_free(struct ocmem *ocmem, enum ocmem_client client,
> +			      struct ocmem_buf *buf)
> +{
> +}
> +
> +#endif /* IS_ENABLED(CONFIG_QCOM_OCMEM) */
> +
> +#endif /* __OCMEM_H__ */
> -- 
> 2.20.1
