From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 7/8] phy: miphy28lp: Add SSC support for PCIE
Date: Mon, 8 Sep 2014 20:45:43 +0530
Message-ID: <540DC81F.6000901@ti.com>
References: <1409758637-28654-1-git-send-email-gabriel.fernandez@linaro.org> <1409758637-28654-8-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409758637-28654-8-git-send-email-gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Harsh Gupta <harsh.gupta-qxv4g6HH51o@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm7YdoiemnsNIQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On Wednesday 03 September 2014 09:07 PM, Gabriel FERNANDEZ wrote:
> SSC is the technique of modulating the operating frequency of a signal
> slightly to spread its radiated emissions over a range of frequencies.
> This reduction in the maximum emission for a given frequency helps meet
> radiated emission requirements.
> These settings are applicable for PCIE with Internal clock.
> 
> Signed-off-by: Harsh Gupta <harsh.gupta-qxv4g6HH51o@public.gmane.org>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm7YdoiemnsNIQ@public.gmane.org>
> ---
>  drivers/phy/phy-miphy28lp.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/phy/phy-miphy28lp.c b/drivers/phy/phy-miphy28lp.c
> index b36e737..976fdda 100644
> --- a/drivers/phy/phy-miphy28lp.c
> +++ b/drivers/phy/phy-miphy28lp.c
> @@ -679,6 +679,36 @@ static int miphy28lp_init_sata(struct miphy28lp_phy *miphy_phy)
>  	return miphy_is_ready(miphy_phy);
>  }
>  
> +static void miphy_pcie_tune_ssc(struct miphy28lp_phy *miphy_phy)
> +{
> +	u8 val;
> +
> +	/* Compensate Tx impedance to avoid out of range values */
> +	if (miphy_phy->ssc) {
> +		/*
> +		 * Enable the SSC on PLL for all banks
> +		 * SSC Modulation @ 31 KHz and 4000 ppm modulation amp
> +		 */
> +		val = readb_relaxed(miphy_phy->base + 0x0c);
> +		val |= 0x04;
> +		writeb_relaxed(val, miphy_phy->base + 0x0c);
> +		val = readb_relaxed(miphy_phy->base + 0x0a);
> +		val |= 0x10;
> +		writeb_relaxed(val, miphy_phy->base + 0x0a);

macros for these registers and values is needed. Or else it's difficult to review.
> +
> +		for (val = 0; val < 2; val++) {
> +			writeb_relaxed(val, miphy_phy->base + 0x0f);
> +			writeb_relaxed(0x69, miphy_phy->base + 0xe5);

Do these registers have to be written for every iteration?

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
