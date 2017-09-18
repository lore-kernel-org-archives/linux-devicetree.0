From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: foundation-v8: Enable PSCI mode
Date: Mon, 18 Sep 2017 17:12:48 +0100
Message-ID: <20170918161248.GB5106@leverpostej>
References: <20170918153832.16356-1-daniel.thompson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170918153832.16356-1-daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On Mon, Sep 18, 2017 at 04:38:32PM +0100, Daniel Thompson wrote:
> Currently if the Foundation model is running ARM Trusted Firmware then
> the kernel, which is configured to use spin tables, cannot start secondary
> processors or "power off" the simulation.
> 
> Add a couple of labels to the include file, and introduce a new .dts
> file that uses these to override the enable-method.
> 
> Signed-off-by: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

This looks good, but has the unfortunate effect of leaving the
(irrelevant) cpu-release-addr property in the PSCI dts files, as that's
in the underlying dtsi file.

Could we split spin-table / PSCI parts into separate dtsi files?

e.g. have:

* foundation-v8.dtsi
* foundation-v8-gicv{2,3}.dtsi
* foundation-v8-{psci,spin-table}.dtsi

... and then combine those to build the dts files we want.

FWIW, with that:

Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
