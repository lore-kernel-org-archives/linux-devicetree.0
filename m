From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v19 12/12] fpga-manager: Add Socfpga Arria10 support
Date: Thu, 29 Sep 2016 09:49:04 -0700
Message-ID: <CAAtXAHe927JSxaCs0LK8bm57mPRKvZ7ZaAvus_XDnzcQMmdAWw@mail.gmail.com>
References: <20160928182200.15800-1-atull@opensource.altera.com> <20160928182200.15800-13-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160928182200.15800-13-atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Walter Goossens <waltergoossens-CmkmPbn3yAE@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Cyril Chemparathy <cyril.chemparathy-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Matthew Gerlach <mgerlach-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, julia-acOepvfBmUk@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Alan,

On Wed, Sep 28, 2016 at 11:22 AM, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> wrote:

> +static void socfpga_a10_fpga_generate_dclks(struct a10_fpga_priv *priv,
> +                                           u32 count)
> +{
> +       u32 val;
> +       unsigned int i;
> +
> +       /* Clear any existing DONE status. */
> +       regmap_write(priv->regmap, A10_FPGAMGR_DCLKSTAT_OFST,
> +                    A10_FPGAMGR_DCLKSTAT_DCLKDONE);
> +
> +       /* Issue the DCLK regmap. */
> +       regmap_write(priv->regmap, A10_FPGAMGR_DCLKCNT_OFST, count);
> +
> +       /* wait till the dclkcnt done */
> +       for (i = 0; i < 100; i++) {
> +               regmap_read(priv->regmap, A10_FPGAMGR_DCLKSTAT_OFST, &val);
> +               if (val)
> +                       break;
> +               udelay(1);
> +       }

It's quite new, but regmap_read_poll_timeout() might be a good fit here?

> +static int socfpga_a10_fpga_encrypted(struct fpga_manager *mgr,
> +                                     u32 *buf32, size_t buf32_size)
> +{
> +       int encrypt;
> +
> +       if (buf32_size < 70)
> +               return -EINVAL;
> +
> +       encrypt = ((buf32[69] >> 2) & 3) != 0;
> +
> +       dev_dbg(&mgr->dev, "header word %d = %08x encrypt=%d\n",
> +               69, buf32[69], encrypt);
Maybe a named constants for magic 69 / 70 value :)

> +static int socfpga_a10_fpga_compressed(struct fpga_manager *mgr,
> +                                      u32 *buf32, size_t buf32_size)
> +{
> +       int compress;
> +
> +       if (buf32_size < 230)
> +               return -EINVAL;
> +
> +       compress = !((buf32[229] >> 1) & 1);
> +
> +       dev_dbg(&mgr->dev, "header word %d = %08x compress=%d\n",
> +               229, buf32[229], compress);
> +
> +       return compress;
> +}
Same here, a comment on 229/230 would work too I guess.

> +/* Start the FPGA programming by initialize the FPGA Manager */
> +static int socfpga_a10_fpga_write_init(struct fpga_manager *mgr,
> +                                      struct fpga_image_info *info,
> +                                      const char *buf, size_t count)
> +{
> +       struct a10_fpga_priv *priv = mgr->priv;
> +       unsigned int cfg_width;
> +       u32 msel, stat, mask;
> +       int ret;
> +
> +       if (info->flags & FPGA_MGR_PARTIAL_RECONFIG)
> +               cfg_width = CFGWDTH_16;
> +       else
> +               return -EINVAL;

So we can *only* do partial reconfig? Am I missing something here?

> +       /* Do some dclks, wait for pr_ready */
> +       socfpga_a10_fpga_generate_dclks(priv, 0x7ff);

Maybe a named constant?

Cheers,
Moritz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
