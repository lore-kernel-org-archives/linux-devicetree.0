From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] patches to allow DTB to be appended to the ARM zImage
Date: Mon, 13 Jun 2011 19:13:44 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1106131910570.2142@xanadu.home>
References: <1307858800-16712-1-git-send-email-nicolas.pitre@linaro.org>
	<20110612081541.GA10283@n2100.arm.linux.org.uk>
	<20110612083414.GA29516@S2100-06.ap.freescale.net>
	<20110612092131.GC10283@n2100.arm.linux.org.uk>
	<20110612095217.GD10283@n2100.arm.linux.org.uk>
	<20110612104215.GC29516@S2100-06.ap.freescale.net>
	<20110612104048.GE10283@n2100.arm.linux.org.uk>
	<8yaaadlfi3q.fsf@huya.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <8yaaadlfi3q.fsf-AOX6H5vLt3Uj8izMo0bVsAC/G2K4zDHf@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 13 Jun 2011, David Brown wrote:

> On Sun, Jun 12 2011, Russell King - ARM Linux wrote:
> 
> > On Sun, Jun 12, 2011 at 06:42:16PM +0800, Shawn Guo wrote:
> >> On Sun, Jun 12, 2011 at 10:52:17AM +0100, Russell King - ARM Linux wrote:
> >> > On Sun, Jun 12, 2011 at 05:38:23PM +0800, Shawn Guo wrote:
> >> > > On Sun, Jun 12, 2011 at 10:21:31AM +0100, Russell King - ARM Linux wrote:
> >> > > > What if your platform doesn't use uboot?
> >> > > 
> >> > > Add dtb parsing support with the help from libfdt, I guess.  It is
> >> > > some amount of work, but it's not a rewrite of bootloader, IMHO.
> >> > 
> >> > I guess you're suggesting that this wrapper uses libfdt to merge
> >> > the ATAGs with the DT info?
> >> > 
> >> No, ATAGs does not play at all in this case.  For u-boot example
> >> again, if it boots a dt kernel, dtb will be parsed to get cmdline
> >> node overwritten as bootargs env value, and then it boots the dt
> >> kernel with this updated dtb.
> >
> > You've missed my point entirely.  What you're saying is that we have to
> > re-build and replace the boot loader in order to pass a command line into
> > a kernel using the DT wrapper.
> >
> > I'm saying that you shouldn't have to, and the kernel should accept the
> > memory size and command line from the ATAGs _in addition_ to the
> > appended DT blob, and the ATAGs in that case should take precidence.
> 
> Having just now booted an MSM target using device tree, I'm going to
> agree with Russell here.  I don't really see a clean transition path for
> us to hard cut over to DT, at least on existing targets.
> 
> The MSMs use a custom bootloader.  It builds ATAGS to pass in memory
> information, command line arguments, and the ramdisk address.  Working
> with the bootloader team just to do this was difficult; trying to
> support DT in the bootloader would be even more difficult.
> 
> But, beyond this, we have to still be able to boot our production
> kernels (which don't have DT support, and probably won't for quite some
> time).
> 
> The steps I had to go through to boot a DT kernel were kind of
> complicated:
> 
>   - Boot kernel in a debugger, and inspect the ATAGS.
> 
>   - Edit my DTS file to match the current values.
> 
>   - Compile the DTS file.
> 
>   - Load the dtb on top of the ATAGS.
> 
> Unless I'm missing something, I don't see a clean way of supporting this
> that doesn't involve the kernel being able to parse the ATAGS as well.

FYI: I've dug up the patch from John Bonesio doing just that.  While the 
patch doesn't apply anymore, it looks trivial enough.  I should have it 
working by tomorrow.


Nicolas
