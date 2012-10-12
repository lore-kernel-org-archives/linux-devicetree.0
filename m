From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: dtc: import latest upstream dtc
Date: Fri, 12 Oct 2012 11:24:43 -0600
Message-ID: <5078525B.9030008@wwwdotorg.org>
References: <1349827466.26044.16@snotra> <50759105.2000406@wwwdotorg.org> <1349885393.21493.2@snotra> <5075A0AA.2000605@wwwdotorg.org> <20121010231835.GH28467@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121010231835.GH28467@truffula.fritz.box>
Sender: linux-kernel-owner@vger.kernel.org
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Scott Wood <scottwood@freescale.com>, Michal Marek <mmarek@suse.cz>, devicetree-discuss@lists.ozlabs.org, Stephen Warren <swarren@nvidia.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/10/2012 05:18 PM, David Gibson wrote:
...
> And as stated elsewhere, cpp should be invoked with similar options to
> the way it's done for asm files.  A -D__DTS__ or something like that
> would probably be a good idea too, just in case some .h needs to be
> conditional on that.

Hmm. There are some problems here.

Right now, the command I proposed is basically:

$(CPP) -x c $< | dtc ...

Without "-x c", $(CPP) doesn't recognise the file extension of the input
file, and defaults to assuming it's a linker script rather than an input
file, even in pre-processing mode (CPP == $(CC) -E), which obviously
doesn't work too well.

I chose "-x c" because *.dts syntax is closest to C.

However, related to your request above, "-x assembler" might be more
appropriate, since this would presumably define __ASSEMBLY__, which is
what the kernel headers currently use to determine whether to compile
out anything other than #defines. However, executing $(CPP) -x assembler
foo.dts yields a completely empty output! I'm not sure why that is yet.

I also tried passing to $(CPP) the exact same options that the kernel
uses for compiling true assembly files, namely $(a_flags). Doing so
would presumably provide complete compatibility in the pre-defined
#defines between compiling *.S and *.dtsp, which would reduce the
likelihood of needing to do anything different in *.h to support usage
by both *.S and *.dtsp. (Note that I still need to pass a -x option, and
the issue I described above still applies here too). This doesn't work
out, because on ARM you get arch/arm/include/asm/unified.h
force-included, which emits true assembly macros into the output, which
obviously dtc can't parse. This could be avoided by editing that file to
add #ifndef __DTS__ around the offending parts (and passing -D__DTS__ to
$(CPP)), and that does appear to currently be the only file requiring a
change. I wonder if using $(a_flags) is inviting more issues like this
in the future though?

Given this, I'm not convinced we should try to make $(CPP) usage for
*.dts too much like its usage for *.S. I agree it'd probably make sense
to add -D__DTS__ to the command-line, but switching away from -x c or to
using $(a_flags) seems like it'd increase the maintenance requirements
rather than reduce them.
