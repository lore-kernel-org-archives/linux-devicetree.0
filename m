From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/10] Orion Watchdog fixes
Date: Tue, 16 Jul 2013 09:48:56 +0200
Message-ID: <13fe673f255.2784.107cef0f820c2f5d7b7f41463071c310@gmail.com>
References: <1373931163-12670-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130716065952.GA25043@lunn.ch> <20130716092059.237ea729@skate>
 <20130716073101.GB25043@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130716073101.GB25043-g2DYL2Zd6BY@public.gmane.org>
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
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Andrew, Thomas,

In the discussion about orion clocksource Russell was proposing a generic 
thread-safe write. That puts a single lock around all those writes. Of 
course, it will also blocked by totally unrelated thread-safe register 
accesses but should prevent us from having dozens of locks and solves the 
symbol issue.

Sebastian



On July 16, 2013 9:31:01 AM Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:
> On Tue, Jul 16, 2013 at 09:20:59AM +0200, Thomas Petazzoni wrote:
> > Dear Andrew Lunn,
> > On Tue, 16 Jul 2013 08:59:52 +0200, Andrew Lunn wrote:
> > > Maybe i'm missing something here. You are making use of
> > > orion_timer_ctrl_clrset() from time-orion.c. How will this work on
> > > 370/XP which has a different clocksource driver?
> > I *think* the idea is that the Armada 370/XP driver will expose the
> > same function, so from the point of view of the watchdog driver, it
> > will just work.
>
> Hi Thomas
>
> That was what i was thinking would happen. And then i started to
> wonder how well the kernel linker deals with multiple definitions of
> the same symbol. Dove and 370/XP can end up in the same kernel. So we
> need to have both orion-timer and the 370/XP timer in the same kernel,
> so we end up with the same symbol in the kernel twice...
>
> Lets wait for Ezequiel to answer.
>
>    Andrew
