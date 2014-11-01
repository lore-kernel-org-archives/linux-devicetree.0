From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 0/8] Armada XP pinctrl consolidation and ix4-300d fixes
Date: Sat, 1 Nov 2014 18:36:25 -0400
Message-ID: <20141101223625.GB3698@titan.lakedaemon.net>
References: <1411157684-6991-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1411157684-6991-1-git-send-email-sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Benoit Masson <yahoo-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Sebastian,

On Fri, Sep 19, 2014 at 10:14:36PM +0200, Sebastian Hesselbarth wrote:
> Guys,
> 
> this is a patch set preparing barebox support for ix4-300d. As usual,
> I stumbled upon a few nice-to-haves before actually touching ix4-300d
> dts. As it is a mach-mvebu thing, I just added the related mailing
> lists instead of each of the DT maintainers.
> 
> First 5 patches consolidate SoC-specific pinctrl nodes to one common
> node in armada-xp.dtsi, compatible overwrites for each SoC, and node
> alias usage for each board. Also, ge{0,1} pinctrl settings are moved
> to the common node from one board specific node.
> 
> Last 3 patches then use that ge{0,1} pinctrl settings on ix4-300d which
> is vital for bootloader init. During exploration of ix4-300d, I also
> found a i2c eeprom that has not been added to the dts, yet. Finally,
> there is only one 74hc595 on ix4 mainboard while dts property is set
> for two.
> 
> I cannot recall in detail what is on that eeprom, but IIRC it is nothing
> important. Some reg,addr pairs for some init stuff that should have
> already been done by stock u-boot. Anyway, adding the node will do no
> harm.
> 
> Patches are based on v3.17-rc1 and intended for v3.18 but I am not in
> a hurry. I only compile tested this, so a formal Tested-by from Benoit
> for the ix4 and any other Armada XP board would be great.

I lost track of this thread, are you resending?  Did Benoit get a
successful test run?

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
