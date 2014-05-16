From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH v2 0/3] Update the Keymile kirkwood DTS files
Date: Fri, 16 May 2014 16:11:46 +0200
Message-ID: <20140516141146.GH10407@lunn.ch>
References: <1400230143-15620-1-git-send-email-valentin.longchamp@keymile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1400230143-15620-1-git-send-email-valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Cc: Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Linux device trees <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 16, 2014 at 10:49:00AM +0200, Valentin Longchamp wrote:
> This series resynchs the Keymile Kirkwood DTS files with mainline since
> the boards do not boot anymore with the 3.15 rc kernels (to be honest, I
> have not tested the last 2-3 releases).
> 
> The changes are the addition of the PCIe controller for the 98dx4122
> SoC, the explicit disabling of the SATA phys for this same SoC and
> finally the enabling of the PCIe controller on the Keymile Reference
> design.
> 
> The series introduces kirkwood-km_common.dtsi that factors the common
> nodes between kirkwood-km_kirkwood.dts and the new board/design below.
> 
> The series also adds a new DTS for another Keymile generic design where
> the mv64xxx eth interace is configured with fixed parameters to no phy
> but a switch (for board internal communication).

Hi Valentin

Looks good to me.

Acked-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>

Thanks
	Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
