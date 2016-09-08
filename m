From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 01/22] of: device: Support loading a module with OF
 based modalias
Date: Wed, 7 Sep 2016 19:58:09 -0500
Message-ID: <CAL_JsqLC-ucq03wLY65mwYXQJHC_mVoK3LOMfpXVpYhKXssLgA@mail.gmail.com>
References: <20160907213519.27340-1-stephen.boyd@linaro.org> <20160907213519.27340-2-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160907213519.27340-2-stephen.boyd@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <stephen.boyd@linaro.org>
Cc: Linux USB List <linux-usb@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>, Arnd Bergmann <arnd@arndb.de>, Felipe Balbi <balbi@kernel.org>, Peter Chen <peter.chen@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 7, 2016 at 4:34 PM, Stephen Boyd <stephen.boyd@linaro.org> wrote:
> In the case of ULPI devices, we want to be able to load the
> driver before registering the device so that we don't get stuck
> in a loop waiting for the phy module to appear and failing usb
> controller probe. Currently we request the ulpi module via the
> ulpi ids, but in the DT case we might need to request it with the
> OF based modalias instead. Add a common function that allows
> anyone to request a module with the OF based modalias.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: <devicetree@vger.kernel.org>
> Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
> ---
>  drivers/of/device.c       | 23 +++++++++++++++++++++++
>  include/linux/of_device.h |  6 ++++++
>  2 files changed, 29 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
