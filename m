From: kishon <kishon@ti.com>
Subject: Re: [PATCH 2/5] ARM: S3C64XX: Add phy_type to pmu_isolation
Date: Tue, 9 Oct 2012 11:03:55 +0530
Message-ID: <5073B743.9000200@ti.com>
References: <1349705548-15207-1-git-send-email-gautam.vivek@samsung.com> <1349705548-15207-3-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1349705548-15207-3-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, balbi@ti.com, rob.herring@calxeda.com, kgene.kim@samsung.com, jg1.han@samsung.com, thomas.abraham@linaro.org, p.paneri@samsung.com, yulgon.kim@samsung.com
List-Id: devicetree@vger.kernel.org

Hi,

On Monday 08 October 2012 07:42 PM, Vivek Gautam wrote:
> It adds 'type' argument to pmu_isolation function, aligning
> with other platforms, which keeps track of usbphy_type.
>
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> ---
>   arch/arm/mach-s3c64xx/setup-usb-phy.c |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arm/mach-s3c64xx/setup-usb-phy.c b/arch/arm/mach-s3c64xx/setup-usb-phy.c
> index 3aee778..b7d1d95 100644
> --- a/arch/arm/mach-s3c64xx/setup-usb-phy.c
> +++ b/arch/arm/mach-s3c64xx/setup-usb-phy.c
> @@ -13,7 +13,7 @@
>   #include <mach/map.h>
>   #include <mach/regs-sys.h>
>
> -void s5p_usb_phy_pmu_isolation(int on)
> +void s5p_usb_phy_pmu_isolation(int on, int type)

IMO, this patch should have been squashed with the previous patch. IIUC, 
you have changed the call to this function for taking two arguments in 
your previous patch. Wouldn't that introduce compilation break after 
applying your first patch?

Thanks
Kishon
