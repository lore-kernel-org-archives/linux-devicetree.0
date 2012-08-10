From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 0/6] omap-am33xx rtc dt support
Date: Sat, 11 Aug 2012 01:27:11 +0530
Message-ID: <50256797.3020505@ti.com>
References: <cover.1343383616.git.afzal@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <cover.1343383616.git.afzal-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Afzal Mohammed <afzal-l0cyMroinI0@public.gmane.org>, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org
Cc: khilman-l0cyMroinI0@public.gmane.org, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 7/27/2012 5:53 PM, Afzal Mohammed wrote:
> Hi,
> 
> This series makes rtc-omap driver DT capable, adds AM33xx
> RTC DT support along with a few enchancments to the driver.
> 
> rtc-omap driver is made intelligent enough to handle kicker
> mechanism. This helps in removing kicker mechanism support
> done for DaVinci at platform level.
> 
> This has been tested on Beaglebone (AM33xx platform) and on
> DaVinci DA850 EVM.
> 
> This series is based over linux-omap master and can be
> directly applied over linux-next, except for
> [PATCH 6/6] arm/dts: am33xx rtc node.
> 
> PATCH 6/6 should go through linux-omap tree and needs
> http://www.mail-archive.com/linux-omap-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg71644.html
> (arm/dts: am33xx wdt node) to get applied cleanly

I tested patches 1-5 on AM18x EVM using rtcwake and hwclock commands.
Also tested on DT enabled AM18x EVM using hwclock.

For patched 1-5:

Acked-by: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>

Alessandro,

I assume you would want me to queue 2/6 through DaVinci tree. That patch
depends on 1/6 being accepted and merged by you. Let me know how you
want to move forward here.

Thanks,
Sekhar
