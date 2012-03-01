From: Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 0/4] ARM: kirkwood: fdt: convert kirkwood init funcs to fdt
Date: Thu, 1 Mar 2012 15:01:36 -0500
Message-ID: <20120301200136.GA11986@titan.lakedaemon.net>
References: <cover.1330625877.git.jason@lakedaemon.net>
 <201203011950.51210.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201203011950.51210.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 01, 2012 at 07:50:51PM +0000, Arnd Bergmann wrote:
> On Thursday 01 March 2012, Jason Cooper wrote:
> > This series begins the process of converting all of the drivers initialized
> > from kirkwood_init() to devicetree.
> > 
> > The first patch cleans up kirkwood_init() by moving a flag setting to it's
> > appropriate location.  This will help later when converting the audio driver.
> > 
> > Next, I pull the functionality of kirkwood_init() into kirkwood_dt_init() in
> > board-dt.c  This way, as drivers are converted, their init calls can be removed
> > from kirkwood_dt_init() and non-fdt users won't be affected (they call
> > kirkwood_init()).
> > 
> > Last, I converted the two easiest drivers, rtc and wdt.  The xor and crypto
> > drivers remain for a later patch series.
> 
> Hi Jason,
> 
> Nice patch series! I've commented on a few details that need improving, but
> it seems you're making good progress overall. Note that in other platforms,
> we typically focus on converting all the devices outside of the soc first,
> because that lets us get away from board files faster, but there is nothing
> wrong in principle in converting the devices on the soc as well.

Thanks for the feedback.  I'll redo this series and resubmit.  Did you
catch my patch from yesterday?

[PATCH v3] ARM: kirkwood: covert orion-spi to fdt. [1]

thx,

Jason.

[1] http://www.spinics.net/lists/arm-kernel/msg161975.html
> 
> 	Arnd
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
