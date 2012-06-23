From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH] mtd/m25p80: add device tree probe support
Date: Sat, 23 Jun 2012 04:15:18 +0200
Message-ID: <201206230415.18833.marex@denx.de>
References: <1311601063-16581-1-git-send-email-shawn.guo@linaro.org>
 <4E31B713.1030901@free.fr> <20110728214521.GA4674@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110728214521.GA4674-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
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
Cc: patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Artem Bityutskiy <artem.bityutskiy-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Grant Likely,

> On Thu, Jul 28, 2011 at 09:22:59PM +0200, manu wrote:
> > Dear Grant, Shawn,
> > I don't this patch is required as m25p** serial flashes are
> > supported already with generic OF/SPI and OF/MTD schemes.
> > I have successfully used it myself on an unmodified 2.6.36.3 vanilla
> > kernel on a xilinx/powerpc platform with a m25p32 part from STM.
> > You will find attached the corresponding working defconfig + dts
> > files (appart from partitions which I didn't managed to configure
> > properly...).
> > Best Regards,
> > 
> > Manuel
> 
> There is a heuristic which allows spi and i2c devices to get bound
> without a match table, which is why it works for you, but there is no
> guarantee that the heuristic will continue to exist in the long term.
> This is still probably the right thing to do.
> 
> g.

So is there any particular reason why this wasn't applied?

Best regards,
Marek Vasut
