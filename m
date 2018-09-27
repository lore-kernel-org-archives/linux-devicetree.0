From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ARM: dts: realview: Fix SPI controller node names
Date: Thu, 27 Sep 2018 09:27:46 +0200
Message-ID: <CACRpkdYY4aVJLEM3wE9_GPnnBg9S4StuQNt_4TDZHOMUQk4w8A@mail.gmail.com>
References: <20180913181245.25484-2-robh@kernel.org>
 <CAL_JsqJ9FMK1d24Fc-JTFh6sPn2svCUQx29UNLMzchDQJr5svA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqJ9FMK1d24Fc-JTFh6sPn2svCUQx29UNLMzchDQJr5svA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 27, 2018 at 1:15 AM Rob Herring <robh@kernel.org> wrote:
> On Thu, Sep 13, 2018 at 1:12 PM Rob Herring <robh@kernel.org> wrote:
> >
> > SPI controller nodes should be named 'spi' rather than 'ssp'. Fixing the
> > name enables dtc SPI bus checks.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > Please apply to the sub-arch tree. The dtc changes haven't landed, but
> > will for 4.20.
>
> Ping.
>
> Arnd, Olof, Can you pick this up if the sub-arch maintainer doesn't.

Sorry I'll pick it up and also send the patch listing myself as
subarch maintainer that got mysteriously lost as well. :/

Yours,
Linus Walleij
