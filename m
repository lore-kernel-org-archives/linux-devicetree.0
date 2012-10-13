From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: dtc: import latest upstream dtc
Date: Sat, 13 Oct 2012 16:24:53 +1000
Message-ID: <20121013062453.GH4640@truffula.fritz.box>
References: <1349827466.26044.16@snotra> <50759105.2000406@wwwdotorg.org>
 <1349885393.21493.2@snotra> <5075A0AA.2000605@wwwdotorg.org>
 <20121010231835.GH28467@truffula.fritz.box>
 <5078525B.9030008@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5078525B.9030008-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 12, 2012 at 11:24:43AM -0600, Stephen Warren wrote:
> On 10/10/2012 05:18 PM, David Gibson wrote:
> ...
> > And as stated elsewhere, cpp should be invoked with similar options to
> > the way it's done for asm files.  A -D__DTS__ or something like that
> > would probably be a good idea too, just in case some .h needs to be
> > conditional on that.
> 
> Hmm. There are some problems here.
> 
> Right now, the command I proposed is basically:
> 
> $(CPP) -x c $< | dtc ...
> 
> Without "-x c", $(CPP) doesn't recognise the file extension of the input
> file, and defaults to assuming it's a linker script rather than an input
> file, even in pre-processing mode (CPP == $(CC) -E), which obviously
> doesn't work too well.
> 
> I chose "-x c" because *.dts syntax is closest to C.
> 
> However, related to your request above, "-x assembler" might be more
> appropriate, since this would presumably define __ASSEMBLY__, which is
> what the kernel headers currently use to determine whether to compile
> out anything other than #defines. However, executing $(CPP) -x assembler
> foo.dts yields a completely empty output! I'm not sure why that is yet.

Oh, that's strange.  I'm pretty sure I've used -x assembler when I've
experimented with using cpp on dts manually before, and it seems to
have worked.  Note that IIRC with gcc cpp, -x assembler also means
that # won't be handled as a cpp directive except in column 0 which is
also an advantage for us, although no longer essential with your
escaping support.  Not all cpps have an equivalent option, though.

> I also tried passing to $(CPP) the exact same options that the kernel
> uses for compiling true assembly files, namely $(a_flags). Doing so
> would presumably provide complete compatibility in the pre-defined
> #defines between compiling *.S and *.dtsp, which would reduce the
> likelihood of needing to do anything different in *.h to support usage
> by both *.S and *.dtsp. (Note that I still need to pass a -x option, and
> the issue I described above still applies here too). This doesn't work
> out, because on ARM you get arch/arm/include/asm/unified.h
> force-included, which emits true assembly macros into the output, which
> obviously dtc can't parse. This could be avoided by editing that file to
> add #ifndef __DTS__ around the offending parts (and passing -D__DTS__ to
> $(CPP)), and that does appear to currently be the only file requiring a
> change. I wonder if using $(a_flags) is inviting more issues like this
> in the future though?

Ah, ok.  No we probably don't want a_flags, although I think we do
want -x assembler (once we work out what's going wrong with that).
Actually, what we should look at is how cpp is invoked for the .lds.S
linker scripts.  Hrm.. possibly that's why .S was used for that,
despite the potential confusion with asm files - because it
automatically triggers the behaviour wanted from cpp.

> Given this, I'm not convinced we should try to make $(CPP) usage for
> *.dts too much like its usage for *.S. I agree it'd probably make sense
> to add -D__DTS__ to the command-line, but switching away from -x c or to
> using $(a_flags) seems like it'd increase the maintenance requirements
> rather than reduce them.

Hrm.  I don't think we want $(a_flags), but I'm not convinced either
way about the -x option.  I definitely think we do want -D__DTS__, and
I think we want -D__ASSEMBLY__ (either directly or indirectly) too.
It's not really accurate, but will at least do the right thing for
quite a lot of the .h files existing in the kernel already.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
