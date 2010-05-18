From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Cmdline FDT query tool
Date: Tue, 18 May 2010 18:53:54 +1000
Message-ID: <20100518085354.GD25892@yookeroo>
References: <AANLkTilo68Va3EzuWq3SPzv-YpXt-7Ty7Us_Q0Fw_Nmv@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTilo68Va3EzuWq3SPzv-YpXt-7Ty7Us_Q0Fw_Nmv-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
Cc: Michal Simek <michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 18, 2010 at 12:03:19PM +1000, John Williams wrote:
> Hi Grant,
> 
> At ELC I mentioned a tool I'd written that basically hacked u-boot's
> "fdt" command into a commandline util for querying DTBs.  You can do
> stuff like this:
> 
> $ fdt-tool system.dtp print
> 
> <dump entire DTB in text format>
> 
> $ fdt-tool system.dtb list /cpus/cpu@0 xlnx,use-dcache
> xlnx,use-dcache = <0x1>
> 
> and so on.
> 
> I wrote it four our PetaLinux distribution because we need our tools
> to make decisions based on contents of device trees, but thought you
> might like to look at it, see if it's more broadly useful (maybe could
> be a candidate for scripts/ in the kernel for example).
> 
> It's pretty rough, I hacked it together in about 20 minutes and threw
> in a readline interface so you can also use it interactively as well.

Interesting.  It might be nice to include this into the libfdt tree,
as both a code example and a useful standalone tool.

> Possible enhancements would be
>   * clean up!
>   * support DTS input format (only DTB supported currently)

Hrm.  Unless you do it by calling out to dtc, that would be a big job,
and essentially mean re-implementing a big chunk of dtc - with which
it could then get out of sync.  So please don't do that.

>   * Allow modifying and re-writing (current DTB is read-only)
> 
> It can also do some interesting things with u-boot FIT images - you
> can basically crack out kernel, DTB or rootfs payloads from a FIT.
> 
> If it does go into the kernel then MicroBlaze arch would be an
> immediate user, we have a few KCONFIG params that drive GCC cpuflag
> options - for simpleImage targets we could pull these straight from
> the DTS instead to avoid kernel/CPU mismatches.  We could do it today
> with sed/grep/awk etc, but it's ugly ugly ugly.  A DTS-aware tool like
> this would make it a no-brainer.  I'm sure PPC could find some useful
> things to do with it as well.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
