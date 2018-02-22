From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 2/5] dt-bindings: gpio: add raspberry pi GPIO expander
 binding
Date: Thu, 22 Feb 2018 13:49:31 +0100
Message-ID: <CACRpkdbRk3u+KWLLJFx1wB2BDb50d2QJ3b68wvrer1VOZ0tWQQ@mail.gmail.com>
References: <cover.1519128054.git.baruch@tkos.co.il>
 <f400b48cbcd8a138c39d4e8f63d6c1f569090dcc.1519128054.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <f400b48cbcd8a138c39d4e8f63d6c1f569090dcc.1519128054.git.baruch@tkos.co.il>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-gpio@vger.kernel.org, Eric Anholt <eric@anholt.net>, Michael Zoran <mzoran@crowfest.net>, Rob Herring <robh+dt@kernel.org>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, Dave Stevenson <dave.stevenson@raspberrypi.org>, Frank Rowand <frowand.list@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 20, 2018 at 1:19 PM, Baruch Siach <baruch@tkos.co.il> wrote:

> The Raspberry Pi 3 GPIO expander is controlled by the VC4 firmware over
> I2C. The firmware mailbox interface allows the ARM core to control the
> GPIO lines.
>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v5:
>   * Remove the 'firmware' property
>   * Note that the gpio node is a child of the firmware node

This v5 patch applied to the GPIO tree for v4.17 with Rob's ACK.

Yours,
Linus Walleij
