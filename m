From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH V3] irqchip: Add TB10x interrupt controller driver
Date: Tue, 25 Jun 2013 15:58:43 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1306251551020.4013@ionos.tec.linutronix.de>
References: <20130530211944.05F4D3E0A90@localhost>
 <1370014348-21121-1-git-send-email-christian.ruppert@abilis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1370014348-21121-1-git-send-email-christian.ruppert-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org>
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
To: Christian Ruppert <christian.ruppert-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org>
Cc: Pierrick Hascoet <pierrick.hascoet-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 31 May 2013, Christian Ruppert wrote:
> The SOC interrupt controller driver for the Abilis Systems TB10x series of
> SOCs based on ARC700 CPUs.
> 
> This patch depends on commits eb76bdd407d8a90e59a06cb0158886df390e5d1c and
> 712bc93df9e7f14b8a163148d2aa7c778e151627 from branch irq/for-arm of
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git.

This should go below --- as it is not part of the changelog.
 
> Signed-off-by: Christian Ruppert <christian.ruppert-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Pierrick Hascoet <pierrick.hascoet-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org>

Why is Pierrick in the SOB chain? 

> ---
>  .../interrupt-controller/abilis,tb10x-ictl.txt     |   38 ++++
>  arch/arc/boot/dts/abilis_tb100.dtsi                |   32 ++--
>  arch/arc/boot/dts/abilis_tb101.dtsi                |   32 ++--
>  arch/arc/boot/dts/abilis_tb10x.dtsi                |   32 ++--
>  arch/arc/plat-tb10x/Kconfig                        |    1 +
>  drivers/irqchip/Kconfig                            |    5 +
>  drivers/irqchip/Makefile                           |    1 +
>  drivers/irqchip/irq-tb10x.c                        |  195 ++++++++++++++++++++

I can pick it up, but I'm not so fond of carrying arch/arc patches
which might conflict with other stuff in the arc tree. Veenet, if I
should pick the whole thing up, I'd like to have an acked-by at least.

Thanks,

	tglx
