From: Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org>
Subject: Re: [PATCH] brcmfmac: add support for external 32khz clock
Date: Mon, 6 Nov 2017 22:27:29 +1100
Message-ID: <20171106112726.GA25134@lineageos.org>
References: <20171104132421.GA1541@archbox.home>
 <5A004099.90200@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5A004099.90200-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arend van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, brcm80211-dev-list.pdl-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, brcm80211-dev-list-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Franky Lin <franky.lin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Hante Meuleman <hante.meuleman-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Chi-Hsien Lin <chi-hsien.lin-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Wright Feng <wright.feng-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 06, 2017 at 11:59:37AM +0100, Arend van Spriel wrote:
> On 11/4/2017 2:24 PM, Simon Shields wrote:
> > Some boards use an external 32khz clock for low-power
> > mode timing. Make sure the clock is powered on while the chipset
> > is active.
> 
> Do you have such a board? With the little documentation I can get my hands
> on here I wonder whether the clock needs to be enabled before the device is
> powered. If you have the hardware I would like to check some registers in
> the device.
> 

Yes. Trats2 (exynos4412-based) has such a setup. The BCM4334 works fine
with this patch and one more that enables the WL_REG_EN pin when
brcmfmac is probed.

Without this patch (and only enabling WL_REG_EN), the chip is detected but
attempting to initialise it fails with a bunch of timeouts.

> Regards,
> Arend

Cheers,
Simon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
