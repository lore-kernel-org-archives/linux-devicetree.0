From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 1/6] ARM: bcm476x: Add infrastructure
Date: Mon, 8 Oct 2012 14:14:55 +0200
Message-ID: <20121008141455.324f914b@skate>
References: <20121007015300.828366635@gmail.com>
 <20121007015405.958959522@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20121007015405.958959522@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Domenico Andreoli <cavokz@gmail.com>
Cc: Domenico Andreoli <domenico.andreoli@linux.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


On Sun, 07 Oct 2012 03:53:01 +0200, Domenico Andreoli wrote:

> Index: b/arch/arm/mach-bcm476x/Makefile.boot
> ===================================================================
> --- /dev/null
> +++ b/arch/arm/mach-bcm476x/Makefile.boot
> @@ -0,0 +1,5 @@
> +   zreladdr-y := 0x00008000
> +params_phys-y := 0x00000100
> +initrd_phys-y := 0x00800000

Those params_phys-y and initrd_phys-y lines as useless as you're using
the Device Tree.

> +#define BCM476X_PERIPH_PHYS   0x00080000
> +#define BCM476X_PERIPH_VIRT   0xd0080000

This one should be defined with IOMEM(). Yes, you will have to add a
cast to make it play nicely with map_desc.virtual.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
