From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH 1/2] vfio, platform: add support for ACPI while detecting
 the reset driver
Date: Tue, 8 Mar 2016 10:37:34 -0500
Message-ID: <56DEF1BE.8010701@codeaurora.org>
References: <1457451209-21462-1-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <kvm-owner@vger.kernel.org>
In-Reply-To: <1457451209-21462-1-git-send-email-okaya@codeaurora.org>
Sender: kvm-owner@vger.kernel.org
To: kvm@vger.kernel.org, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, eric.auger@linaro.org
Cc: shankerd@codeaurora.org, vikrams@codeaurora.org, marc.zyngier@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, vinod.koul@intel.com, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Baptiste Reynal <b.reynal@virtualopensystems.com>, Alex Williamson <alex.williamson@redhat.com>, Dan Carpenter <dan.carpenter@oracle.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 3/8/2016 10:33 AM, Sinan Kaya wrote:
> +	int rc = 0;
> +

I should have initialized this to -1. 

> +	vdev->reset = vfio_platform_lookup_reset(vdev->compat, vdev->acpihid,
> +						 &vdev->reset_module);
> +	if (vdev->reset)
> +		return 0;
> +
> +	if (vdev->acpihid)
> +		rc = request_module("vfio-reset:%s", vdev->acpihid);
> +
> +	if (rc && vdev->compat)
> +		rc = request_module("vfio-reset:%s", vdev->compat);
> +


-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
