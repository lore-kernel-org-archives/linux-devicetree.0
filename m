From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] of: Fix locking vs. interrupts
Date: Wed, 12 Jun 2013 18:56:27 +1000
Message-ID: <1371027387.8250.199.camel@pasglop>
References: <1371015544.8250.182.camel@pasglop>
 <alpine.LFD.2.02.1306121023150.22970@ionos>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <alpine.LFD.2.02.1306121023150.22970@ionos>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2013-06-12 at 10:25 +0200, Thomas Gleixner wrote:
> On Wed, 12 Jun 2013, Benjamin Herrenschmidt wrote:
> 
> > The OF code uses irqsafe locks everywhere except in a handful of functions
> > for no obvious reasons. Since the conversion from the old rwlocks, this
> > now triggers lockdep warnings when used at interrupt time. At least one
> > driver (ibmvscsi) seems to be doing that from softirq context.
> > 
> > This converts the few non-irqsafe locks into irqsafe ones, making them
> > consistent with the rest of the code.
> 
> Fun. https://lkml.org/lkml/2013/2/4/416 seems to have got lost 
>  
> > Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> > CC: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> [v3.9+]
> 
> Acked-by: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> 
> > ---
> > 
> > Note: It's silly to access the device-tree at interrupt time in most cases,
> > and we should probably fix ibmvscsi, but for the time being, let's fix the
> 
> Right.
> 
> > obvious bug. Thomas, this can probably still go into 3.10... If not, I've
> > CCed stable.
> 
> Should go through Grant I think.

Right, thinko. Sent to you due to the bug being exposed by your
conversion to spinlocks. Anyway, Grant got it now.

Cheers,
Ben.
