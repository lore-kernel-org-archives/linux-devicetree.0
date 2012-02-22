From: Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/7] ARM: davinci, intc: Add OF support for TI interrupt
 controller
Date: Wed, 22 Feb 2012 16:23:00 +0400
Message-ID: <4F44DE24.30606@mvista.com>
References: <1329893410-24413-1-git-send-email-hs@denx.de>
 <1329893410-24413-2-git-send-email-hs@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1329893410-24413-2-git-send-email-hs-ynQEQJNshbs@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 22-02-2012 10:50, Heiko Schocher wrote:

> Add a function to initialize the davinci interrupt controller (INTC)
> using a device tree node.

    cp_intc is not DaVinci interrupt controller, it's only used in OMAP-L1x 
SoCs. cp_intc stands for Common Platform Interrupt Controller. I don't see 
where you are initializiing the DaVinci interrupt controller itself. You 
should understand that there are two disctinct types of interrupt controllers 
used in the SoCs supported by arch/arm/mach-davinci/.

> Signed-off-by: Heiko Schocher<hs-ynQEQJNshbs@public.gmane.org>
> Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Cc: Grant Likely<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Cc: Sekhar Nori<nsekhar-l0cyMroinI0@public.gmane.org>
> Cc: Wolfgang Denk<wd-ynQEQJNshbs@public.gmane.org>

[...]

> diff --git a/Documentation/devicetree/bindings/arm/davinci/intc.txt b/Documentation/devicetree/bindings/arm/davinci/intc.txt
> new file mode 100644
> index 0000000..dac2f69
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/davinci/intc.txt
> @@ -0,0 +1,26 @@
> +* TI Davinci Interrupt Controller
> +
> +davinci are using a TI interrupt controller that can support several
> +configurable number of interrupts.
> +
> +Main node required properties:
> +
> +- compatible : should be:
> +	"ti,davinci-intc"

    The right "compatible" prop would be "ti,cp_intc" in this case.

WBR, Sergei
