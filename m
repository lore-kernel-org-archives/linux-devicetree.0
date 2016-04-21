From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 02/18] dmaengine: st_fdma:  Add STMicroelectronics FDMA driver header file
Date: Thu, 21 Apr 2016 13:20:03 +0200
Message-ID: <3852823.Jd9ACgHlZU@wuerfel>
References: <1461236675-10176-1-git-send-email-peter.griffin@linaro.org> <1461236675-10176-3-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461236675-10176-3-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 21 April 2016 12:04:19 Peter Griffin wrote:
> Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Please add a changelog text for each patch.

>  drivers/dma/st_fdma.h | 281 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 281 insertions(+)
>  create mode 100644 drivers/dma/st_fdma.h

When the header file is only included from one other file, it's
usually better to move the entire contents into the .c file.

> +#define fdma_read(fdev, name) \
> +	readl_relaxed((fdev)->io_base + FDMA_##name##_OFST)
> +
> +#define fdma_write(fdev, val, name) \
> +	writel_relaxed((val), (fdev)->io_base + FDMA_##name##_OFST)

Try to avoid string concatenation for macro names. It's better
to always pass the full name of the register in there to make
it easier to grep for the usage when trying to understand the
driver as a reader.

Once you do that, just convert the macro into an inline function.

> +bool st_fdma_filter_fn(struct dma_chan *chan, void *param);

The filter function should not be needed here.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
