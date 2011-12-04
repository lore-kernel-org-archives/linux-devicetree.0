From: Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] arm, davinci: configure davinci aemif chipselects through
 OF
Date: Sun, 04 Dec 2011 16:33:59 +0400
Message-ID: <4EDB68B7.8080609@mvista.com>
References: <1322991679-20947-1-git-send-email-hs@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1322991679-20947-1-git-send-email-hs-ynQEQJNshbs@public.gmane.org>
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

On 04-12-2011 13:41, Heiko Schocher wrote:

> Signed-off-by: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
> Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
> Cc: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
> Cc: Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>
> Cc: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
[...]

> diff --git a/Documentation/devicetree/bindings/arm/davinci/aemif.txt b/Documentation/devicetree/bindings/arm/davinci/aemif.txt
> new file mode 100644
> index 0000000..c9ed551
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/davinci/aemif.txt
> @@ -0,0 +1,85 @@
> +* Texas Instruments Davinci AEMIF
> +
> +This file provides information, what the device node for the
> +davinci aemifa interface contain.
[...]
> +Example (enbw_cmc board):
> +	aemif@60000000 {
> +		compatible = "ti,davinci-emifa";
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +		reg = <0x68000000 0x80000>;
> +		ranges = <2 0 0x60000000 0x02000000
> +			  3 0 0x62000000 0x02000000
> +			  4 0 0x64000000 0x02000000
> +			  5 0 0x66000000 0x02000000>;
> +		cs2@0x60000000 {

    0x shouldn't be included.

> +			compatible = "ti,davinci-cs";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			/* all timings in nanoseconds */
> +			cs = <2>;
> +			asize = <1>;
> +			ta = <0>;
> +			rhold = <7>;
> +			rstrobe = <42>;
> +			rsetup = <14>;
> +			whold = <7>;
> +			wstrobe = <42>;
> +			wsetup = <14>;
> +			ew = <0>;
> +			ss = <0>;
> +		};
> +		flash@2,0 {

   Why you have one kind of address for cs2@60000000 node and other kind for 
this node?

WBR, Sergei
