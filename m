From: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: Boot interface for device trees on ARM
Date: Wed, 9 Jun 2010 12:26:13 +0800
Message-ID: <201006091226.15438.jeremy.kerr@canonical.com>
References: <201005181054.32325.jeremy.kerr@canonical.com>
	<201006050933.06714.jeremy.kerr@canonical.com>
	<alpine.LFD.2.00.1006042212400.30664@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <alpine.LFD.2.00.1006042212400.30664-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Nicolas,

> > If we're planning to keep the machine IDs around (even if they are now
> > per- SoC), I'd like to know what would be left using them. The only
> > thing that I can see that we currently use is io_pg_offset for the
> > DEBUG_LL builds, and that isn't a convincing case to keep them.
> 
> Why not?

Because it's something we can justifiably replace with a single compile-time 
constant, since it's only for low-level debug. I don't see that as a reason 
for keeping these machine numbers around if that's all they're used for.

However...

> Kernel infrastructure backward compatibility means that you need to keep
> struct machine_desc instances around.  Granted, for the DT case, many of
> the members could be NULL or initialized with dummy stubs.  But that is
> very cheap to keep around, and that allows the same kernel binary to be
> able to use both the DT boot and the legacy boot.

... this is a good point; if it helps with the transition, then this is 
probably a decent reason to keep it in the interface.

I'd like to keep my "only use the device tree" value (MACH_TYPE_DT = 
0xffffffff) though, so we don't needlessly allocate machine numbers where they 
aren't actually used.

Cheers,


Jeremy
