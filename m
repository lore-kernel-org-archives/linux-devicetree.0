From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4] ARM: dts: stm32: change pinctrl bindings definition
Date: Mon, 11 Sep 2017 16:07:21 -0500
Message-ID: <20170911210721.ga6hjkksgzashzrc@rob-hp-laptop>
References: <1504104653-26804-1-git-send-email-alexandre.torgue@st.com>
 <1504104653-26804-2-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1504104653-26804-2-git-send-email-alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Cc: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vikas.manocha-qxv4g6HH51o@public.gmane.org, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 30, 2017 at 04:50:53PM +0200, Alexandre Torgue wrote:
> Initially each pin was declared in "include/dt-bindings/stm32<SOC>-pinfunc.h"
> and each definition contained SOC names (ex: STM32F429_PA9_FUNC_USART1_TX).
> Since this approach was approved, the number of supported MCU has
> increased (STM32F429/STM32F469/STM32f746/STM32H743). To avoid to add a new
> file in "include/dt-bindings" each time a new STM32 SOC arrives I propose
> a new approach which consist to use a macro to define pin muxing in device
> tree. All STM32 will use the common macro to define pinmux. Furthermore, it
> will make STM32 maintenance and integration of new SOC easier .
> 
> Signed-off-by: Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
> Reviewed-by: Vikas MANOCHA <vikas.manocha-qxv4g6HH51o@public.gmane.org>
> Reviewed-by: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
