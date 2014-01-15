From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 4/7] ARM: brcmstb: add CPU binding for Broadcom Brahma15
Date: Wed, 15 Jan 2014 16:58:26 +0000
Message-ID: <20140115165825.GJ25824@e106331-lin.cambridge.arm.com>
References: <1389743333-16741-1-git-send-email-marc.ceeeee@gmail.com>
 <1389743333-16741-5-git-send-email-marc.ceeeee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1389743333-16741-5-git-send-email-marc.ceeeee@gmail.com>
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

On Tue, Jan 14, 2014 at 11:48:50PM +0000, Marc Carino wrote:
> Add the Broadcom Brahma B15 CPU to the DT CPU binding list.
> 
> Signed-off-by: Marc Carino <marc.ceeeee@gmail.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/cpus.txt |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
> index 9130435..423b879 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.txt
> +++ b/Documentation/devicetree/bindings/arm/cpus.txt
> @@ -163,6 +163,7 @@ nodes to be present and contain the properties described below.
>  			    "arm,cortex-r4"
>  			    "arm,cortex-r5"
>  			    "arm,cortex-r7"
> +			    "brcm,brahma15"

Given all the documentation I can find online calls the CPU
"Brahma-B15", would it not make more sense for this to be
"brcm,brahma-b15"? 

That would match what we do for the ARM Cortex-[ar]\d processors.

Otherwise, this looks fine to me.

Cheers,
Mark.
