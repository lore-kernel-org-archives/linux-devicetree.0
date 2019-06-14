From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH 1/8] tpm: block messages while suspended
Date: Fri, 14 Jun 2019 18:27:00 +0300
Message-ID: <20190614152700.GE11241@linux.intel.com>
References: <20190613180931.65445-1-swboyd@chromium.org>
 <20190613180931.65445-2-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190613180931.65445-2-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, Andrey Pronin <apronin@chromium.org>, linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-integrity@vger.kernel.org, devicetree@vger.kernel.org, Duncan Laurie <dlaurie@chromium.org>, Guenter Roeck <groeck@chromium.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 13, 2019 at 11:09:24AM -0700, Stephen Boyd wrote:
> diff --git a/include/linux/tpm.h b/include/linux/tpm.h
> index 1b5436b213a2..48df005228d0 100644
> --- a/include/linux/tpm.h
> +++ b/include/linux/tpm.h
> @@ -132,6 +132,8 @@ struct tpm_chip {
>  	int dev_num;		/* /dev/tpm# */
>  	unsigned long is_open;	/* only one allowed */
>  
> +	unsigned long is_suspended;
> +
>  	char hwrng_name[64];
>  	struct hwrng hwrng;

I think it would better idea to have a bitmask of some sort that
would have bits for 'open' and 'suspended'.

/Jarkko
