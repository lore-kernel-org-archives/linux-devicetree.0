From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/6] crypto: atmel-ecc: add support for ACPI probing on
 non-AT91 platforms
Date: Fri, 24 May 2019 23:52:04 +0200
Message-ID: <CACRpkdZsd+f6ajGKu71y13D7_6aEM_x6d4bJ0dLtGv7GmUYujg@mail.gmail.com>
References: <20190524162651.28189-1-ard.biesheuvel@linaro.org>
 <20190524162651.28189-3-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190524162651.28189-3-ard.biesheuvel@linaro.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Tudor Ambarus <tudor.ambarus@microchip.com>, linux-crypto@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 24, 2019 at 6:27 PM Ard Biesheuvel
<ard.biesheuvel@linaro.org> wrote:

> The Atmel/Microchip EC508A is a I2C device that could be wired into
> any platform, and is being used on the Linaro/96boards Secure96
> mezzanine adapter. This means it could be found on any platform, even
> on ones that use ACPI enumeration (via PRP0001 devices). So update the
> code to enable this use case.
>
> This involves tweaking the bus rate discovery code to take ACPI probing
> into account, which records the maximum bus rate as a property of the
> slave device. For the atmel-ecc code, this means that the effective bus
> rate should never exceed the maximum rate, unless we are dealing with
> buggy firmware. Nonetheless, let's just use the existing plumbing to
> discover the bus rate and keep the existing logic intact.
>
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

Looks good to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
