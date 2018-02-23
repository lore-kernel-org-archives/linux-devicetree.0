From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 04/10] pinctrl: actions: Add Actions S900 pinctrl driver
Date: Fri, 23 Feb 2018 16:07:51 +0100
Message-ID: <CACRpkdZNVv1=WngCaXF9Mrmw7e=KugG7gJpYF7mr9RAbcsNu=g@mail.gmail.com>
References: <20180221160044.15089-1-manivannan.sadhasivam@linaro.org>
 <20180221160044.15089-5-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180221160044.15089-5-manivannan.sadhasivam@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, hzhang@ucrobotics.com, bdong@ucrobotics.com, liuwei@actions-semi.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, mp-cs@actions-semi.com, 96boards@ucrobotics.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 21, 2018 at 5:00 PM, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> Add pinctrl driver for Actions Semi S900 SoC. The driver supports
> pinctrl, pinmux and pinconf functionalities through a range of registers
> common to both gpio driver and pinctrl driver.
>
> Pinmux functionality is available only for the pin groups while the
> pinconf functionality is available for both pin groups and individual
> pins.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Looks very good overall.

Can I get Andreas' feedback and ACK on this?

It would be awesome if someone from Actions could also
ACK or drop some comments.

Actions was an early adopter of the pin control framework (it was
used already on ATM7029), so I would appreciate their feedback.

Yours,
Linus Walleij
