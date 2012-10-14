From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: dtc: import latest upstream dtc
Date: Sun, 14 Oct 2012 10:16:41 +1000
Message-ID: <20121014001641.GI4640@truffula.fritz.box>
References: <1349827466.26044.16@snotra> <50759105.2000406@wwwdotorg.org>
 <1349885393.21493.2@snotra> <5075A0AA.2000605@wwwdotorg.org>
 <20121010231835.GH28467@truffula.fritz.box>
 <5078525B.9030008@wwwdotorg.org>
 <20121013062453.GH4640@truffula.fritz.box>
 <3C5DD611-6F36-4D13-9A88-377A8E30AAA5@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3C5DD611-6F36-4D13-9A88-377A8E30AAA5-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
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
To: Segher Boessenkool <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Oct 13, 2012 at 03:42:35PM +0200, Segher Boessenkool wrote:
> >Oh, that's strange.  I'm pretty sure I've used -x assembler when I've
> >experimented with using cpp on dts manually before, and it seems to
> >have worked.
> 
> Maybe you used "-x assembler-with-cpp"?  That should work better ;-)
> Or just use the "-traditional-cpp" option, i.e. "gcc -E
> -traditional-cpp".

Ah, yes, assembler-with-cpp, that's the one I used.

> >  Note that IIRC with gcc cpp, -x assembler also means
> >that # won't be handled as a cpp directive except in column 0 which is
> >also an advantage for us, although no longer essential with your
> >escaping support.  Not all cpps have an equivalent option, though.
> 
> This is how the traditional C pre-processor behaves.  I don't think
> this is exactly what matters for DTS, or does it ever happen that
> you have a # preceded only by whitespace?

Uh.. pretty much whenever you define a #address-cells or #size-cells
property.  At least until Stephen's patch to allow escaping that.

>  The # and ## stringification
> and token pasting ops will of course bite you with the ISO C pre-processor,
> indeed.
> 
> 
> Segher
> 

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
