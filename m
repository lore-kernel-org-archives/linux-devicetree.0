From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] arm64/dts: Add missing DMA Abort interrupt to Juno
Date: Thu, 07 Jan 2016 15:36:43 +0100
Message-ID: <2736927.0LiVxGZzgm@wuerfel>
References: <6a66d2ac442925e066fe9b67ee2883de5894b0d3.1452168063.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6a66d2ac442925e066fe9b67ee2883de5894b0d3.1452168063.git.robin.murphy-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 07 January 2016 12:01:59 Robin Murphy wrote:
> The DMA-330 has an "irq_abort" interrupt line on which it signals faults
> separately from the "irq[n:0]" channel interrupts. On Juno, this is
> wired up to SPI 92; add it to the DT so that DMAC faults are correctly
> reported for the driver to reset the thing, rather than leaving it
> locked up and waiting to time out.
> 
> CC: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
> CC: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> CC: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
> 

Nothing wrong with the patch, but could you please come up with
a more structured way to get patches for Juno into the kernel?

You have addressed the patch "to:" the arm-soc maintainers, but
you are not listed in the maintainers file for the directory, so
it's not clear what you expect to happen here.

Ideally, we'd get patches from just one of the people listed
in the MAINTAINERS file normally, and let us know if the
primary maintainer changes, or if one of the others sends a
patch because that person is unavailable.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
