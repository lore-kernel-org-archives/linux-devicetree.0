From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] mod_devicetable: helper macro for declaring oftree
 module device table
Date: Wed, 24 Apr 2019 15:28:46 +0200
Message-ID: <20190424132846.GA19385@kroah.com>
References: <1556104081-16217-1-git-send-email-info@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1556104081-16217-1-git-send-email-info@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, heikki.krogerus@linux.intel.com, f.fainelli@gmail.com, rpjday@crashcourse.ca, dvhart@infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 24, 2019 at 01:08:01PM +0200, Enrico Weigelt, metux IT consult wrote:
> Little helper macro that declares an oftree module device table,
> if CONFIG_OF is enabled. Otherwise it's just noop.
> 
> This is also helpful if some drivers can be built w/ or w/o
> oftree support.
> 
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

As I said before, please drop all "non-name" information from your s-o-b
line.



> ---
>  include/linux/mod_devicetable.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index 448621c..853e301 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -245,6 +245,15 @@ struct of_device_id {
>  	const void *data;
>  };
>  
> +/*
> + * macro for adding the of module device table only if CONFIG_OF enabled
> + */
> +#ifdef CONFIG_OF
> +#define MODULE_DEVICE_TABLE_OF(name)	MODULE_DEVICE_TABLE(of,name)
> +#else
> +#define MODULE_DEVICE_TABLE_OF(name)
> +#endif /* CONFIG_OF */

Do you have a real user of this?  We need that for any type of apis that
people are supposed to use, we do not just add them without users if at
all possible.

And did you run it through checkpatch.pl before sending this?  :(

thanks,

greg k-h
