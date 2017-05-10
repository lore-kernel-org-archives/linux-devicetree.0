From: Santosh Shilimkar <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 0/4] ARM: dts: keystone: Add support for new K2G evm
Date: Wed, 10 May 2017 09:08:50 -0700
Message-ID: <6e039dc0-7054-66a9-5cee-ce00e0898882@oracle.com>
References: <20170424202204.24170-1-fcooper@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170424202204.24170-1-fcooper-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 4/24/2017 1:22 PM, Franklin S Cooper Jr wrote:
> This patchset adds support for new K2G Industrial Communication Engine
> evm. For now only a bare minimal dts which will allow ram boot. Additional
> peripherals will be added when base K2G SoC patches are upstreamed allowing
> peripherals to be enabled.
>
> Version 2 changes:
> Make various tweaks to allow unit address to be added to memory node.
>
> Franklin S Cooper Jr (4):
>   ARM: dts: keystone-k2g: Remove skeleton.dtsi
>   ARM: dts: k2g-evm: Add unit address to memory node
>   ARM: keystone: Create new binding for K2G ICE evm
>   ARM: dts: keystone: Add minimum support for K2G ICE evm
>
Will pick this up for next merge window. Thanks !!

Regards,
Santosh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
