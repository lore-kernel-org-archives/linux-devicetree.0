From: Eric Nelson <eric-SeqgQ6RdavfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2] imx: mx7dsabresd: include BLK for MMC/eMMC support of
 driver model
Date: Wed, 11 Oct 2017 14:41:49 -0700
Message-ID: <c52f889f-6958-026d-c530-4a815dcd9f28@nelint.com>
References: <1507753798-20666-1-git-send-email-eric@nelint.com>
 <1507757654-22114-1-git-send-email-eric@nelint.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507757654-22114-1-git-send-email-eric-SeqgQ6RdavfQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, otavio.salvador-fKevB0iiKLMBZ+LybsDmbA@public.gmane.org, peng.fan-3arQi8VN3Tc@public.gmane.org
List-Id: devicetree@vger.kernel.org

Please disregard.

I chose the wrong entry in my command-line history and
sent this to the wrong list.

On 10/11/2017 02:34 PM, Eric Nelson wrote:
> Commit 6fbbcfd introduced device-tree support for MMC devices on
> the mx7sabresd boards and didn't include BLK, which requires BLK.
> 
> Commit 8ae5bb3 did the same for secure boot.
> 
> Fix both by allowing blk-uclass (BLK) support.
> 
> Tested-by: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Eric Nelson <eric-SeqgQ6RdavfQT0dZR+AlfA@public.gmane.org>
> ---
> V2 includes the updated to mx7dsabresd_secure_defconfig
>   configs/mx7dsabresd_defconfig        | 1 -
>   configs/mx7dsabresd_secure_defconfig | 1 -
>   2 files changed, 2 deletions(-)
> 
> diff --git a/configs/mx7dsabresd_defconfig b/configs/mx7dsabresd_defconfig
> index 795c4f2..144fb50 100644
> --- a/configs/mx7dsabresd_defconfig
> +++ b/configs/mx7dsabresd_defconfig
> @@ -38,7 +38,6 @@ CONFIG_CMD_EXT4=y
>   CONFIG_CMD_EXT4_WRITE=y
>   CONFIG_CMD_FAT=y
>   CONFIG_OF_CONTROL=y
> -# CONFIG_BLK is not set
>   CONFIG_DFU_MMC=y
>   CONFIG_DFU_RAM=y
>   CONFIG_DM_GPIO=y
> diff --git a/configs/mx7dsabresd_secure_defconfig b/configs/mx7dsabresd_secure_defconfig
> index bd68831..d1af138 100644
> --- a/configs/mx7dsabresd_secure_defconfig
> +++ b/configs/mx7dsabresd_secure_defconfig
> @@ -40,7 +40,6 @@ CONFIG_CMD_EXT4=y
>   CONFIG_CMD_EXT4_WRITE=y
>   CONFIG_CMD_FAT=y
>   CONFIG_OF_CONTROL=y
> -# CONFIG_BLK is not set
>   CONFIG_DFU_MMC=y
>   CONFIG_DFU_RAM=y
>   CONFIG_DM_GPIO=y
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
