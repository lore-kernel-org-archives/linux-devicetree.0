From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH/RFT v2 00/17] Add DT support for ohci-da8xx
Date: Tue, 25 Oct 2016 16:25:57 +0530
Message-ID: <39744873-14ec-5eae-640c-10435b9eb492@ti.com>
References: <20161024164634.4330-1-ahaslam@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161024164634.4330-1-ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sshtylyov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org, david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org, manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Axel,

On Monday 24 October 2016 10:16 PM, ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org wrote:
> From: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> 
> The purpose of this patch series is to add DT support and modernize
> the ohci-da8xx glue driver without breaking the non-DT boot,
> which is still used in unconverted davinci devices.

>From a mach-davinci perspective, there are some patches which seem to be
safe to apply and some which depend on corresponding driver changes to
get in.

In order to speed up the process of applying this series, can you split
the mach-davinci updates which are safe to apply into a separate series.

For DT patches, the bindings should be accepted. For other patches, they
should not be causing any regressions.

Thanks,
Sekhar
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
