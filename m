From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 0/3] patches to allow DTB to be appended to the ARM zImage
Date: Sun, 12 Jun 2011 11:40:48 +0100
Message-ID: <20110612104048.GE10283@n2100.arm.linux.org.uk>
References: <1307858800-16712-1-git-send-email-nicolas.pitre@linaro.org>
	<20110612081541.GA10283@n2100.arm.linux.org.uk>
	<20110612083414.GA29516@S2100-06.ap.freescale.net>
	<20110612092131.GC10283@n2100.arm.linux.org.uk>
	<20110612095217.GD10283@n2100.arm.linux.org.uk>
	<20110612104215.GC29516@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110612104215.GC29516-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Jun 12, 2011 at 06:42:16PM +0800, Shawn Guo wrote:
> On Sun, Jun 12, 2011 at 10:52:17AM +0100, Russell King - ARM Linux wrote:
> > On Sun, Jun 12, 2011 at 05:38:23PM +0800, Shawn Guo wrote:
> > > On Sun, Jun 12, 2011 at 10:21:31AM +0100, Russell King - ARM Linux wrote:
> > > > What if your platform doesn't use uboot?
> > > 
> > > Add dtb parsing support with the help from libfdt, I guess.  It is
> > > some amount of work, but it's not a rewrite of bootloader, IMHO.
> > 
> > I guess you're suggesting that this wrapper uses libfdt to merge
> > the ATAGs with the DT info?
> > 
> No, ATAGs does not play at all in this case.  For u-boot example
> again, if it boots a dt kernel, dtb will be parsed to get cmdline
> node overwritten as bootargs env value, and then it boots the dt
> kernel with this updated dtb.

You've missed my point entirely.  What you're saying is that we have to
re-build and replace the boot loader in order to pass a command line into
a kernel using the DT wrapper.

I'm saying that you shouldn't have to, and the kernel should accept the
memory size and command line from the ATAGs _in addition_ to the
appended DT blob, and the ATAGs in that case should take precidence.
