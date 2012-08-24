From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: RFC: New release for DTC?
Date: Fri, 24 Aug 2012 11:36:25 +1000
Message-ID: <20120824013625.GA8067@truffula.fritz.box>
References: <201208232015.39613.yann.morin.1998@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201208232015.39613.yann.morin.1998-GANU6spQydw@public.gmane.org>
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
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 23, 2012 at 08:15:39PM +0200, Yann E. MORIN wrote:
> Hello All!
> 
> Following advice from Jon Loeliger, I would suggest that a new release
> of DTC be tagged and packaged.
> 
> It is important for some projects to rely on a released version, rather
> than use a random cset from the repository. Comes to mind, the automated
> build-systems, such as buildroot.
> 
> Of course, I can help, if need be! ;-)
> 
> Are there any others who think that a release would make sense?

This has been a bit of a perrenial problem.  dtc development has been
sufficiently gradual that there haven't been many obvious points for
making new releases.  dtc developers (i.e. Jon and my, mostly) don't
feel much pain from the lack of releases, since the git snapshots
generally work well (thanks to limited scope and a good testsuite).

I wonder if we should move to a model of just making a release every 3
or 6 months from whatever happens to be in the tree at the time
(barring obvious known breakage, of course).

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
