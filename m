From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V3 2/3] clocksource: mmp: support CLOCKSOURCE OF DECLARE
Date: Tue, 9 Jul 2013 23:16:20 +0200
Message-ID: <201307092316.20905.arnd@arndb.de>
References: <1373352166-10064-1-git-send-email-zhangwm@marvell.com>
 <1373352166-10064-3-git-send-email-zhangwm@marvell.com>
 <20130709181434.76f6216d@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130709181434.76f6216d@skate>
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
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Neil Zhang <zhangwm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 09 July 2013, Thomas Petazzoni wrote:
> Dear Neil Zhang,
> 
> On Tue, 9 Jul 2013 14:42:45 +0800, Neil Zhang wrote:
> > support CLOCKSOURCE OF DECLARE for mmp timer.
> > 
> > Signed-off-by: Neil Zhang <zhangwm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > ---
> >  arch/arm/mach-mmp/mmp-dt.c  |    5 ++---
> >  arch/arm/mach-mmp/mmp2-dt.c |    3 +--
> >  arch/arm/mach-mmp/time.c    |   15 ++-------------
> >  3 files changed, 5 insertions(+), 18 deletions(-)
> 
> Maybe it would be good to take this opportunity to move
> arch/arm/mach-mmp/time.c into drivers/clocksource/.

+1

Or we might want to have a more coordinated move of all clocksource
drivers in arch/arm to drivers/clocksource now, as we have done for some
other subsystems.

	Arnd
