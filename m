From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH v3 1/2] watchdog: at91sam9_wdt: add device tree support
Date: Tue, 25 Sep 2012 12:49:01 +0200
Message-ID: <20120925104901.GI17667@game.jcrosoft.org>
References: <1348558114-31750-1-git-send-email-fabio.porcedda@gmail.com>
 <1348558114-31750-2-git-send-email-fabio.porcedda@gmail.com>
 <20120925081057.GH17667@game.jcrosoft.org>
 <CAHkwnC_=i7mEv99xU6HcFpEfC6eeumcZDWrBq2_qdv=rDf3E1g@mail.gmail.com>
 <506180BE.6000603@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <506180BE.6000603@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: linux-watchdog@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Wim Van Sebroeck <wim@iguana.be>, Fabio Porcedda <fabio.porcedda@gmail.com>, Andrew Victor <linux@maxim.org.za>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 12:00 Tue 25 Sep     , Nicolas Ferre wrote:
> On 09/25/2012 11:45 AM, Fabio Porcedda :
> > On Tue, Sep 25, 2012 at 10:10 AM, Jean-Christophe PLAGNIOL-VILLARD
> > <plagnioj@jcrosoft.com> wrote:
> >> On 09:28 Tue 25 Sep     , Fabio Porcedda wrote:
> >>> Tested on an at91sam9260 board (evk-pro3)
> >>>
> >>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> >>> ---
> >>>  .../devicetree/bindings/watchdog/atmel-wdt.txt      | 19 +++++++++++++++++++
> >>>  drivers/watchdog/at91sam9_wdt.c                     | 21 +++++++++++++++++++++
> >>>  2 files changed, 40 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/watchdog/atmel-wdt.txt
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/watchdog/atmel-wdt.txt b/Documentation/devicetree/bindings/watchdog/atmel-wdt.txt
> >>> new file mode 100644
> >>> index 0000000..724fad1
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/watchdog/atmel-wdt.txt
> >>> @@ -0,0 +1,19 @@
> >>> +* Atmel Watchdog Timers
> >>> +
> >>> +** at91sam9-wdt
> >>> +
> >>> +Required properties:
> >>> +- compatible: must be "atmel,at91sam9-wdt".
> >>> +- reg: physical base address of the controller and length of memory mapped
> >>> +  region.
> >>> +
> >>> +Optional properties:
> >>> +- heartbeat: contains the watchdog heartbeats in seconds.
> >>> +
> >>> +Example:
> >>> +
> >>> +     watchdog@fffffd40 {
> >>> +             compatible = "atmel,at91sam9-wdt";
> >> for the secind time atmel,at91sam9260-watchdog
> > 
> > Ok, i will fix this.
> > 
> >> you need to put the first soc that use it in the compatible
> >>> +             reg = <0xfffffd40 0x10>;
> >>> +             heartbeat = <10>;
> >> need put second in the property name so need to read the doc
> > 
> > I didn't found any example about a property with "second" in the name.
> > Which It's best "heartbeat-seconds", "heartbeat-sec" or "heartbeat-s" ?
> 
> I think that, as it is indicated in the documentation, we should not
> worry too much about that... but "heartbeat" and "heartbeat-s" is ok
> with me.
> 
> Maybe people @ devicetree-discuss have an advice for this?
for i2c-gpio mandatory as example cf discussion with Jean and Russell

Best Regards,
J.
