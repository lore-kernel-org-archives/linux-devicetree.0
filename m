From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH] ARM: sa1100: refactor sa1100 serial driver
Date: Mon, 21 Nov 2011 14:43:33 +0000
Message-ID: <20111121144333.GA25627@totoro>
References: <1321821127-32231-1-git-send-email-jochen@scram.de>
 <1321822068.17619.3.camel@Joe-Laptop> <4ECA6235.4030108@scram.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4ECA6235.4030108-NIgtFMG+Po8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jochen Friedrich <jochen-NIgtFMG+Po8@public.gmane.org>
Cc: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 21, 2011 at 03:37:41PM +0100, Jochen Friedrich wrote:
> Hi Joe,
> 
> >trivia:
> >
> >>diff --git a/arch/arm/mach-sa1100/generic.c b/arch/arm/mach-sa1100/generic.c
> >[]
> >>@@ -166,7 +166,7 @@ static struct platform_device sa11x0udc_device = {
> >>  static struct resource sa11x0uart1_resources[] = {
> >>  	[0] = {
> >>  		.start	= __PREG(Ser1UTCR0),
> >>-		.end	= __PREG(Ser1UTCR0) + 0xffff,
> >>+		.end	= __PREG(Ser1UTCR0) + 0x24,
> >
> >#define for 0x24? or is it really 0x23?
> >(start + size - 1)
> 
> Thanks, I'll fix this.

It may even be worth looking at the DEFINE_RES_MEM() type macros in 
include/linux/ioport.h, but I'm not sure that's essential!

Jamie
