From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 1/2] watchdog: at91sam9_wdt: add device tree support
Date: Thu, 27 Sep 2012 19:19:34 +0200
Message-ID: <20120927171934.GS17667@game.jcrosoft.org>
References: <1348568704-28304-1-git-send-email-fabio.porcedda@gmail.com>
 <1348568704-28304-2-git-send-email-fabio.porcedda@gmail.com>
 <20120927055636.GP17667@game.jcrosoft.org>
 <CAHkwnC_R4DMaRfjQHO=+K1DO62-iH70B2_QsipLD5D4xRznouw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAHkwnC_R4DMaRfjQHO=+K1DO62-iH70B2_QsipLD5D4xRznouw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 16:59 Thu 27 Sep     , Fabio Porcedda wrote:
> On Thu, Sep 27, 2012 at 7:56 AM, Jean-Christophe PLAGNIOL-VILLARD
> <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:
> > On 12:25 Tue 25 Sep     , Fabio Porcedda wrote:
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
> >> index 0000000..5947929
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
> >> +- heartbeat: contains the watchdog heartbeats in seconds.
> > more I read this binding more it's seems wrong
> >
> > Today we do not use yet the watchdog framework which we will so we need to
> > use the same binding as the watchdog framework
> 
> What is the binding of the heartbeat value in the watchdog framework?
> I didn't found any binding of the heartbeat in other dt enabled drivers.
when you read the new watchdog framework cf watchdog_dev.c and watchdog_core.c

you will see that we can set a timeout which have the same meaning as
heartbeat

the key point here is you try to solve the DT the wrong way -> drivers
specific

the binding need to be framwork specific os here we need to do the binding of
the watchdog framework first and then use it in the at91sam9 driver evenif we
do not switch yet. Because in the DT we describe the hw not a drvier
implementation

Best Regards,
J.
