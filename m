From: Bo Shen <voice.shen@atmel.com>
Subject: Re: [RFC PATCH 02/13] misc: atmel_ssc: keep the count of pdev->id
Date: Tue, 2 Jul 2013 11:03:52 +0800
Message-ID: <51D24318.40908@atmel.com>
References: <1372667978-4718-1-git-send-email-richard.genoud@gmail.com> <1372667978-4718-3-git-send-email-richard.genoud@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1372667978-4718-3-git-send-email-richard.genoud@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Genoud <richard.genoud@gmail.com>
Cc: devicetree-discuss@lists.ozlabs.org, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Hi Richard,

On 7/1/2013 16:39, Richard Genoud wrote:
> With device tree, pdev->id is always -1, so we introduce a local
> counter.
>
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
> ---
>   drivers/misc/atmel-ssc.c |    7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/misc/atmel-ssc.c b/drivers/misc/atmel-ssc.c
> index 3afbd82..d1ec5ab 100644
> --- a/drivers/misc/atmel-ssc.c
> +++ b/drivers/misc/atmel-ssc.c
> @@ -173,6 +173,12 @@ out:
>   	return err;
>   }
>
> +/* counter of ssc devive instances.
> + * With device tree pdev->id is always -1, so we have to keep the
> + * count ourselves
> + */
> +static int ssc_device_id;

Do we really need this? If Yes, would it better to get from device 
through of_alias_get_id?

> +
>   static int ssc_probe(struct platform_device *pdev)
>   {
>   	struct resource *regs;
> @@ -235,6 +241,7 @@ static int ssc_probe(struct platform_device *pdev)
>   	}
>
>   	spin_lock(&user_lock);
> +	pdev->id = ssc_device_id++;
>   	list_add_tail(&ssc->list, &ssc_list);
>   	spin_unlock(&user_lock);
>
>

Best Regards,
Bo Shen
