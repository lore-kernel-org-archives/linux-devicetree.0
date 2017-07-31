From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: add most other IPQ4019 pin
 functions and groups
Date: Mon, 31 Jul 2017 15:15:53 +0200
Message-ID: <CACRpkdZ6b0brtq=X-iY5FQT1WCC3AY9a+3q2q3ws8qYtWJGM9w@mail.gmail.com>
References: <d45ae31e888ad858d9f4396cabb4dc32a3f0365e.1500038134.git.chunkeey@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d45ae31e888ad858d9f4396cabb4dc32a3f0365e.1500038134.git.chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Varadarajan Narayanan <varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ram Chandra Jangir <rjangir-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 14, 2017 at 4:14 PM, Christian Lamparter
<chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:

> This patch adds the remaining pin functions and mux groups.
> All unknown and debug functions are omitted. Existing functions
> for qpic, sdio, rgmii, rmii, wifi/d are squashed together as
> much as possible. And only in case of a clash, the individually
> named functions have been kept. The exceptions are:
>         led0-11
>         i2s_rx, i2s_tx, i2s_td, i2s_spdif_in, i2s_spdif_out,
>         smart0-3
>
> Cc: Varadarajan Narayanan <varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Ram Chandra Jangir <rjangir-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>

Patch applied with Bj=C3=B6rn's ACK.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
