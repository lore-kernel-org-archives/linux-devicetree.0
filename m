From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko.stuebner-K3U4GQvHnyU@public.gmane.org>
Subject: Re: [PATCH v10 5/7] arm: add basic support for Mediatek MT6589 boards
Date: Fri, 18 Jul 2014 12:47:53 +0200
Message-ID: <127793649.dTvqVjg5LM@diego>
References: <1404745988-32558-1-git-send-email-matthias.bgg@gmail.com> <1404745988-32558-6-git-send-email-matthias.bgg@gmail.com> <53C8ED0B.5080802@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53C8ED0B.5080802-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, florian.vaussard-p8DiymsW2f8@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, silvio.fricke-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, anders.berg-M7mHMAq9Yzo@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.orgd
List-Id: devicetree@vger.kernel.org

Hi Daniel,

Am Freitag, 18. Juli 2014, 11:46:51 schrieb Daniel Lezcano:
> On 07/07/2014 05:13 PM, Matthias Brugger wrote:
> > This adds a generic devicetree board file and a dtsi for boards
> > based on MT6589 SoCs from Mediatek.
> > 
> > Apart from the generic parts (gic, clocks) the only component
> > currently supported are the timers.
> > 
> > Signed-off-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > --
> 
> I will take this patchset through my tree but this patch touches an area
> I am not handling.
> 
> Olof, Arnd, do you mind to ack this patch ?

wouldn't it be easier to just take patches 1,2,3,4 through your tree and let 
patches 5,6,7 go through arm-soc?

There is no compile-time dependency between the two parts, so they will come 
together nicely in linux-next and during the merge-window.


Also in [0] Olof wrote:

----------
Traditionally we usually take the DT changes through arm-soc, but as
long as we share the branch we might be ok. We tend to stick them in
different branches in our tree though, so rockchip will be a little
mis-sorted this release. Not a big deal, and we can deal with it.
-----------

So I'd assume splitting the patchset this way might be a nice solution?


Heiko


[0] http://www.spinics.net/lists/arm-kernel/msg347053.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
