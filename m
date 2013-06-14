From: "Hebbar, Gururaja" <gururaja.hebbar-l0cyMroinI0@public.gmane.org>
Subject: RE: [PATCH 2/2] rtc: omap: add rtc wakeup support to alarm events
Date: Fri, 14 Jun 2013 11:38:41 +0000
Message-ID: <1BAFE6F6C881BF42822005164F1491C33EC35C68@DBDE04.ent.ti.com>
References: <1369982005-8572-1-git-send-email-gururaja.hebbar@ti.com>
	<1369982005-8572-3-git-send-email-gururaja.hebbar@ti.com>
	<87a9nb2gjh.fsf@linaro.org>
	<1BAFE6F6C881BF42822005164F1491C33EC34679@DBDE04.ent.ti.com>
	<87k3lxabyg.fsf@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <87k3lxabyg.fsf-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org" <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, "davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org" <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org" <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org" <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 14, 2013 at 03:51:43, Kevin Hilman wrote:
> "Hebbar, Gururaja" <gururaja.hebbar-l0cyMroinI0@public.gmane.org> writes:
> 
> > Hi Kevin,
> >
> > On Mon, Jun 10, 2013 at 16:55:17, Hebbar, Gururaja wrote:
> >> On Fri, May 31, 2013 at 23:11:22, Kevin Hilman wrote:
> >> > Hebbar Gururaja <gururaja.hebbar-l0cyMroinI0@public.gmane.org> writes:
> >> > 
> >> > > On some platforms (like AM33xx), a special register (RTC_IRQWAKEEN)
> >> > > is available to enable Wakeup feature for Alarm Events.
> >> > >
> >> > > Since new platforms/Boards are now added through DT only, this feature
> >> > > is supported via DT property only.
> >> > 
> >> > > Platforms using such IP should add the property "ti,has_irq_wake_enb"
> >> > > in rtc DT node.
> >> > 
> >> > This is a property of the IP, not the board.  Can't you detect this
> >> > based on the revision of the IP?
> >> 
> >> Here is what I found out till now.
> >> 
> >> 1. rtc-omap driver is used by Davinci, OMAP-1/2 & AM33xx SoC.
> >> 
> >> 2. Only AM33xx soc rtc ip has revision register (& populated). Older OMAP
> >>    Or davinci doesn't have this register.
> >> 
> >> 3. AFAIK, this was the reason why Afzal used platform_device_id & 
> >>    of_device_id->data method to detect new versions (commit
> >>    9e0344dcc225fe1a0e8b8af9ff7df44ec4613580)
> >> 
> >> 
> >> So now either 
> >> a. I can follow the same method and add new member to omap_rtc_devtype & add a new compatible in 
> >>  omap_rtc_of_match in rtc-omap.c
> >> 
> >> or
> >> 
> >> b. use dt property to indicate existence of above property.
> >> 
> >> 
> >> Kindly let me know your opinion about the same.
> >
> > Any update on this. I have patch ready for both the choices. Waiting for your ok to send
> 
> I think (a) is better.

Ok. I will add the property using a new DT compatibility.


> 
> The driver should always do a device_init_wakeup(dev, true), *except*
> for devtypes that don't have this feature.

"wakeup capable" and "irq-wake-enable-for-alarm-event" are different

For "irq-wake-enable-for-alarm-event", I will add a new DT compability.

However, wakeup capable notification is done in another patch using the a 
DT property "ti,wakeup_capable".

The reason for using a dt property is specified below


	commit fa5b07820fe3a0fc06ac368516e71f10a59b9539
	Author: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
	Date:   Wed Oct 27 15:33:05 2010 -0700

	rtc: omap: let device wakeup capability be configured from chip
	init logic

	The rtc-omap driver currently hardcodes the RTC wakeup
	capability to be "not capable".  While this seems to be true for
	existing OMAP1 boards which are not wired for this, the
	DA850/OMAP-L138 SoC, the RTC can always be wake up source from
	its "deep sleep" mode.


So I cannot directly add device_init_wakeup(dev, true), inside driver code.
So, I added a DT property




> 
> Kevin
> 
> 


Regards, 
Gururaja
