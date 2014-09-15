From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 2/2] mfd: stmpe: Document DT binding for irq_over_gpio
Date: Mon, 15 Sep 2014 16:13:03 -0700
Message-ID: <20140915231303.GM25162@lee--X1>
References: <1410491914-23378-1-git-send-email-xobs@kosagi.com>
 <1410491914-23378-3-git-send-email-xobs@kosagi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1410491914-23378-3-git-send-email-xobs@kosagi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Cross <xobs@kosagi.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, bunnie@kosagi.com
List-Id: devicetree@vger.kernel.org

On Fri, 12 Sep 2014, Sean Cross wrote:

> STMPE now supports using a GPIO as an IRQ source.  Document the devic=
e
> tree binding for this option.
>=20
> Signed-off-by: Sean Cross <xobs@kosagi.com>
> ---
>  Documentation/devicetree/bindings/mfd/stmpe.txt | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/stmpe.txt b/Docume=
ntation/devicetree/bindings/mfd/stmpe.txt
> index 56edb55..3fb68bf 100644
> --- a/Documentation/devicetree/bindings/mfd/stmpe.txt
> +++ b/Documentation/devicetree/bindings/mfd/stmpe.txt
> @@ -13,6 +13,7 @@ Optional properties:
>   - interrupt-parent             : Specifies which IRQ controller we'=
re connected to
>   - wakeup-source                : Marks the input device as wakable
>   - st,autosleep-timeout         : Valid entries (ms); 4, 16, 32, 64,=
 128, 256, 512 and 1024
> + - irq-gpio                     : If present, which GPIO to use for =
event IRQ
> =20
>  Example:
> =20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
