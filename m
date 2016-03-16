From: santosh shilimkar <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: k2*: Rename the k2* files to keystone-k2* files
Date: Wed, 16 Mar 2016 08:43:10 -0700
Message-ID: <56E97F0E.6070309@oracle.com>
References: <1458139150-30382-1-git-send-email-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458139150-30382-1-git-send-email-nm-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 3/16/2016 7:39 AM, Nishanth Menon wrote:
> As reported in [1], rename the k2* dts files to keystone-* files
> this will force consistency throughout.
>
> Script for the same (and hand modified for Makefile and MAINTAINERS
> files):
> for i in arch/arm/boot/dts/k2*
> do
> 	b=`basename $i`;
> 	git mv $i arch/arm/boot/dts/keystone-$b;
> 	sed -i -e "s/$b/keystone-$b/g" arch/arm/boot/dts/*[si]
> done
>
> NOTE: bootloaders that depend on older dtb names will need to be
> updated as well.
>
> [1] http://marc.info/?l=linux-arm-kernel&m=145637407804754&w=2
>
> Reported-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> Signed-off-by: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
> ---
>
Thanks Nishant for taking care of this. I will add this to the
next soon.

Reagrds,
Santosh

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
