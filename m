From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v6 4/5] misc: fastrpc: Add support for create remote init
 process
Date: Fri, 8 Feb 2019 14:56:56 +0100
Message-ID: <20190208135656.GB23406@kroah.com>
References: <20190208132306.12571-1-srinivas.kandagatla@linaro.org>
 <20190208132306.12571-5-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190208132306.12571-5-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: arnd@arndb.de, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, bkumar@qti.qualcomm.com, linux-arm-msm@vger.kernel.org, Thierry Escande <thierry.escande@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 08, 2019 at 01:23:05PM +0000, Srinivas Kandagatla wrote:
> +static int fastrpc_init_create_process(struct fastrpc_user *fl,
> +					char __user *argp)
> +{
> +	struct fastrpc_init_create init;
> +	struct fastrpc_invoke_args args[6];

All on the stack?  Ok, but:

> +	struct fastrpc_phy_page pages[1];
> +	struct fastrpc_map *map = NULL;
> +	struct fastrpc_buf *imem = NULL;
> +	int memlen;
> +	int err;
> +	struct {
> +		int pgid;
> +		u32 namelen;
> +		u32 filelen;
> +		u32 pageslen;
> +		u32 attrs;
> +		u32 siglen;
> +	} inbuf;
> +	u32 sc;
> +
> +	if (copy_from_user(&init, argp, sizeof(init)))
> +		return -EFAULT;
> +
> +	if (init.filelen > INIT_FILELEN_MAX)
> +		return -EINVAL;
> +
> +	inbuf.pgid = fl->tgid;
> +	inbuf.namelen = strlen(current->comm) + 1;
> +	inbuf.filelen = init.filelen;
> +	inbuf.pageslen = 1;
> +	inbuf.attrs = init.attrs;
> +	inbuf.siglen = init.siglen;
> +	fl->pd = 1;
> +
> +	if (init.filelen && init.filefd) {
> +		err = fastrpc_map_create(fl, init.filefd, init.filelen, &map);
> +		if (err)
> +			return err;
> +	}
> +
> +	memlen = ALIGN(max(INIT_FILELEN_MAX, (int)init.filelen * 4),
> +		       1024 * 1024);
> +	err = fastrpc_buf_alloc(fl, fl->sctx->dev, memlen,
> +				&imem);
> +	if (err) {
> +		fastrpc_map_put(map);
> +		return err;
> +	}
> +
> +	fl->init_mem = imem;
> +	args[0].ptr = (u64)(uintptr_t)&inbuf;
> +	args[0].length = sizeof(inbuf);
> +	args[0].fd = -1;

You never clear the reserved field :(

thanks,

greg k-h
