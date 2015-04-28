From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 0/2] Add support for PL172 memory-controller
Date: Tue, 28 Apr 2015 18:36:24 +0100
Message-ID: <20150428173623.GA1573@arm.com>
References: <1430241879-30046-1-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1430241879-30046-1-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Joachim,

On Tue, Apr 28, 2015 at 06:24:37PM +0100, Joachim Eastwood wrote:
> This patch set adds support for setting up static memory devices on
> a ARM PrimeCell MultiPort Memory Controller (PL172) from DT. Dynamic
> memory (SDRAM) is not supported in this patch set.
> 
> DT bindings for PL172 is based on the bindings for the TI AEMIF
> memory controller. PL172 can be found on a number of NXP devices
> like the LPC18xx family.
> 
> Tested on Embedded Artists' LPC4357 Developer's Kit with NOR Flash
> (SST39VF320) and 74LCV16374 (gpio-74x164) on MPMC.

Please excuse my ignorance here, but is this memory controller used to
manage the memory in use by the kernel? If so, how is it safe to reconfigure
it dynamically at runtime? If not, then it might be worth describing
some typical use-cases in the binding documentation to motivate the
existence of this driver.

Cheers,

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
