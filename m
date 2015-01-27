From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v3 4/4] ARM: devicetree: document supported Conexant
 Digicolor SoC
Date: Tue, 27 Jan 2015 15:02:48 -0800
Message-ID: <20150127230248.GA11789@quad.lixom.net>
References: <cover.1421219953.git.baruch@tkos.co.il>
 <8ac384f1c15c05229d5534036a9a4000d908c0cf.1421219953.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8ac384f1c15c05229d5534036a9a4000d908c0cf.1421219953.git.baruch@tkos.co.il>
Sender: linux-kernel-owner@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: arm@kernel.org, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 14, 2015 at 10:40:33AM +0200, Baruch Siach wrote:
> Of the Digicolor SoCs series only CX92755 is currently supported.
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  Documentation/devicetree/bindings/arm/digicolor.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/digicolor.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/digicolor.txt b/Documentation/devicetree/bindings/arm/digicolor.txt
> new file mode 100644
> index 000000000000..658553f40b23
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/digicolor.txt
> @@ -0,0 +1,6 @@
> +Conexant Digicolor Platforms Device Tree Bindings
> +
> +Each device tree must specify which Conexant Digicolor SoC it uses.
> +Must be the following compatible string:
> +
> +  cnxt,cx92755

Applied, thanks.

-Olof
