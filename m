From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 1/2] device: Add dev_of_node() accessor
Date: Tue, 17 Feb 2015 19:03:41 -0600
Message-ID: <CAL_Jsq+DVWQLVeA6qYZRSEZsk-gQHtktWcTFs=0hvkQtZutZCg@mail.gmail.com>
References: <1424059148.21410.37.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424059148.21410.37.camel@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Grant Likely <grant.likely@linaro.org>, Olof Johansson <olof@lixom.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

+Greg KH

On Sun, Feb 15, 2015 at 9:59 PM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> Suggested by Arnd Bergmann, this gives a practical accessor for
> the of_node field of struct device while instructing the compiler
> that it will be NULL if CONFIG_OF is not set.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---

I'll let Greg take this with the other patch:

Acked-by: Rob Herring <robh@kernel.org>

>
> This is what we discussed back in November and I had forgotten
> to finish :)
>
>  include/linux/device.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/include/linux/device.h b/include/linux/device.h
> index fb50673..08128288 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -916,6 +916,13 @@ static inline void device_lock_assert(struct device *dev)
>         lockdep_assert_held(&dev->mutex);
>  }
>
> +static inline struct device_node *dev_of_node(struct device *dev)
> +{
> +       if (!IS_ENABLED(CONFIG_OF))
> +               return NULL;
> +       return dev->of_node;
> +}
> +
>  void driver_init(void);
>
>  /*
>
>
>
