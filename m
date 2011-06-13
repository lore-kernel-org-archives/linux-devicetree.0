From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] patches to allow DTB to be appended to the ARM zImage
Date: Mon, 13 Jun 2011 10:14:07 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1106131010150.2142@xanadu.home>
References: <1307858800-16712-1-git-send-email-nicolas.pitre@linaro.org>
	<20110612112219.GD16318@ibawizard.net>
	<20110612115820.GF10283@n2100.arm.linux.org.uk>
	<201106121615.24059.arnd@arndb.de>
	<20110612145751.GA4013@ponder.secretlab.ca>
	<20110612151931.GK10283@n2100.arm.linux.org.uk>
	<alpine.LFD.2.00.1106121145570.2142@xanadu.home>
	<20110612155940.GM10283@n2100.arm.linux.org.uk>
	<alpine.LFD.2.00.1106121454510.2142@xanadu.home>
	<20110613095142.GA10951@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110613095142.GA10951-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, =?ISO-8859-15?Q?Petr_=A6tetiar?= <ynezz-knWk7/PSn+s@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 13 Jun 2011, Tony Lindgren wrote:

> * Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> [110612 11:55]:
> > On Sun, 12 Jun 2011, Russell King - ARM Linux wrote:
> > 
> > > I don't see this as a sustainable way forward.  If we're going to move a
> > > particular SoC over to DT, we need to move the entire SoC over.  We can't
> > > do this half-heartedly.
> > > 
> > > And that means we _must_ deal with accepting ATAGs from existing boot
> > > loaders, with that information taking precidence over the DT blob
> > > supplied with the kernel.
> > 
> > Well... OK.  Let's see how this can be accommodated with the existing 
> > patch floating around doing that.
> 
> I agree that we need to parse the user configurable ATAGs to support
> existing hardware properly. Otherwise we have edit the .dts for each board
> to change the user configurable things, which is not nice for distros.

You mean "existing bootloaders", right?

Updated bootloaders should translate user configurable information into 
proper DT records and pass the resulting DTB to the kernel separately.


Nicolas
