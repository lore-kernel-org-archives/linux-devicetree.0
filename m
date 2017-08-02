From: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6 5/7] PCI: dwc: qcom: Use block IP version for
 operations
Date: Wed, 2 Aug 2017 21:34:22 +0300
Message-ID: <285396b4-cadb-6f4a-8cca-d781503b9d49@mm-sol.com>
References: <1501482857-14100-1-git-send-email-varada@codeaurora.org>
 <1501482857-14100-6-git-send-email-varada@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501482857-14100-6-git-send-email-varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Varadarajan Narayanan <varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 31.07.2017 09:34, Varadarajan Narayanan wrote:
> Presently, when support for a new SoC is added, the driver ops
> structures and functions are versioned with plain 1, 2, 3 etc.
> Instead use the block IP version number.
> 
> Signed-off-by: Varadarajan Narayanan <varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>   drivers/pci/dwc/pcie-qcom.c | 133 +++++++++++++++++++++++---------------------
>   1 file changed, 71 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/pci/dwc/pcie-qcom.c b/drivers/pci/dwc/pcie-qcom.c

<cut>

> +/*
> + * Declare one of_device_id entry
> + * c - Compatible string
> + * d - Associated data
> + * w - SoC wrapper version (ignored)
> + * s - Synopsys core version (ignored)
> + */
> +#define QCOM_DECL(c, d, w, s) { .compatible = c, .data = &d }

Please don't introduce this macro, just add a comment with qcom version 
and corresponding synopsys version.

regards,
Stan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
