From: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: socfpga: Update socfpga_defconfig
Date: Tue, 8 Jul 2014 13:26:13 +0200
Message-ID: <20140708112613.GB8100@amd.pavel.ucw.cz>
References: <1403483462-21082-1-git-send-email-vbridgers2013@gmail.com>
 <1403483462-21082-2-git-send-email-vbridgers2013@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1403483462-21082-2-git-send-email-vbridgers2013-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Bridgers <vbridgers2013-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun 2014-06-22 19:31:01, Vince Bridgers wrote:
> CONFIG_PM=y
> CONFIG_SUSPEND=y
> CONFIG_MMC_UNSAFE_RESUME=y
> CONFIG_DWMAC_SOCFPGA=y
> CONFIG_USB=y
> CONFIG_USB_DWC2=y
> CONFIG_USB_DWC2_HOST=y
> CONFIG_USB_DWC2_PLATFORM=y
> CONFIG_FHANDLE=y
> CONFIG_I2C=y
> CONFIG_I2C_DESIGNWARE_CORE=y
> CONFIG_I2C_DESIGNWARE_PLATFORM=y
> CONFIG_I2C_CHARDEV=y
> CONFIG_CAN=y
> CONFIG_CAN_RAW=y
> CONFIG_CAN_BCM=y
> CONFIG_CAN_GW=y
> CONFIG_CAN_DEV=y
> CONFIG_CAN_CALC_BITTIMING=y
> CONFIG_CAN_C_CAN=y
> CONFIG_CAN_C_CAN_PLATFORM=y
> CONFIG_WATCHDOG=y
> CONFIG_DW_WATCHDOG=y
> CONFIG_GPIOLIB=y
> CONFIG_GPIO_SYSFS=y
> CONFIG_GPIO_DWAPB=y
> CONFIG_PPS=y
> CONFIG_NETWORK_PHY_TIMESTAMPING=y
> CONFIG_PTP_1588_CLOCK=y
> CONFIG_VLAN_8021Q=y
> CONFIG_VLAN_8021Q_GVRP=y
> CONFIG_GARP=y
> CONFIG_IPV6=y
> CONFIG_HOTPLUG=y
> 
> Signed-off-by: Vince Bridgers <vbridgers2013-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Thor Thayer <tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>

Acked-by: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
