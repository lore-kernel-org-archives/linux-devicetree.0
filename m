From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/1] dt-bindings: arm: document supported STM32 SoC family
Date: Thu, 14 Dec 2017 09:05:57 -0600
Message-ID: <CAL_JsqJ8+NrOOpg1VcC8ZVVtm3tFTL2qvj8GSkrPU91CWDqzDA@mail.gmail.com>
References: <1512741394-27341-1-git-send-email-ludovic.Barre@st.com>
 <20171212210348.proilmqmxf4yl5jn@rob-hp-laptop> <20171212231744.u4wtadrpaq3wp4sq@rob-hp-laptop>
 <16700917-a53a-c319-d27d-f447c6ed3dce@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <16700917-a53a-c319-d27d-f447c6ed3dce-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ludovic BARRE <ludovic.barre-qxv4g6HH51o@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gwenael Treuveur <gwenael.treuveur-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 13, 2017 at 2:40 AM, Ludovic BARRE <ludovic.barre-qxv4g6HH51o@public.gmane.org> wrote:
> hi Rob
>
> Today there was no bindings documentation for STM32 SoC
> already upstreamed. This patch adds initial list of STM32
> existing in kernel.
> The next serie adds just new soc and one compatible on STM32 list.

Yes, and that series will go thru arm-soc tree so this patch needs to too.

> So, I think you could apply this patch.

If your series is not going into 4.16, then I can take this one.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
