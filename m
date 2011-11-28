From: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/4] ARM: vexpress: Get rid of MMIO_P2V
Date: Mon, 28 Nov 2011 10:53:04 +0000
Message-ID: <20111128105247.GA2465@localhost.localdomain>
References: <1322060508-11298-1-git-send-email-pawel.moll@arm.com>
 <1322060508-11298-2-git-send-email-pawel.moll@arm.com>
 <20111125161500.GD2098@localhost.localdomain>
 <20111128104416.GD9581@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111128104416.GD9581-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 28, 2011 at 10:44:16AM +0000, Russell King - ARM Linux wrote:
> On Fri, Nov 25, 2011 at 04:15:00PM +0000, Dave Martin wrote:
> > diff --git a/arch/arm/plat-versatile/headsmp.S b/arch/arm/plat-versatile/headsmp.S
> > index d397a1f..0be2efc 100644
> > --- a/arch/arm/plat-versatile/headsmp.S
> > +++ b/arch/arm/plat-versatile/headsmp.S
> > @@ -28,6 +28,7 @@ ENTRY(versatile_secondary_startup)
> >  pen:	ldr	r7, [r6]
> >  	cmp	r7, r0
> >  	bne	pen
> > +ENDPROC(versatile_secondary_startup)
> 
> This is wrong.  You're telling the assembler that this function ends here.
> It doesn't, it continues on.  Put the ENDPROC at the end of the function.

Dunno what I was thinking of there -- agreed, the ENDPROC() should move
to the end of the file.

(I'm assuming that literals should be included in the size of the
relevant function symbol here -- that's the convention the compiler
follows.)

Cheers
---Dave
