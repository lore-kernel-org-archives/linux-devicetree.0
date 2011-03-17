From: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Subject: Re: RFC: Platform data for onboard USB assets
Date: Thu, 17 Mar 2011 15:53:28 -0700
Message-ID: <20110317225328.GB31581@kroah.com>
References: <20110311165642.GA9996@kroah.com>
	<20110317214042.GQ31411@opensource.wolfsonmicro.com>
	<20110317214736.GA29014@kroah.com>
	<201103172333.01474.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201103172333.01474.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 17, 2011 at 11:33:01PM +0100, Arnd Bergmann wrote:
> On Thursday 17 March 2011 22:47:36 Greg KH wrote:
> > > > Patches to fix this, for this specific PandaBoard controller are gladly
> > > > accepted.  What's odd is this is explicitly a Linux development board,
> > > > so you would think that this could have been caught, and fixed, in the
> > > > hardware a long time ago, right?
> > > 
> > > The way everyone resolves this stuff is by patching their kernel
> > > locally.
> > 
> > Well, that means that the device tree work is going to be useful here,
> > right?  :)
> 
> I like the idea. Let's make this the first use case where a lot of
> people will want to have the device tree on ARM. The patch to the
> driver to check for a mac-address property is trivial, and we
> can probably come up with a decent way of parsing the device
> tree for USB devices, after all there is an existing spec for
> it (http://playground.sun.com/1275/bindings/usb/usb-1_0.ps).
> 
> 	Arnd
> 
> 8<------
> [PATCH] net/smscx5xx: demonstrate use of device tree for mac address
> 
> This takes the MAC address for smsc75xx/smsc95xx USB network devices
> from a the device tree. This is required to get a usable persistent
> address on the popular beagleboard, whose hardware designers
> accidentally forgot that an ethernet device really requires an a
> MAC address to be functional.
> 
> The smsc75xx and smsc95xx drivers are just two copies of the
> same code, so better fix both.
> 
> Not tested!
> 
> Signed-off-by: Arnd Bergmann <arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

<snip>

Very nice.

Andy and Mark, would this patch work for you?

thanks,

greg k-h
