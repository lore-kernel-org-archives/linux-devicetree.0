From: Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 0/2 v5] arm: kirkwood: add dreamplug/devicetree support
Date: Mon, 27 Feb 2012 09:57:24 -0500
Message-ID: <20120227145724.GU23524@titan.lakedaemon.net>
References: <cover.1312906908.git.jason@lakedaemon.net>
 <cover.1330025976.git.jason@lakedaemon.net>
 <1330254038.10008.24.camel@dagon.hellion.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1330254038.10008.24.camel-ztPmHsLffjjnO4AKDKe2m+kiAK3p4hvP@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Feb 26, 2012 at 11:00:38AM +0000, Ian Campbell wrote:
> On Thu, 2012-02-23 at 19:52 +0000, Jason Cooper wrote:
> > This patch series provides initial support for devicetree on kirkwood for the
> > dreamplug platform.  After discussing the approach with Arnd Bergman last week
> > at ELC, we decided to take an incremental approach to the conversion.  First, I
> > would detect that we were on the dreamplug via the devicetree blob.  Then,
> > configure uart0 via devicetree.  We chose the uart since it is already well
> > supported under devicetree.
> > 
> > This patch series has been boot-tested on the dreamplug.
> 
> Tested-by: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>

thanks!

> I needed the following (obvious) patch against u-boot:

yes, I forgot to mention that.  By any chance, have you tested booting
non-fdt kernels from u-boot with this option enabled?  I'm fairly sure
it will work, but I haven't tested it myself.

If you can boot both fdt and non-fdt kernels with this enabled, submit
it to u-boot, CC: Prafulla, and I'll ack it.

thx,

Jason.

> diff --git a/include/configs/dreamplug.h b/include/configs/dreamplug.h
> index 0f2f9a2..76f9eea 100644
> --- a/include/configs/dreamplug.h
> +++ b/include/configs/dreamplug.h
> @@ -148,4 +148,6 @@
>   */
>  #define CONFIG_DISPLAY_CPUINFO
>  
> +#define CONFIG_OF_LIBFDT
> +
>  #endif /* _CONFIG_DREAMPLUG_H */
> 
> 
> Ian.
> 
> 
