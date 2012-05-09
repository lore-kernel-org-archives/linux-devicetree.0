From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2] ARM: DT: Add binding for GIC virtualization extentions
 (VGIC)
Date: Wed, 9 May 2012 20:27:49 +0000
Message-ID: <201205092027.50059.arnd@arndb.de>
References: <1336586277-28454-1-git-send-email-marc.zyngier@arm.com>
 <201205091921.43299.arnd@arndb.de>
 <a226ca6e8dd0370afeeb9aa1d67ddfde@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <a226ca6e8dd0370afeeb9aa1d67ddfde@localhost>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, david.vrabel-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 09 May 2012, Marc Zyngier wrote:
> On Wed, 9 May 2012 19:21:42 +0000, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Wednesday 09 May 2012, Marc Zyngier wrote:
> >> 
> >> The GICv2 can have virtualization extension support, consisting
> >> of an additional set of registers and interrupts. Add the necessary
> >> binding to the GIC DT documentation.
> >> 
> >> Signed-off-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> > 
> > Would it make sense to add a way to detect whether a GIC is virtual
> > or real? Maybe an optional empty "virtual-gic" property or an additional
> > "compatible" value. Even if we don't need it now, it might come in handy
> > if we require it already.
> 
> I don't really see a need for this. When running on a virtual machine, the
> kernel cannot tell if this is the real thing or not (the virtual CPU
> interface looks exactly like the normal one once mapped into the guest
> address space).
> 
> Or maybe I just didn't get your use case?

Well, one difference seems to be the VGIC maintainance interrupt that may
or may not be present, and another one the additional registers. Of course
you can imply the type of GIC from the presence of this extra data,
but I think it would be better to make it explicit.

	Arnd
