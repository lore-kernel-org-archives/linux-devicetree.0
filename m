From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCHv1] rtc: bcm-iproc: Add support for Broadcom iproc rtc
Date: Tue, 16 Dec 2014 20:42:56 +0100
Message-ID: <7947905.aK8KkUx4sY@wuerfel>
References: <1418757750-3628-1-git-send-email-arun.ramamurthy@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418757750-3628-1-git-send-email-arun.ramamurthy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: arun.ramamurthy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Arun Ramamurthy <arunrama-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 16 December 2014 11:22:30 arun.ramamurthy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org wrote:
> +       rtc: iproc_rtc@0x03026000 {
> +               compatible = "brcm,iproc-rtc";
> +               reg =   spru_bbl:               <0x03026000 0xC>,
> +                       crmu_pwr_good_status:   <0x0301C02C 0x14>,
> +                       crmu_bbl_auth:          <0x03024C74 0x8>;
> +               interrupts = spru_rtc_periodic: <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
> +                            spru_alarm:        <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;

The reg properties look really random, could it be that the registers
are really part of some other device that contains multiple functions?

Also, what do you use the labels for?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
