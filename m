From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 3/4] ARM: dts: qcom: add gpio-ranges property
Date: Thu, 24 May 2018 10:05:16 +0200
Message-ID: <CACRpkdZ2QAuQDjkqERESmf7Lbr69XSaHj2JCO9hf8a6YiNP2RA@mail.gmail.com>
References: <270904bcbf03a6b6ac3150f4a7daa15aa7e97586.1526935804.git.chunkeey@gmail.com>
 <910e5a85a6a8020069996e2ff397c93e9c5fe18c.1526935804.git.chunkeey@gmail.com>
 <0ae3376606a89bcdf3fe753a5c967f7103699e09.1526935804.git.chunkeey@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <0ae3376606a89bcdf3fe753a5c967f7103699e09.1526935804.git.chunkeey@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Christian Lamparter <chunkeey@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, David Brown <david.brown@linaro.org>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sven Eckelmann <sven.eckelmann@openmesh.com>, Andy Gross <andy.gross@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 21, 2018 at 10:57 PM, Christian Lamparter
<chunkeey@gmail.com> wrote:

> This patch adds the gpio-ranges property to almost all of
> the Qualcomm ARM platforms that utilize the pinctrl-msm
> framework.
>
> The gpio-ranges property is part of the gpiolib subsystem.
> As a result, the binding text is available in section
> "2.1 gpio- and pin-controller interaction" of
> Documentation/devicetree/bindings/gpio/gpio.txt
>
> For more information please see the patch titled:
> "pinctrl: msm: fix gpio-hog related boot issues" from
> this series.
>
> Reported-by: Sven Eckelmann <sven.eckelmann@openmesh.com>
> Tested-by: Sven Eckelmann <sven.eckelmann@openmesh.com> [ipq4019]
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I guess Andy will apply this?

Yours,
Linus Walleij
