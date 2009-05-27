From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Wed, 27 May 2009 22:27:01 +0200
Message-ID: <20090527202701.GA16219@game.jcrosoft.org>
References: <20090527175609.GB31861@flint.arm.linux.org.uk>
	<4A1D8FBA.6040802@freescale.com>
	<20090527192909.GA32398@flint.arm.linux.org.uk>
	<20090527.132328.78091350.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090527.132328.78091350.davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Cc: rmk+lkml-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org, timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 13:23 Wed 27 May     , David Miller wrote:
> From: Russell King <rmk+lkml-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> Date: Wed, 27 May 2009 20:29:10 +0100
> 
> > To program them into the hardware registers, which is not what we in
> > the ARM community say, but it's what the _network_ guys tell people
> > they should be doing.
> > 
> > I've suggested in the past having a standard kernel parameter such
> > that you can specify a mac address on a per-device basis in a totally
> > platform independent way, but the network folk don't like that idea.
> 
> As a "network guy" I can tell you that when the system firmware
> provides a system-wide or device specific MAC address in it's device
> tree, that is what you should use.
> 
> And that's what I've been doing on sparc FOR 15 YEARS.
> 
> Device trees are the only systematic generic mechanism for
> describing device layouts on the myriad of embedded boards
> out there which you will ever find.
> 
> Two platforms, and now a third, have been using this scheme
> over a very proven period of time.  It's not a hack, there is
> infrastructure to get the boot loaders to do the right thing,
> and only ARM seems to resist it. :-)
The SH, avr32, mips, x86 does not support it too IIRC

Best Regards,
J.
