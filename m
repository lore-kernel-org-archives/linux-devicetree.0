From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 3/5] gpio: raspberrypi-exp: Driver for RPi3 GPIO
 expander via mailbox service
Date: Thu, 22 Feb 2018 13:50:50 +0100
Message-ID: <CACRpkdbJyS6K_JKTVRkQjj9AhKO0UegrAt2o2zeQkJCGBLgTHA@mail.gmail.com>
References: <cover.1519128054.git.baruch@tkos.co.il>
 <8c34f287ee72b340fa9d693aa0e304b25541c74c.1519128054.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <8c34f287ee72b340fa9d693aa0e304b25541c74c.1519128054.git.baruch@tkos.co.il>
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

> From: Dave Stevenson <dave.stevenson@raspberrypi.org>
>
> Pi3 and Compute Module 3 have a GPIO expander that the
> VPU communicates with.
> There is a mailbox service that now allows control of this
> expander, so add a kernel driver that can make use of it.
>
> Reviewed-by: Stefan Wahren <stefan.wahren@i2se.com>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v5:
>   * Use the parent node to find the firmware

This v5 version applied to the GPIO tree for v4.17.

Yours,
Linus Walleij
