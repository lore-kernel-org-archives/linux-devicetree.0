From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 5/5] ARM: dts: bcm2837-rpi-3-b: add GPIO expander
Date: Thu, 22 Feb 2018 13:52:17 +0100
Message-ID: <CACRpkdaOv8yH2M8DVy-owY3zFGwAo52YCFksxEchjQyK3h47=A@mail.gmail.com>
References: <cover.1519128054.git.baruch@tkos.co.il>
 <a6d59692dc4847e0b1639a26542e28c95ad5240f.1519128054.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <a6d59692dc4847e0b1639a26542e28c95ad5240f.1519128054.git.baruch@tkos.co.il>
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

> Add a description of the RPi3 GPIO expander that the VC4 firmware controls.
>
> Acked-by: Stefan Wahren <stefan.wahren@i2se.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v5:
>   * Drop the 'firmware' property

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please funnel this patch through the ARM SoC tree.

Yours,
Linus Walleij
