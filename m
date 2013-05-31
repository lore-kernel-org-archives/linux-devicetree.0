From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: at91: dt: add header to define at_hdmac
 configuration
Date: Fri, 31 May 2013 23:30:29 +0200
Message-ID: <201305312330.29364.arnd@arndb.de>
References: <1369930103-11963-1-git-send-email-ludovic.desroches@atmel.com>
 <1369930103-11963-2-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1369930103-11963-2-git-send-email-ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 30 May 2013, ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org wrote:
> +/*
> + * Source and/or destination peripheral ID
> + */
> +#define AT91_DMA_CFG_PER_ID_MASK       (0xff)
> +#define AT91_DMA_CFG_PER_ID(id)                (id & AT91_DMA_CFG_PER_ID_MASK)
> +

I'm a little worried about macros like this one spreading in the name
of readability, and I don't see this as actual value-add here:

The output of the macro is always the same as the input, and passing
an invalid number still results in an invalid output and no error message,
it actually prevents us from warning about the mistake at run-time.

The other macros are fine.

	Arnd
