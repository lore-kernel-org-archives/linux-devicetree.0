From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 02/22] of: device: Export of_device_{get_modalias,uvent_modalias}
 to modules
Date: Wed, 7 Sep 2016 19:58:43 -0500
Message-ID: <CAL_JsqKE=K+p6dtgfEP7pCij07BfyOBw_scLV6O1eEn8N9hsAQ@mail.gmail.com>
References: <20160907213519.27340-1-stephen.boyd@linaro.org> <20160907213519.27340-3-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160907213519.27340-3-stephen.boyd@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <stephen.boyd@linaro.org>
Cc: Linux USB List <linux-usb@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>, Arnd Bergmann <arnd@arndb.de>, Felipe Balbi <balbi@kernel.org>, Peter Chen <peter.chen@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 7, 2016 at 4:34 PM, Stephen Boyd <stephen.boyd@linaro.org> wrote:
> The ULPI bus can be built as a module, and it will soon be
> calling these functions when it supports probing devices from DT.
> Export them so they can be used by the ULPI module.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: <devicetree@vger.kernel.org>
> Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
> ---
>  drivers/of/device.c | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
