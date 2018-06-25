From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v7 3/3] MAINTAINERS: add subfolders for nuvoton *npcm*
Date: Mon, 25 Jun 2018 21:59:53 +0800
Message-ID: <20180625135953.GA3999@kroah.com>
References: <20180620063306.134820-1-avifishman70@gmail.com>
 <20180620063306.134820-4-avifishman70@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180620063306.134820-4-avifishman70@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: avifishman70@gmail.com
Cc: stern@rowland.harvard.edu, tmaimon77@gmail.com, venture@google.com, yuenn@google.com, brendanhiggins@google.com, mathias.nyman@linux.intel.com, bjorn.andersson@linaro.org, jhogan@kernel.org, albeu@free.fr, chunfeng.yun@mediatek.com, tony@atomide.com, baolu.lu@linux.intel.com, elder@linaro.org, digetx@gmail.com, kstewart@linuxfoundation.org, hdegoede@redhat.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, openbmc@lists.ozlabs.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 20, 2018 at 09:33:06AM +0300, avifishman70@gmail.com wrote:
> From: Avi Fishman <AviFishman70@gmail.com>
> 
> Signed-off-by: Avi Fishman <AviFishman70@gmail.com>

No changelog text?

> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e0ce3c5f32e5..23c450adad44 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1727,7 +1727,10 @@ F:	arch/arm/mach-npcm/
>  F:	arch/arm/boot/dts/nuvoton-npcm*
>  F:	include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
>  F:	drivers/*/*npcm*
> +F:	drivers/*/*/*npcm*
>  F:	Documentation/*/*npcm*
> +F:	Documentation/*/*/*npcm*
> +F:	Documentation/*/*/*/*npcm*

Patch does not apply to 4.18-rc2 :(

thanks,

greg k-h
