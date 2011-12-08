From: "Nori, Sekhar" <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: RE: [PATCH] arm,davinci: configure davinci aemif chipselects
	through OF
Date: Thu, 8 Dec 2011 08:19:12 +0000
Message-ID: <DF0F476B391FA8409C78302C7BA518B6040A03@DBDE01.ent.ti.com>
References: <1322991679-20947-1-git-send-email-hs@denx.de>
	<DF0F476B391FA8409C78302C7BA518B603EFB2@DBDE01.ent.ti.com>
	<4EE06B79.7070804@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <4EE06B79.7070804-ynQEQJNshbs@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: "hs-ynQEQJNshbs@public.gmane.org" <hs-ynQEQJNshbs@public.gmane.org>
Cc: "davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org" <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 08, 2011 at 13:17:05, Heiko Schocher wrote:

> >> diff --git a/Documentation/devicetree/bindings/arm/davinci/aemif.txt b/Documentation/devicetree/bindings/arm/davinci/aemif.txt
> >> new file mode 100644
> >> index 0000000..c9ed551
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/arm/davinci/aemif.txt
> >> @@ -0,0 +1,85 @@
> >> +* Texas Instruments Davinci AEMIF
> >> +
> >> +This file provides information, what the device node for the
> >> +davinci aemifa interface contain.
> >            ^^^^^^
> >            aemif
> 
> fixed, thanks.
> 
> >> +
> >> +Required properties:
> >> +- compatible: "ti,davinci-emifa";
> 
> Shouldn't this also be "ti,davinci-aemif" ?

Yes, makes sense.

> 
> [...]
> >> diff --git a/arch/arm/mach-davinci/aemif.c b/arch/arm/mach-davinci/aemif.c
> >> index 1ce70a9..12c559f 100644
> >> --- a/arch/arm/mach-davinci/aemif.c
> >> +++ b/arch/arm/mach-davinci/aemif.c
> >> @@ -13,12 +13,14 @@
> >>  #include <linux/err.h>
> >>  #include <linux/clk.h>
> >>  #include <linux/module.h>
> >> +#include <linux/of.h>
> >> +#include <linux/of_address.h>
> >>  #include <linux/time.h>
> >>  
> >>  #include <mach/aemif.h>
> >>  
> >>  /* Timing value configuration */
> >> -
> >> +#define ASIZE(x)	(x)
> >>  #define TA(x)		((x) << 2)
> >>  #define RHOLD(x)	((x) << 4)
> >>  #define RSTROBE(x)	((x) << 7)
> >> @@ -26,7 +28,10 @@
> >>  #define WHOLD(x)	((x) << 17)
> >>  #define WSTROBE(x)	((x) << 20)
> >>  #define WSETUP(x)	((x) << 26)
> >> +#define EW(x)		((x) << 30)
> >> +#define SS(x)		((x) << 31)
> > 
> > You are adding support for additional configuration
> > parameters which should be done in a separate patch.
> 
> Hmm.. they are only used in the OF case ... is this split
> really needed?

But they should also be useful in the non-OF case, no?
Why restrict their usage to the OF case?

Thanks,
Sekhar
