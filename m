From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 6/7] ARM: brcmstb: gic: add compatible string for
 Broadcom Brahma15
Date: Wed, 15 Jan 2014 17:20:05 +0000
Message-ID: <20140115172005.GL25824@e106331-lin.cambridge.arm.com>
References: <1389743333-16741-1-git-send-email-marc.ceeeee@gmail.com>
 <1389743333-16741-7-git-send-email-marc.ceeeee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1389743333-16741-7-git-send-email-marc.ceeeee@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Carino <marc.ceeeee@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Christian Daudt <bcm@fixthebug.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matt Porter <matt.porter@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 14, 2014 at 11:48:52PM +0000, Marc Carino wrote:
> Document the Broadcom Brahma B15 GIC implementation as compatible
> with the ARM GIC standard.
> 
> Signed-off-by: Marc Carino <marc.ceeeee@gmail.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/gic.txt |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/gic.txt b/Documentation/devicetree/bindings/arm/gic.txt
> index 3dfb0c0..b7d7970 100644
> --- a/Documentation/devicetree/bindings/arm/gic.txt
> +++ b/Documentation/devicetree/bindings/arm/gic.txt
> @@ -15,6 +15,7 @@ Main node required properties:
>  	"arm,cortex-a9-gic"
>  	"arm,cortex-a7-gic"
>  	"arm,arm11mp-gic"
> +	"brcm,brahma15-gic"

Similarly to the cpu binding patch, I think this should be
"brcm,brahma-b15-gic".

It doesn't have to be done here, but it might make sense to add
"arm,gic-v2" for arbitrary GICv2 implementations to use as a fallback
compatible string.

Cheers,
Mark.
