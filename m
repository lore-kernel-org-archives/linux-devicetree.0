From: "Hebbar, Gururaja" <gururaja.hebbar-l0cyMroinI0@public.gmane.org>
Subject: RE: [PATCH 1/2] rtc: omap: add option to indicate wakeup support
	through DT
Date: Tue, 4 Jun 2013 09:48:25 +0000
Message-ID: <1BAFE6F6C881BF42822005164F1491C33EC22315@DBDE04.ent.ti.com>
References: <1369982005-8572-1-git-send-email-gururaja.hebbar@ti.com>
	<1369982005-8572-2-git-send-email-gururaja.hebbar@ti.com>
	<87wqqf11nw.fsf@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <87wqqf11nw.fsf-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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

On Fri, May 31, 2013 at 23:18:03, Kevin Hilman wrote:
> Hebbar Gururaja <gururaja.hebbar-l0cyMroinI0@public.gmane.org> writes:
> 
> > Even though RTC-IP is wakeup capable, Not all Boards support it.
> >
> > For example
> > The rtc alarm wakeup is available in rtc-ip since omap1 days but alarm
> > was not wired properly in previous ompa1 boards.
> >
> > 	commit fa5b07820fe3a0fc06ac368516e71f10a59b9539
> > 	Author: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
> > 	Date:   Wed Oct 27 15:33:05 2010 -0700
> >
> > 	rtc: omap: let device wakeup capability be configured from chip
> > 	init logic
> >
> > 	The rtc-omap driver currently hardcodes the RTC wakeup
> > 	capability to be "not capable".  While this seems to be true for
> > 	existing OMAP1 boards which are not wired for this, the
> > 	DA850/OMAP-L138 SoC, the RTC can always be wake up source from
> > 	its "deep sleep" mode.
> >
> > Current rtc-omap driver expects the rtc module wake-up capabilities to
> > be set up by board specific code. However, in case of DT, this is not
> > possible.
> >
> > So, add a DT property "ti,wakeup_capable" to indicate that the module is
> > wake-up capable.
> 
> Why is this a TI-specific property?  

May be I am wrong but isn't this driver used only be TI SoC (Davinci, OMAP ...)

> 
> Also, I think we can do this without a new DT property.Did you see this
> patch from Tony which is already queued for v3.11:
> 
>     http://marc.info/?l=linux-omap&m=136917244530612&w=2

AFAIK, all boards that use twl rtc IP by default support rtc wakeup.

However, as mentioned in the commit message not all boards that uses
OMAP rtc IP supports rtc wake up (due to somoe wiring issue).
Hence I am adding a new DT property for this.

> 
> I think this is the right way to go.  Platforms that don't want/need
> wakeup support can disable it from userspace via:
> 
>     echo disabled > /sys/devices/.../power/wakeup

Hmmm. Debatable. Let me get some more info about this and come back

> 
> Kevin
> 
> 


Regards, 
Gururaja
