From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH v6 3/5] watchdog: at91sam9_wdt: add device tree support
Date: Mon, 1 Oct 2012 14:56:43 +0200
Message-ID: <20121001125643.GF11837@lunn.ch>
References: <1349094281-28889-1-git-send-email-fabio.porcedda@gmail.com>
 <1349094281-28889-4-git-send-email-fabio.porcedda@gmail.com>
 <20121001124546.GE11837@lunn.ch>
 <CAHkwnC_u+bMX7REU5G3u=cm3VGmOUn+AShruw+ERkPJWtZpxUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAHkwnC_u+bMX7REU5G3u=cm3VGmOUn+AShruw+ERkPJWtZpxUg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 01, 2012 at 02:48:01PM +0200, Fabio Porcedda wrote:
> On Mon, Oct 1, 2012 at 2:45 PM, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:
> > On Mon, Oct 01, 2012 at 02:24:39PM +0200, Fabio Porcedda wrote:
> >> Tested on an at91sam9260 board (evk-pro3)
> >>
> >> Signed-off-by: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> ---
> >>  .../devicetree/bindings/watchdog/atmel-wdt.txt      | 19 +++++++++++++++++++
> >>  drivers/watchdog/at91sam9_wdt.c                     | 21 +++++++++++++++++++++
> >>  2 files changed, 40 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/watchdog/atmel-wdt.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/watchdog/atmel-wdt.txt b/Documentation/devicetree/bindings/watchdog/atmel-wdt.txt
> >> new file mode 100644
> >> index 0000000..65c1755
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/watchdog/atmel-wdt.txt
> >> @@ -0,0 +1,19 @@
> >> +* Atmel Watchdog Timers
> >> +
> >> +** at91sam9-wdt
> >> +
> >> +Required properties:
> >> +- compatible: must be "atmel,at91sam9260-wdt".
> >> +- reg: physical base address of the controller and length of memory mapped
> >> +  region.
> >> +
> >> +Optional properties:
> >> +- timeout: contains the watchdog timeout in seconds.
> >> +
> >> +Example:
> >> +
> >> +     watchdog@fffffd40 {
> >> +             compatible = "atmel,at91sam9260-wdt";
> >> +             reg = <0xfffffd40 0x10>;
> >> +             timeout = <10>;
> >> +     };
> >> diff --git a/drivers/watchdog/at91sam9_wdt.c b/drivers/watchdog/at91sam9_wdt.c
> >> index 05e1be8..c9e6bfa 100644
> >> --- a/drivers/watchdog/at91sam9_wdt.c
> >> +++ b/drivers/watchdog/at91sam9_wdt.c
> >> @@ -32,6 +32,7 @@
> >>  #include <linux/timer.h>
> >>  #include <linux/bitops.h>
> >>  #include <linux/uaccess.h>
> >> +#include <linux/of.h>
> >>
> >>  #include "at91sam9_wdt.h"
> >>
> >> @@ -254,6 +255,14 @@ static struct miscdevice at91wdt_miscdev = {
> >>       .fops           = &at91wdt_fops,
> >>  };
> >>
> >> +static inline void __init at91wdt_probe_dt(struct device_node *node)
> >> +{
> >> +     if (!node)
> >> +             return;
> >> +
> >> +     of_property_read_u32(node, "timeout", &heartbeat);
> >> +}
> >> +
> >
> > In patch #1 you add a function to do this, and then you don't make use
> > of it here ?
> >
> > Or am i missing something?
> 
> I'm using it on the patch #2 for the orion_wdt driver.
> Do you think it's better to join the #1 and the #2 patch?

It makes little sense doing this here, because you are going to have
to clean this up sometime very soon and use the helper, unless there
is a very good reason not to use the helper.

   Andrew
