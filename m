From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 01/18] drivers/fsi: Add empty fsi bus definitions
Date: Thu, 23 Feb 2017 11:53:17 +0100
Message-ID: <CAMuHMdUhiXCnjT60Lsqq4eGGnVv9eavtkVL1Mdk_6naBHBDVrQ@mail.gmail.com>
References: <20170201165358.45415-1-cbostic@linux.vnet.ibm.com>
 <20170201165358.45415-2-cbostic@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170201165358.45415-2-cbostic@linux.vnet.ibm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, Jeremy Kerr <jk@ozlabs.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Geert Uytterhoeven <geert+renesas@glider.be>, andrew@aj.id.au, Greg KH <gregkh@linuxfoundation.org>, Michael Turquette <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, Chris Bostic <cbostic@us.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, joel@jms.id.au, Alistair Popple <alistair@popple.id.au>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Chris, Jeremy,

On Wed, Feb 1, 2017 at 5:53 PM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> From: Jeremy Kerr <jk@ozlabs.org>
>
> This change adds the initial (empty) fsi bus definition, and introduces
> drivers/fsi/.
>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> Signed-off-by: Chris Bostic <cbostic@us.ibm.com>

> --- /dev/null
> +++ b/drivers/fsi/Kconfig
> @@ -0,0 +1,12 @@
> +#
> +# FSI subsystem
> +#
> +
> +menu "FSI support"
> +
> +config FSI
> +       tristate "FSI support"

I guess this should depend on some POWER symbol || COMPILE_TEST?

> +       ---help---
> +         FSI - the FRU Support Interface - is a simple bus for low-level
> +         access to POWER-based hardware.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
