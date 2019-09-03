From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCHv7] drivers/amba: add reset control to amba bus probe
Date: Tue, 3 Sep 2019 17:07:59 +0200
Message-ID: <CACRpkdZOn+P6R3RmQEyk-LQ9-g-ng-mVepghS6+Cic-6xMrNjg@mail.gmail.com>
References: <20190903141215.18283-1-dinguyen@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190903141215.18283-1-dinguyen@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, Frank Rowand <frowand.list@gmail.com>, Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, Daniel Thompson <daniel.thompson@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Philipp Zabel <p.zabel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 3, 2019 at 4:20 PM Dinh Nguyen <dinguyen@kernel.org> wrote:

> The primecell controller on some SoCs, i.e. SoCFPGA, is held in reset by
> default. Until recently, the DMA controller was brought out of reset by the
> bootloader(i.e. U-Boot). But a recent change in U-Boot, the peripherals
> that are not used are held in reset and are left to Linux to bring them
> out of reset.
>
> Add a mechanism for getting the reset property and de-assert the primecell
> module from reset if found. This is a not a hard fail if the reset properti
> is not present in the device tree node, so the driver will continue to
> probe.
>
> Because there are different variants of the controller that may have
> multiple reset signals, the code will find all reset(s) specified and
> de-assert them.
>
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please put this patch into Russell's patch tracker.

Yours,
Linus Walleij
