From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: kirkwood: resynch 98dx4122 dtsi
Date: Thu, 15 May 2014 09:24:36 -0400
Message-ID: <20140515132436.GL27822@titan.lakedaemon.net>
References: <1400147335-20947-1-git-send-email-valentin.longchamp@keymile.com>
 <1400147335-20947-2-git-send-email-valentin.longchamp@keymile.com>
 <53749865.809@gmail.com>
 <5374A0EC.8050706@keymile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5374A0EC.8050706-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Linux device trees <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 15, 2014 at 01:11:40PM +0200, Valentin Longchamp wrote:
> On 05/15/2014 12:35 PM, Sebastian Hesselbarth wrote:
> > On 05/15/2014 11:48 AM, Valentin Longchamp wrote:
> >> The 98DX4122 dtsi file lacks the defintion of the PCIe controller which
> >> is present on this SoC.
> > 
> > Valentin,
> > 
> > good to have you back on 98dx4122. I was already thinking about
> > reworking the current kirkwood.dtsi and kirkwood-<soc>.dtsi as I
> > feel there may be more issues with "common" IP that was removed
> > in 98dx4122.
> > 
> >> The SATA phys must also be explicitely disabled since they are not
> >> present on this SoC. If they remain enabled, a hardlock occures when
> >> their clock gates are enabled.
> > 
> > While I am ok with disabling now, we should really rethink the
> > current SoC-specific includes as we are already facing some issues
> > that cause headaches.
> > 
> > Actually, the initial idea was to remove all nodes from kirkwood.dtsi
> > that are not available in one of the SoCs and rather put them into
> > the SoC-specific include.
> > 
> > But over time we end up with a mix of both, SoC-specific nodes like
> > pcie below _and_ SoC-specific fixes like sata-phy below.
> > 
> > To be consitent, we should either duplicate the sata-phy nodes in
> > kirkwood-6foo.dtsi - or what I prefer - move most of it back to
> > kirkwood.dtsi and use "disabled" in the SoC-specific ones.
> 
> For the sake of the disscussion, we also have some powerPC boards here at
> Keymile and there the approach is exactly the one you prefer above. First I was
> a bit confused but now I think this approach is "cleaner" (or makes more sense
> to me ;-)).

No complaints here either. :)

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
