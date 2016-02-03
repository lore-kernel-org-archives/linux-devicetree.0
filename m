From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: arm,gic-v3: require that reserved cells are
 always 0
Date: Wed, 3 Feb 2016 18:40:18 +0000
Message-ID: <20160203184017.GA15852@arm.com>
References: <1454522458-29643-1-git-send-email-will.deacon@arm.com>
 <20160203182054.GH1234@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160203182054.GH1234@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 03, 2016 at 06:20:54PM +0000, Mark Rutland wrote:
> On Wed, Feb 03, 2016 at 06:00:58PM +0000, Will Deacon wrote:
> > Consequently, any extensions to the PPI or SPI interrupt specifiers must
> > be able to work with random crap from legacy DTs, effectively
> > necessitating a new interrupt type in the first cell. Sigh.
> 
> I'm not sure that's true if we allocate a new value for the 1st cell for
> "extended" PPI or SPI interrupt-sepcficiers (which presumably add
> restrictions). That would also allow old kernels to safely skip such
> interrupts rather than mis-parsing them.

Right, that's what I said :)

> > This patch fixes the text so that additional, reserved cells are
> > required to be zero. This looks like a reasonable thing to require and
> > is already satisifed by the .dts files in-tree.
> > 
> > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> > Signed-off-by: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
> 
> This patch itself makes sense, so FWIW:
> 
> Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> 
> Any proposed extention to the binding requires its own discussion.

Yup.

Marc -- can you queue this please?

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
