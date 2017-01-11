From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v4 1/2] eeprom: Add IDT 89HPESx EEPROM/CSR driver
Date: Wed, 11 Jan 2017 09:21:19 +0100
Message-ID: <20170111082119.GA26387@kroah.com>
References: <1480458434-22523-1-git-send-email-fancer.lancer@gmail.com>
 <1481638971-6247-1-git-send-email-fancer.lancer@gmail.com>
 <1481638971-6247-2-git-send-email-fancer.lancer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1481638971-6247-2-git-send-email-fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 13, 2016 at 05:22:50PM +0300, Serge Semin wrote:
> +struct idt_89hpesx_dev {
> +	u32 eesize;
> +	bool eero;
> +	u8 eeaddr;
> +
> +	u8 inieecmd;
> +	u8 inicsrcmd;
> +	u8 iniccode;
> +
> +	atomic_t csr;

Why is this an atomic_t and not just a "normal" u32 or u64?  I don't see
the need for an atomic variable at all here, do you?


> +
> +	int (*smb_write)(struct idt_89hpesx_dev *, const struct idt_smb_seq *);
> +	int (*smb_read)(struct idt_89hpesx_dev *, struct idt_smb_seq *);
> +	struct mutex smb_mtx;
> +
> +	struct i2c_client *client;
> +
> +	struct bin_attribute *ee_file;
> +	struct dentry *csr_dir;
> +	struct dentry *csr_file;
> +};

<snip>

> +
> +static int idt_create_dbgfs_files(struct idt_89hpesx_dev *pdev)
> +{
> +	struct device *dev = &pdev->client->dev;
> +	struct i2c_client *cli = pdev->client;
> +	char fname[CSRNAME_LEN];
> +
> +	/* Initialize basic value of CSR debugfs dentries */
> +	pdev->csr_dir = NULL;
> +	pdev->csr_file = NULL;
> +
> +	/* Return failure if root directory doesn't exist */
> +	if (!csr_dbgdir) {
> +		dev_dbg(dev, "No Debugfs root directory");
> +		return -EINVAL;
> +	}

If debugfs is not enabled, don't error out, just keep going, it should
never stop kernel code from running properly.

Also, this test isn't really doing what you think it is doing...

> +	/* Create Debugfs directory for CSR file */
> +	snprintf(fname, CSRNAME_LEN, "%d-%04hx", cli->adapter->nr, cli->addr);
> +	pdev->csr_dir = debugfs_create_dir(fname, csr_dbgdir);
> +	if (IS_ERR_OR_NULL(pdev->csr_dir)) {
> +		dev_err(dev, "Failed to create CSR node directory");
> +		return -EINVAL;

Again, don't do this, you really don't care if debugfs worked or not.

> +	}
> +
> +	/* Create Debugfs file for CSR read/write operations */
> +	pdev->csr_file = debugfs_create_file(cli->name, 0600,
> +		pdev->csr_dir, pdev, &csr_dbgfs_ops);
> +	if (IS_ERR_OR_NULL(pdev->csr_file)) {
> +		dev_err(dev, "Failed to create CSR dbgfs-node");
> +		debugfs_remove_recursive(pdev->csr_dir);
> +		return -EINVAL;

Same here, just create the file and move on.

> +	}
> +
> +	dev_dbg(dev, "Debugfs-files created");

You do know about ftrace, right?  Please remove all of these
"trace-like" debugging lines, they aren't needed for anyone.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
