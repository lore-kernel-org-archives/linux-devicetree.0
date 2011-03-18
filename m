From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: RFC: Platform data for onboard USB assets
Date: Fri, 18 Mar 2011 15:36:36 -0600
Message-ID: <AANLkTinjMH4rvSaUaV0LhnWy1oF4xumTCLN=-srYmfdK@mail.gmail.com>
References: <20110311165642.GA9996@kroah.com> <201103181600.09877.arnd@arndb.de>
 <4D839BCD.6030202@linaro.org> <201103182106.13888.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201103182106.13888.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 18, 2011 at 2:06 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> No, that is not the plan. The platform data is well-established
> for deeply embedded systems (blackfin, arm-nommu, mips32, ...) where you
> never want to build a kernel for multiple boards anyway. We also
> have ways to generate platform_data from the device tree properties
> to allow the same driver to be used by systems with or without
> full device trees, and we have the fragments I mentioned that work
> in the opposite way.

Not actually true.  We have drivers that can use both platform_data
and device tree data, and for platform devices the resource table is
automatically populated with irqs and register ranges, but
platform_data is driver specific which prevents any automatic
translation.

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
