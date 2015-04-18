From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH 1/2] tee: generic TEE subsystem
Date: Sat, 18 Apr 2015 10:57:12 +0200
Message-ID: <20150418085712.GB29858@kroah.com>
References: <1429257057-7935-1-git-send-email-jens.wiklander@linaro.org>
 <1429257057-7935-2-git-send-email-jens.wiklander@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1429257057-7935-2-git-send-email-jens.wiklander@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, javier@javigon.com, Herbert Xu <herbert@gondor.apana.org.au>, tpmdd-devel@lists.sourceforge.net, valentin.manea@huawei.com, jean-michel.delorme@st.com, emmanuel.michel@st.com
List-Id: devicetree@vger.kernel.org

On Fri, Apr 17, 2015 at 09:50:56AM +0200, Jens Wiklander wrote:
> +struct tee_device {
> +	char name[TEE_MAX_DEV_NAME_LEN];
> +	const struct tee_desc *desc;
> +	struct device *dev;

No, please embed the device in your structure, don't have a pointer to
it.

> +	struct miscdevice miscdev;

This can be a pointer, as the lifecycle of your device is not dictated
by the miscdevice, but rather the 'struct device'.

> +
> +	void *driver_data;

You don't need this, use 'struct device''s pointer instead.

> +
> +	struct list_head list_shm;
> +	struct tee_shm_pool *pool;
> +};
