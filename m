From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v5 8/8] ARM: dts: rockchip: support the spi for rk3036
Date: Tue, 02 Feb 2016 22:29:28 +0100
Message-ID: <8822283.9IqfJnsVut@diego>
References: <1454384032-6794-1-git-send-email-wxt@rock-chips.com> <1454384453-7127-1-git-send-email-wxt@rock-chips.com> <1454384453-7127-4-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454384453-7127-4-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, keescook-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org, leozwang-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 2. Februar 2016, 11:40:53 schrieb Caesar Wang:
> This patch adds the needed spi node for rk3036 dts.
> 
> We have to use the 4 bus emmc to work if someone want to support
> the spi devices, since the pins are re-used by emmc data[5-8] and spi.
> In some caseswe need to support the spi devices, that will waste the
> emmc performance.
> 
> Moment, the kylin/evb hasn't the spi devices to work, so maybe we need wait
> the new required to enable in kylin/evb board.
> 
> Anyway, the spi should be needed land in rk3036 dts.
> 
> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

applied to my dts32 branch for 4.6


Thanks
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
