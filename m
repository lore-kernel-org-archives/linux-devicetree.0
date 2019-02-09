From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: iio: adc: move lpc32xx-adc out of staging
Date: Sat, 9 Feb 2019 17:05:51 +0000
Message-ID: <20190209170551.38a8e3de@archlinux>
References: <20190208160944.13281-1-gregory.clement@bootlin.com>
 <20190208160944.13281-2-gregory.clement@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190208160944.13281-2-gregory.clement@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: devicetree@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Hartmut Knaack <knaack.h@gmx.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri,  8 Feb 2019 17:09:40 +0100
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> The drivers has been moved out since
> 0097e20e7771 ("staging:iio:adc:lpc32xx Move out of staging.") in v4.10,
> so let's align the binding documentation.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Oops. My fault.

You forgot the iio list on these so +cc

Applied to the togreg branch of iio.git and pushed out as testing for the
autobuilders to play with it.

Thanks,

Jonathan

> ---
>  .../devicetree/bindings/{staging => }/iio/adc/lpc32xx-adc.txt     | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/{staging => }/iio/adc/lpc32xx-adc.txt (100%)
> 
> diff --git a/Documentation/devicetree/bindings/staging/iio/adc/lpc32xx-adc.txt b/Documentation/devicetree/bindings/iio/adc/lpc32xx-adc.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/staging/iio/adc/lpc32xx-adc.txt
> rename to Documentation/devicetree/bindings/iio/adc/lpc32xx-adc.txt
