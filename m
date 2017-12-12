From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/6] pinctrl: stm32: Add STM32MP157 MPU support
Date: Tue, 12 Dec 2017 17:25:50 -0600
Message-ID: <20171212232550.f3275srnc6dj6ud3@rob-hp-laptop>
References: <1512742277-28205-1-git-send-email-ludovic.Barre@st.com>
 <1512742277-28205-4-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1512742277-28205-4-git-send-email-ludovic.Barre-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ludovic Barre <ludovic.Barre-qxv4g6HH51o@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 08, 2017 at 03:11:14PM +0100, Ludovic Barre wrote:
> From: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
> 
> This driver consists of 2 controllers due to a hole in mapping:
> -1 controller for GPIO bankA to K.
> -1 controller for GPIO bankZ.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
> Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
> ---
>  .../bindings/pinctrl/st,stm32-pinctrl.txt          |    2 +

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/pinctrl/stm32/Kconfig                      |    6 +
>  drivers/pinctrl/stm32/Makefile                     |    1 +
>  drivers/pinctrl/stm32/pinctrl-stm32mp157.c         | 2188 ++++++++++++++++++++
>  4 files changed, 2197 insertions(+)
>  create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32mp157.c
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
