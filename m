From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Conditionals in dtsi files
Date: Fri, 13 Nov 2015 10:43:11 +0100
Message-ID: <5151887.Q3EmlRO4WY@wuerfel>
References: <5645AE7E.4090003@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5645AE7E.4090003@free.fr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mason <slash.tmp@free.fr>
Cc: Grant Likely <grant.likely@linaro.org>, DT <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Friday 13 November 2015 10:33:50 Mason wrote:
> Hello,
> 
> I'm wondering how much C preprocessor syntax one can use in DT files.
> 
> Suppose I have 2 board DTS (both including common.dtsi)
> 
> board_A.dts (1-core), board_B.dts (2-core)
> 
> Can I have in common.dtsi something along these lines:
> 
> 	cpus {
> 		enable-method = "foo,bar";
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 
> 		cpu0: cpu@0 {
> 			compatible = "arm,cortex-a9";
> 			device_type = "cpu";
> 			reg = <0>;
> 		};
> 
> #if CORE_COUNT > 1
> 		cpu1: cpu@1 {
> 			compatible = "arm,cortex-a9";
> 			device_type = "cpu";
> 			reg = <1>;
> 		};
> #endif
> 	};
> 
> 
> board_A.dts would have
> #define CORE_COUNT 1
> #include "common.dtsi"
> 
> board_B.dts would have
> #define CORE_COUNT 2
> #include "common.dtsi"

I would prefer not using any preprocessor statements other than
#include in .dts files. It's easy enough to have a per-soc
.dtsi file that defines the CPU nodes and goes on to include another
.dtsi file with the common parts that are present on all SoCs.

Have a look at how the armada-*.dtsi files handle this.

	Arnd
