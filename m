From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/3] gpio: Add simple poweroff-gpio driver
Date: Wed, 21 Nov 2012 13:20:23 +0000
Message-ID: <20121121132023.3DB5F3E0A01@localhost>
References: <1352650891-18356-1-git-send-email-andrew@lunn.ch>
 <1352650891-18356-2-git-send-email-andrew@lunn.ch>
 <20121115180557.924713E197F@localhost>
 <alpine.DEB.2.00.1211151810050.25381@marmot.wormnet.eu>
 <CACxGe6tgNVH9zeafMRKXcRUZmQjQXrAy_QtvhxpTT74200Hnxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACxGe6tgNVH9zeafMRKXcRUZmQjQXrAy_QtvhxpTT74200Hnxg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, gmbnomis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 15 Nov 2012 18:21:20 +0000, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> On Thu, Nov 15, 2012 at 6:11 PM, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org> wrote:
> > On Thu, 15 Nov 2012, Grant Likely wrote:
> >
> >> On Sun, 11 Nov 2012 17:21:29 +0100, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:
> >>>
> >>> From: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
> >>>
> >>> Given appropriate devicetree bindings, this driver registers a
> >>> pm_power_off function to set a GPIO line high/low to power down
> >>> your board.
> >>>
> >>> Signed-off-by: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
> >>> Signed-off-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> >>> ---
> >>>  .../devicetree/bindings/gpio/gpio-poweroff.txt     |   22 ++++
> >>>  drivers/gpio/Kconfig                               |   10 ++
> >>>  drivers/gpio/Makefile                              |    2 +
> >>>  drivers/gpio/gpio-poweroff.c                       |  129
> >>> ++++++++++++++++++++
> >>
> >>
> >> This isn't a gpio controller driver. Don't put it into drivers/gpio
> >
> >
> > There's a v2 which puts it in drivers/power/reset/gpio-poweroff.c
> 
> Okay, thanks.
> 
> g.

So... I just read the power sequence proposal patch series which is
remarkably like a superset of what is needed here. Does it make sense to
use a power sequence for doing generic power off instead of this
interface?

g.

-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies, Ltd.
