From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: pinctrl: qcom: add gpio-ranges,
 gpio-reserved-ranges
Date: Thu, 28 Jun 2018 16:29:45 +0200
Message-ID: <CACRpkdaZfeEQyqK9UXWnm1_5ihc7abbVGbUmJQU8Z6SzpObM6g@mail.gmail.com>
References: <6dbaadee4bb22638a2c2e6433e8d1740884ecfd9.1527505307.git.chunkeey@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <6dbaadee4bb22638a2c2e6433e8d1740884ecfd9.1527505307.git.chunkeey@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Christian Lamparter <chunkeey@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, David Brown <david.brown@linaro.org>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sven Eckelmann <sven.eckelmann@openmesh.com>, Andy Gross <andy.gross@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 28, 2018 at 1:06 PM Christian Lamparter <chunkeey@gmail.com> wrote:

> This patch adds the gpio-ranges and gpio-reserved-ranges property
> definitions to the binding text files supported by the pinctrl-msm
> driver framework.
>
> gpio-ranges:
> For DT-based platforms the pinctrl-msm framework currently relies
> on the deprecated-for-DT gpiochip_add_pin_range() function to add
> the range of GPIOs to be handled by the pin controller. Due to
> interactions within gpiolib code, this causes the pinctrl-msm
> driver to bail out (-517) during boot when a gpio-hog is declared.
> This can be fatal and cause the system to not boot or reset
> (for a detailed explanation and call-trace, refer to patch:
> "pinctrl: msm: fix gpio-hog related boot issues" in this series).
>
> gpio-reserved-ranges:
> The binding has been added as a precaution since the TrustZone
> firmware (aka QSEE), which is running as the hypervisor, might
> have reserved certain, but undisclosed pins. Hence reading or
> writing to the registers for those pins will cause an
> XPU violation and this subsequently crashes the kernel.
>
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>

Patch applied with Rob's review tag.
I assume Bjorn is in on this as well as he's ACKed the main
DTS changes.

Yours,
Linus Walleij
