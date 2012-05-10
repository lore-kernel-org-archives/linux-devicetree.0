From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2] ARM: DT: Add binding for GIC virtualization extentions
 (VGIC)
Date: Thu, 10 May 2012 10:53:09 +0000
Message-ID: <201205101053.09954.arnd@arndb.de>
References: <1336586277-28454-1-git-send-email-marc.zyngier@arm.com>
 <201205092047.06852.arnd@arndb.de>
 <ed0ce2390716adbfc949f86c16dab996@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <ed0ce2390716adbfc949f86c16dab996@localhost>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, david.vrabel-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 09 May 2012, Marc Zyngier wrote:
> > 
> > Sounds good. I don't have a strong preference whether that should be a
> > property like you suggest or a separate "compatible" value, maybe Rob or
> > Grant can comment on what they prefer.
> 
> At the moment, the compatible string should be pretty explicit, as it is
> not possible to build an A7 or A15 based SoC without the virtualization
> extensions.

Ok, makes sense. Then again, if you run an A15 guests on an A15 host,
the virtual GIC would not have those extensions, right?

> > On the guest side, is it guaranteed that the virtual GIC looks like
> > a real GIC without those extensions? If the actual behavior depends on
> > the hypervisor, it might still make sense to add another flag in there
> > to tell that it's virtual, even if we don't require it for now.
> 
> Nothing is really guaranteed, as the VGIC only exposes a GIC CPU interface
> to the guest, and the distributor has to be modeled by the hypervisor. But
> if the difference is observable by the guest, is it still a GIC? And how to
> differentiate between behavior A and behavior B with a single flag?

Right, in that case, we would probably want a hypervisor specific compatible
property to identify it.
 
> My take would be that if the guest can tell the difference, than it
> shouldn't be called a GIC, and have separate bindings. Or at least a
> different compatible string that we could use to enable quirks in the
> driver.

Ok, good.

	Arnd
