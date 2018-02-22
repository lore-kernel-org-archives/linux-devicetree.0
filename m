From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 1/5] ARM: bcm2835: sync firmware properties with
 downstream
Date: Thu, 22 Feb 2018 13:47:19 +0100
Message-ID: <CACRpkdZb79XBS-sZjJqx7bbphzRM1phM6-h8wRMBmiCe1VVnbw@mail.gmail.com>
References: <cover.1519128054.git.baruch@tkos.co.il>
 <e7d1f1d0789f11d37957a8998bee23d035115aeb.1519128054.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <e7d1f1d0789f11d37957a8998bee23d035115aeb.1519128054.git.baruch@tkos.co.il>
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

> Add latest firmware property tags from the latest Raspberry Pi downstream
> kernel. This is needed for the GPIO tags, so we can control the GPIO
> multiplexor lines.
>
> Acked-by: Stefan Wahren <stefan.wahren@i2se.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v4: No change

Patch applied to the GPIO tree for v4.17.

But I changed the subject from ARM: to soc:

Yours,
Linus Walleij
