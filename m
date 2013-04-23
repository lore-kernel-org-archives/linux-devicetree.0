From: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Subject: Re: [RFC PATCH v2 12/13] ARM: mach-vt8500: cpus/cpu nodes dts updates
Date: Tue, 23 Apr 2013 14:43:48 +1200
Message-ID: <5175F564.8030405@prisktech.co.nz>
References: <1366644455-16550-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1366644455-16550-13-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1366644455-16550-13-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Lennert Buytenhek <kernel-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Barry Song <baohua.song-kQvG35nSl+M@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vinayak Kale <vkale-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 23/04/13 03:27, Lorenzo Pieralisi wrote:
> This patch updates the in-kernel dts files according to the latest cpus
> and cpu bindings updates for ARM.
>
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> ---
>   arch/arm/boot/dts/wm8505.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/wm8505.dtsi b/arch/arm/boot/dts/wm8505.dtsi
> index e74a1c0..a470808 100644
> --- a/arch/arm/boot/dts/wm8505.dtsi
> +++ b/arch/arm/boot/dts/wm8505.dtsi
> @@ -13,7 +13,7 @@
>   
>   	cpus {
>   		cpu@0 {
> -			compatible = "arm,arm926ejs";
> +			compatible = "arm,arm926";
>   		};
>   	};
>   
The more I look at this, the more wrong it is :/

 From the new binding documentation,

+	A cpus node must define the following properties:
+
+	- #address-cells
+		Usage: required
+		Value type: <u32>
+		Definition: must be set to 1 for 32-bit systems and 2 for
+			    64-bit systems
+	- #size-cells
+		Usage: required
+		Value type: <u32>
+		Definition: must be set to 0

...

+- cpu node
+
+	Description: Describes a CPU in an ARM based system
+
+	PROPERTIES
+
+	- device_type
+		Usage: required
+		Value type: <string>
+		Definition: must be "cpu"

Three required properties that aren't present in the patch.

cpus {
     #size-cells = <0>;
     #address-cells = <1>;

     cpu {
         device_type = "cpu"
         compatible = "arm,arm926";
     };
};

Regards
Tony P
