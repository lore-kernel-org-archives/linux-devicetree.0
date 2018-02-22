From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 4/5] ARM: dts: bcm2835: make the firmware node into a
 bus
Date: Thu, 22 Feb 2018 13:51:32 +0100
Message-ID: <CACRpkdZj0Q8iu5rmqW2ZkrwhzPD0xuHV63P9zEyhSLFUrh5QiA@mail.gmail.com>
References: <cover.1519128054.git.baruch@tkos.co.il>
 <43f9082a6835df6d7bcd3e16d79db687c52826d2.1519128054.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <43f9082a6835df6d7bcd3e16d79db687c52826d2.1519128054.git.baruch@tkos.co.il>
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

> This allows adding devices for which the firmware exposes control interface
> via the mailbox. An example of such device is the GPIO expander.
>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v4: New patch in this series

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please funnel this patch through the ARM SoC tree.

Yours,
Linus Walleij
