From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V5 3/6] slimbus: Add messaging APIs to slimbus framework
Date: Thu, 28 Apr 2016 11:52:40 +0200
Message-ID: <3946038.VbkgOjgKu3@wuerfel>
References: <1461801489-16254-1-git-send-email-sdharia@codeaurora.org> <1461801489-16254-4-git-send-email-sdharia@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461801489-16254-4-git-send-email-sdharia@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sagar Dharia <sdharia@codeaurora.org>
Cc: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, broonie@kernel.org, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, sheetal.tigadoli@gmail.com, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wednesday 27 April 2016 17:58:06 Sagar Dharia wrote:

> +	ctrl->tx.base = dma_alloc_coherent(ctrl->dev.parent,
> +					   (ctrl->tx.sl_sz * ctrl->tx.n),
> +					   &ctrl->tx.phy, GFP_KERNEL);
> +	if (!ctrl->tx.base) {
> +		ret = -ENOMEM;
> +		goto tx_alloc_failed;
> +	}

This looks controller specific, and hints that some parts of the "common"
framework should actually be part of the controller driver instead.

In particular, the use of "ctrl->dev.parent" suggests that this should
have been allocated by the controller.

> @@ -162,6 +279,15 @@ struct slim_controller {
>  	struct slim_addrt	*addrt;
>  	u8			num_dev;
>  	struct workqueue_struct *wq;
> +	struct slim_val_inf	*tid_tbl[SLIM_MAX_TIDS];
> +	u8			last_tid;
> +	spinlock_t		txn_lock;
> +	struct slim_ctrl_buf	tx;
> +	struct slim_ctrl_buf	rx;
> +	struct slim_pending	*pending_wr;
> +	struct semaphore	tx_sem;

Please try to avoid the use of semaphores in new code.

	Arnd
