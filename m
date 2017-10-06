From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 0/2] ARM64: meson-gxm: Add support for Khadas VIM2
Date: Fri, 06 Oct 2017 16:05:01 -0700
Message-ID: <7hwp477u8y.fsf@baylibre.com>
References: <1507044283-18476-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507044283-18476-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> (Neil
        Armstrong's message of "Tue, 3 Oct 2017 17:24:41 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:

> The Khadas VIM2 is a Single Board Computer, respin of the origin
> Khadas VIM board, using an Amlogic S912 SoC and more server oriented.
>     
> It provides the same external connectors and header pinout, plus a SPI
> NOR Flash, a reprogrammable STM8S003 MCU, FPC Connector, Cooling FAN header
> and Pogo Pads Arrays.
>
> To eventually provide access to the SPI NOR flash, the eMMC DS pin must be
> configured as a different pincrl node to disable it's access from the MMC
> Controller. This first patch splits this emmc pins entry for GXBB and GXL.
>
> Depends on eMMC ARM64 DT patches from Jerome Brunet at [2]

eMMC patches now merged in mainline, so Appled to v4.15/dt64 with
Jerome's Tested-by,

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
