From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 6/6] dt-bindings: move Atmel ECC508A I2C crypto
 processor to trivial-devices
Date: Fri, 24 May 2019 14:43:01 -0500
Message-ID: <CAL_Jsq+=p+YA9emmZMhbCA75NM1ZksAx6mZkP1Fsype3SpK=TA@mail.gmail.com>
References: <20190524162651.28189-1-ard.biesheuvel@linaro.org>
 <20190524162651.28189-7-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190524162651.28189-7-ard.biesheuvel@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: devicetree@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, Tudor Ambarus <tudor.ambarus@microchip.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 24, 2019 at 11:27 AM Ard Biesheuvel
<ard.biesheuvel@linaro.org> wrote:
>
> Move the binding for the discrete Atmel I2C Elliptic Curve h/w crypto
> module to trivial-devices.yaml, as it doesn't belong in atmel-crypto
> which describes unrelated on-SoC peripherals.
>
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> ---
>  Documentation/devicetree/bindings/crypto/atmel-crypto.txt | 13 -------------
>  Documentation/devicetree/bindings/trivial-devices.yaml    |  2 ++
>  2 files changed, 2 insertions(+), 13 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
