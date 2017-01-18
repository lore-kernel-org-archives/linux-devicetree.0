From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM: davinci: da850-evm: fix read access to SPI flash
Date: Tue, 17 Jan 2017 16:25:23 -0800
Message-ID: <m237gh2ozw.fsf@baylibre.com>
References: <20170117125742.9536-1-fparent@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170117125742.9536-1-fparent-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> (Fabien Parent's
        message of "Tue, 17 Jan 2017 13:57:42 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabien Parent <fparent-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Fabien Parent <fparent-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:

> Read access to the SPI flash are broken on da850-evm, i.e. the data
> read is not what is actually programmed on the flash.
> According to the datasheet for the M25P64 part present on the da850-evm,
> if the SPI frequency is higher than 20MHz then the READ command is not
> usable anymore and only the FAST_READ command can be used to read data.
>
> This commit specifies in the DTS that we should use FAST_READ command
> instead of the READ command.
>
> Signed-off-by: Fabien Parent <fparent-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

Tested on da850-evm on top of v4.10-rc3.  This gets the DT boot
functionatliy in line with the legacy (board-file) boot.

Tested-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
