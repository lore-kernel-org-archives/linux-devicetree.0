From: Alexander Clouter <alex-L4GPcECwBoDe9xe1eoZjHA@public.gmane.org>
Subject: Re: plat-nand DT support
Date: Thu, 7 Mar 2013 21:15:08 +0000
Message-ID: <20130307211508.GP1976@edkhil>
References: <20130303155226.GA1976@edkhil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130303155226.GA1976@edkhil>
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
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: hsweeten-3FF4nKcrg1dE2c76skzGb0EOCMrvLtNR@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Any comments...anyone?

On Sun, Mar 03, 2013 at 03:52:26PM +0000, Alexander Clouter wrote:
>
>I have been busy porting an ARM board (that uses plat_nand) to 
>devicetree and stumbled on John Crispin's patch from last year[1].  
>There was not much online about how to use it, so I went about 
>building upon his work it what seemed to be natural and a good fit.
>
>Attached is the work I have done to the driver its-self (including 
>the much needed bindings documentation), whilst on my github page I 
>have put up an example of its usage:
>
>https://github.com/jimdigriz/ts78xx/blob/gen-nand-dt/arch/arm/mach-orion5x/board-ts7800.c
>https://github.com/jimdigriz/ts78xx/blob/gen-nand-dt/arch/arm/boot/dts/orion5x-ts7800.dts
>
>Am I going in the right direction here?  plat_nand, by its nature, is 
>not very DT, the alternative would be a custom driver for my 
>platform[2] but then are we not just littering drivers/mtd/nand 
>rather than arch/arm/mach-foobar?
>
>Cheers
>
>[1] http://lists.infradead.org/pipermail/linux-mtd/2012-April/041025.html
>[2] could also support the NAND used by arch/arm/mach-ep93xx/ts72xx.c 
>	but the whole SoC has not been ported to DT

-- 
Alexander Clouter
.sigmonster says: The ends justify the means.
                   		-- after Matthew Prior
