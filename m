From: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 3/3] mpc52xx/wdt: WDT uses GPT api
Date: Tue, 8 Dec 2009 21:48:54 +0100
Message-ID: <20091208204854.GE4291@infomag.iguana.be>
References: <fa686aa40911101159y7bef3f9bte74e9aeb5c6e864b@mail.gmail.com>
	<1257884778.14374.5@antares>
	<20091112213630.GE19336@infomag.iguana.be>
	<fa686aa40911122221s24efdcc9k1daf63b600e7b429@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fa686aa40911122221s24efdcc9k1daf63b600e7b429-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Linux PPC Development <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

Sorry for the delay, I need to deliver a project in a weeks time...

> In actual fact, it is a single device with multiple functions, some of
> which can be used at the same time.  The driver for the device
> determines what the device instance supports and registers the
> appropriate interfaces.  There is a GPIO controller, a PWM controller,
> a general purpose timer, and the watchdog.  Because of the
> multifunction nature of the device, there are subtle interactions
> between the functions that the driver needs to maintain.  I don't want
> to export functions from the driver which will only be used by a
> watchdog instance.  I also don't want the added code and complexity of
> a secondary probe path.  It is simpler and less code to roll all the
> behaviour up into the one driver single driver that gets probed once.
> 
> >From the maintenance perspective, having the main driver in
> arch/powerpc and the watchdog bit in drivers/watchdog doesn't really
> help much anyway because anything that changes the internal driver API
> (between the core and watchdog bits) will require cross-maintainer
> changes.  ie. do changes go through my tree because they touch
> arch/powerpc, or do they go through yours because they touch
> drivers/watchdog?  I'd much rather all the internal details be
> contained within a single driver.

Your argument about maintenance is the same one as I have: If all watchdog
driver pieces are under drivers/watchdog then it's easier for me to maintain
them. (Definitely if we are doing clean-up work and API changes).

> Besides, there is already precedence for very arch-specific drivers
> living under arch/*/.  find ./arch -name *gpio*

But in this case: I know where to find them and I will keep a mental note
about this one. And yes indeed some very arch specific drivers can reside
under arch/*/* .

So please go ahead with pulling this one in a single driver.

Kind regards,
Wim.
