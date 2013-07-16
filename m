From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 00/10] Orion Watchdog fixes
Date: Tue, 16 Jul 2013 10:29:30 -0400
Message-ID: <20130716142930.GF12062@titan.lakedaemon.net>
References: <1373931163-12670-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130716065952.GA25043@lunn.ch> <20130716092059.237ea729@skate>
 <20130716073101.GB25043@lunn.ch> <20130716121432.GA2317@localhost>
 <20130716134422.GE12062@titan.lakedaemon.net>
 <20130716140435.GA23904@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130716140435.GA23904@localhost>
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
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 16, 2013 at 11:04:36AM -0300, Ezequiel Garcia wrote:
> On Tue, Jul 16, 2013 at 09:44:22AM -0400, Jason Cooper wrote:
> > On Tue, Jul 16, 2013 at 09:14:33AM -0300, Ezequiel Garcia wrote:
> > > On the other side, I'm much interested in knowing if you are OK with
> > > breaking the watchdog DT compatibility. If you NACK this, then I'll
> > > start preparing a different watchdog driver for 370/XP, since I don't
> > > want to extend a driver that is a bit dirty.
> > 
> > Apparently there is some agreement that the bindings are still in flux
> > and that they need to be for a bit longer in order to hammer out
> > problems such as this.
> > 
> > Arnd and Olof both mentioned that something (a doc, and email?) is
> > forthcoming about marking some bindings as stable.  Whatever form that
> > takes, this one wouldn't get the stable marking yet. ;-)
> > 
> 
> Yup, that's my understanding as well. But on the other side, I don't
> want to break possible users out there.

I agree, but living with a sub-standard binding is worse imho.

> So, just to check, you say it's early enough to safely do such change?

Well, it's not *safe*.  But most consumers on mainline kernels are
currently developer/hackers/distro maintainers.  eg, folks who can
handle it.  It's better to do it now.

> In that case, I'll extend this patchset to include Armada 370/XP support
> and post it as soon as Sebastian's clocksource stuff gets in.

Cool.

thx,

Jason.
