From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/3] pinctrl: qcom: ipq4019: add most remaining pin definitions
Date: Mon, 31 Jul 2017 15:17:29 +0200
Message-ID: <CACRpkdZ5Gi6y0ce-u6Z7fx-TMBBAwyGvDDWBXG0BodF5D2AWiw@mail.gmail.com>
References: <d45ae31e888ad858d9f4396cabb4dc32a3f0365e.1500038134.git.chunkeey@googlemail.com>
 <941e3869bdeddb2bebcc52ebfd57efe014887bc6.1500038134.git.chunkeey@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <941e3869bdeddb2bebcc52ebfd57efe014887bc6.1500038134.git.chunkeey@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ram Chandra Jangir <rjangir@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, John Crispin <john@phrozen.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 14, 2017 at 4:14 PM, Christian Lamparter
<chunkeey@googlemail.com> wrote:

> From: Ram Chandra Jangir <rjangir@codeaurora.org>
>
> This patch adds multiple pinctrl functions and mappings
> for SDIO, NAND, I2S, WIFI, PCIE, LEDs, etc... that have
> been missing from the current minimal version.
>
> This patch has been updated from the original version
> that was posted by Ram Chandra Jangir on the LEDE-DEV ML:
> <https://patchwork.ozlabs.org/patch/752962/>. A short
> summary of the changes are documented in the device-tree
> patch of this series:
> "dt-bindings: pinctrl: add most other IPQ4019 pin functions and groups"
>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: John Crispin <john@phrozen.org>
> Signed-off-by: Ram Chandra Jangir <rjangir@codeaurora.org>
> Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>

Patch applied with Bj=C3=B6rn's ACK.

Yours,
Linus Walleij
