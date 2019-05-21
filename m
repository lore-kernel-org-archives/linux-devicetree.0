From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 5/7] drivers/soc: xdma: Add debugfs entries
Date: Tue, 21 May 2019 13:58:34 +0200
Message-ID: <CAK8P3a0W=kUxTU7M5diSL3pcFQydXbB0ABwqj6NUhKj2hQC_wg@mail.gmail.com>
References: <1558383565-11821-1-git-send-email-eajames@linux.ibm.com> <1558383565-11821-6-git-send-email-eajames@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558383565-11821-6-git-send-email-eajames@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eddie James <eajames@linux.ibm.com>
Cc: linux-aspeed@lists.ozlabs.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
List-Id: devicetree@vger.kernel.org

On Mon, May 20, 2019 at 10:19 PM Eddie James <eajames@linux.ibm.com> wrote:

>  struct aspeed_xdma_client {
> @@ -656,6 +662,92 @@ static int aspeed_xdma_init_mem(struct aspeed_xdma *ctx)
>         return 0;
>  }
>
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +static ssize_t aspeed_xdma_debugfs_vga_read(struct file *file,
> +                                           char __user *buf, size_t len,
> +                                           loff_t *offset)
> +{
> +       int rc;


I think it would be more readable to move the IS_ENABLED()
check into the function and do

         if (!IS_ENABLED(CONFIG_DEBUG_FS))
                  return;

in the init_debugfs() function.

> +       struct inode *inode = file_inode(file);
> +       struct aspeed_xdma *ctx = inode->i_private;
> +       void __iomem *vga = ioremap(ctx->vga_phys, ctx->vga_size);
> +       loff_t offs = *offset;
> +       void *tmp;
> +
> +       if (!vga)
> +               return -ENOMEM;
> +
> +       if (len + offs > ctx->vga_size) {
> +               iounmap(vga);
> +               return -EINVAL;
> +       }

The usual read() behavior is to use truncate the
read at the maximum size, rather than return an
error for an access beyond the end of file.

> +
> +       tmp = kzalloc(len, GFP_KERNEL);
> +       if (!tmp) {
> +               iounmap(vga);
> +               return -ENOMEM;
> +       }

Use 'goto out;' to consolidate the unmap/free here?

> +static void aspeed_xdma_init_debugfs(struct aspeed_xdma *ctx)
> +{
> +       ctx->debugfs_dir = debugfs_create_dir(DEVICE_NAME, NULL);
> +       if (IS_ERR_OR_NULL(ctx->debugfs_dir)) {

debugfs_create_dir() never returns NULL.

Usually if you have to use IS_ERR_OR_NULL() in your code, that
is a bug, or a very badly defined interface.

      Arnd
