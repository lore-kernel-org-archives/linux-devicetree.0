From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v5] bus: uniphier-system-bus: add UniPhier System Bus
 driver
Date: Tue, 22 Dec 2015 11:22:52 -0800
Message-ID: <20151222192252.GO30172@localhost>
References: <1449643979-27329-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449643979-27329-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 09, 2015 at 03:52:59PM +0900, Masahiro Yamada wrote:
> The UniPhier System Bus is an external bus that connects on-board
> devices to the UniPhier SoC.  Each bank (chip select) is dynamically
> mapped to the CPU-viewed address base via the bus controller.  The
> bus controller must be configured before any access to the bus.
> 
> This driver parses the "ranges" property of the System Bus node and
> initialized the bus controller.  After the bus becomes ready, devices
> below it are populated.
> 
> Note:
> Each bank can be mapped anywhere in the supported address space;
> there is nothing preventing us from assigning bank 0 on 0x42000000,
> 0x43000000, or anywhere as long as such region is not used by others.
> So, the "ranges" is just one possible software configuration, which
> does not seem to fit in device tree because device tree is a hardware
> description language.  However, of_translate_address() requires
> "ranges" in every bus node between CPUs and device mapped on the CPU
> address space.  In other words, "ranges" properties must be statically
> defined in device tree.  After some discussion, I decided the dynamic
> address reassignment by the driver is too bothersome.  Instead, the
> device tree should provide a reasonable translation setup that the OS
> can rely on.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

Thanks, applied to next/drivers.


-Olof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
