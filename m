From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] gpio: Add device driver for GRGPIO cores
Date: Sat, 2 Feb 2013 16:16:06 +0100
Message-ID: <CACRpkdbAS05dVOrE2E5Uu6qfzfgcoz_KqQmqZxz5Pne9BbCt-g@mail.gmail.com>
References: <1359548921-14925-1-git-send-email-andreas@gaisler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1359548921-14925-1-git-send-email-andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
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
To: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, software-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 30, 2013 at 1:28 PM, Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org> wrote:

> This driver supports GRGPIO gpio cores available in the GRLIB VHDL IP core
> library.
>
> Signed-off-by: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>

OK...

> +#if defined(__BIG_ENDIAN)
> +static inline u32 grgpio_read_reg(u32 __iomem *reg)
> +{
> +       return ioread32be(reg);
> +}
> +
> +static inline void grgpio_write_reg(u32 __iomem *reg, u32 val)
> +{
> +       iowrite32be(val, reg);
> +}
> +#else
> +static inline u32 grgpio_read_reg(u32 __iomem *reg)
> +{
> +       return ioread32(reg);
> +}
> +
> +static inline void grgpio_write_reg(u32 __iomem *reg, u32 val)
> +{
> +       iowrite32(val, reg);
> +}
> +#endif

Where is this __BIG_ENDIAN flag coming from?

And do you really have and test this regularly on both LE and BE hardware?
I am worrying a bit about maintenance...

> +static void grgpio_set_sbit(struct grgpio_priv *priv, u32 __iomem *reg,
> +                          unsigned offset, int val, u32 *shadow)
> +{
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&priv->lock, flags);
> +
> +       if (val)
> +               *shadow |= (1 << offset);
> +       else
> +               *shadow &= ~(1 << offset);
> +       grgpio_write_reg(reg, *shadow);
> +
> +       spin_unlock_irqrestore(&priv->lock, flags);
> +}

This is all very basic stuff. Please make a best effort to reuse or
augment and reuse this:
drivers/gpio/gpio-generic.c

IIRC this one also handles endianness issues, but I could be wrong.

Yours,
Linus Walleij
