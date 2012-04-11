From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V3 1/5] ARM: kirkwood: Basic support for DNS-320 and
 DNS-325
Date: Wed, 11 Apr 2012 15:08:45 +0000
Message-ID: <201204111508.46143.arnd@arndb.de>
References: <1332885255-8304-1-git-send-email-jm@lentin.co.uk>
 <op.wclrwkqi4cuzmg@gonzo.lentin.co.uk>
 <20120411141118.GG14790@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120411141118.GG14790-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 11 April 2012, Jason Cooper wrote:
> > Thinking about it, MACH_DNSKW_DT would probably be best. Anything
> > more general, e.g. MACH_DLINK_DNS_DT, would also cover the
> > orion-based DNS-313/323/343. Presumably there will always be
> > differences between kirkwood and orion5x?
> 
> Hmm, Well, I think I would prefer MACH_DLINK_KIRKWOOD_DT,
> MACH_DLINK_ORION5X_DT.  This way, all the dtb's for a given manf/SoC are
> built in one go, and the correct board-dt file is built as well.
> 
> So, in my case, I would do MACH_GLOBALSCALE_KIRKWOOD_DT, and
> MACH_GLOBALSCALE_ARMADA_DT.
> 
> Grant, Arnd, sound sensible?

I think it's fine, I just don't spend too much time on the naming
when the goal is to eventually just have one config option for
all manufacturers.

	Arnd
