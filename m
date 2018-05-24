From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 4/4] gpiolib: discourage gpiochip_add_pin[group]_range
 for DT pinctrls
Date: Thu, 24 May 2018 10:07:02 +0200
Message-ID: <CACRpkdbOTfoj293LO-nyPEbxwXOWRuNyTqwxb_MWoQ2wM3=-Hg@mail.gmail.com>
References: <270904bcbf03a6b6ac3150f4a7daa15aa7e97586.1526935804.git.chunkeey@gmail.com>
 <0ae3376606a89bcdf3fe753a5c967f7103699e09.1526935804.git.chunkeey@gmail.com>
 <910e5a85a6a8020069996e2ff397c93e9c5fe18c.1526935804.git.chunkeey@gmail.com>
 <2969992a1005d7e7f4ea23d4c684d2f10d4a0aca.1526935804.git.chunkeey@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2969992a1005d7e7f4ea23d4c684d2f10d4a0aca.1526935804.git.chunkeey@gmail.com>
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

> This patch adds the stern warning to the kerneldoc text of both
> gpiochip_add_pin[group]_range() functions in hope of detering
> developers from ever using them in their DeviceTree-supported
> pinctrl drivers in the future.
>
> For anyone affected: Please refer to Section 2.1 of
> Documentation/devicetree/bindings/gpio/gpio.txt on how to
> bind pinctrl and gpio drivers via the "gpio-ranges" property.
>
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>

I'm a big fan of this patch, so applied.

I wouldn't mind a pr_info() warning about it at runtime too,
but this is nice.

Yours,
Linus Walleij
