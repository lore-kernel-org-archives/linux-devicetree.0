From: Geoff Levand <geoff.levand-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5.5] of/fdt: export fdt blob as /sys/firmware/fdt
Date: Wed, 19 Nov 2014 10:32:51 -0800
Message-ID: <1416421971.23886.71.camel@smoke>
References: <1415984735-32388-1-git-send-email-ard.biesheuvel@linaro.org>
	 <20141118165145.4F6A8C40966@trevor.secretlab.ca>
	 <20141118172545.GC14323@leverpostej>
	 <20141118221103.4ECB3C40966@trevor.secretlab.ca>
	 <1416402576.29243.35.camel@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416402576.29243.35.camel-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ian Campbell <Ian.Campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ian,

On Wed, 2014-11-19 at 13:09 +0000, Ian Campbell wrote:
> On Tue, 2014-11-18 at 22:11 +0000, Grant Likely wrote:
> > > > * It also helps with exposing the reserved map to userspace, but kexec
> > > >   has done without that feature for years, and it is in the process of
> > > >   being deprecated in favour of /reserved-memory anyway.
> > > 
> > > This is the first I'd heard of the reserve map being deprecated, and
> > > we're going to have DTs with reserved map entries for a long time going
> > > forwards.
> > 
> > Deprecated, not removed or disabled. It will still work pretty much
> > forever, but users should be encouraged to move to the reserve-memory
> > tree.
> 
> I'm curious why that should be for the "OS should never touch this, here
> be dragons" type memory, what are the benefits of the new scheme in that
> case?

/memreserve/ device tree entries are not available in /proc/device-tree,
but reserved-memory nodes are.  Some solution is needed to get all
reserved memory info into the dtb passed to the second stage kernel
during a kexec re-boot.

-Geoff

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
