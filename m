From: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Subject: RE: [PATCH RFC v4 1/2] Devicetree: Add pl353 smc controller
 devicetree binding information
Date: Thu, 31 Jul 2014 15:22:41 +0000
Message-ID: <489fb996-363c-4e64-af32-51afcf7da4cd@BN1AFFO11FD005.protection.gbl>
References: <1406561236-29207-1-git-send-email-punnaia@xilinx.com>
 <f9cb28fc-6a68-42b8-bdc0-9ad0941de977@BN1AFFO11FD013.protection.gbl>
 <20140731071753.GH11952@brian-ubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20140731071753.GH11952@brian-ubuntu>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "jussi.kivilinna@iki.fi" <jussi.kivilinna@iki.fi>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, "arnd@arndb.de" <arnd@arndb.de>, Srikanth Vemula <svemula@xilinx.com>, Michal Simek <michals@xilinx.com>, "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Anirudha Sarangi <anirudh@xilinx.com>, "joern@logfs.org" <joern@logfs.org>, kpc528@gmai
List-Id: devicetree@vger.kernel.org

Hi Brian,

>-----Original Message-----
>From: Brian Norris [mailto:computersforpeace@gmail.com]
>Sent: Thursday, July 31, 2014 12:48 PM
>To: Punnaiah Choudary Kalluri
>Cc: robh+dt@kernel.org; pawel.moll@arm.com; mark.rutland@arm.com;
>ijc+devicetree@hellion.org.uk; galak@codeaurora.org; rob@landley.net;
>Michal Simek; grant.likely@linaro.org; gregkh@linuxfoundation.org;
>jason@lakedaemon.net; ezequiel.garcia@free-electrons.com;
>arnd@arndb.de; dwmw2@infradead.org; artem.bityutskiy@linux.intel.com;
>pekon@ti.com; jussi.kivilinna@iki.fi; acourbot@nvidia.com;
>ivan.khoronzhuk@ti.com; joern@logfs.org; devicetree@vger.kernel.org;
>linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
>mtd@lists.infradead.org; kpc528@gmail.com;
>kalluripunnaiahchoudary@gmail.com; Anirudha Sarangi; Srikanth Vemula;
>Punnaiah Choudary Kalluri; Boris Brezillon
>Subject: Re: [PATCH RFC v4 1/2] Devicetree: Add pl353 smc controller
>devicetree binding information
>
>Hi,
>
>On Mon, Jul 28, 2014 at 08:57:15PM +0530, Punnaiah Choudary Kalluri wrote:
>> Add pl353 static memory controller devicetree binding information.
>>
>> Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
>> ---
>> Changes in v4:
>>  - none
>> Changes in v3:
>>  - none
>> Changes in v2:
>>  - modified timing binding info as per onfi timing parameters
>
>^^^ There were other comments here:
>
>  http://lists.infradead.org/pipermail/linux-mtd/2014-April/053488.html
>
>You don't need or want these timing parameters at all, I don't think.

Ok. Understood
>
>>  - add suffix nano second as timing unit
>>  - modified the clock names as per the IP spec
>> ---
>>  .../bindings/memory-controllers/pl353-smc.txt      |   53
>++++++++++++++++++++
>>  1 files changed, 53 insertions(+), 0 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/memory-
>controllers/pl353-smc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/pl353-
>smc.txt b/Documentation/devicetree/bindings/memory-controllers/pl353-
>smc.txt
>> new file mode 100644
>> index 0000000..c1f011d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/memory-controllers/pl353-
>smc.txt
>> @@ -0,0 +1,53 @@
>> +Device tree bindings for ARM PL353 static memory controller
>> +
>> +PL353 static memory controller supports two kinds of memory
>> +interfaces.i.e NAND and SRAM/NOR interfaces.
>> +The actual devices are instantiated from the child nodes of pl353 smc node.
>> +
>> +Required properties:
>> +- compatible		: Should be "arm,pl353-smc-r2p1"
>> +- reg			: Controller registers map and length.
>> +- clock-names		: List of input clock names - "memclk", "aclk"
>> +			  (See clock bindings for details).
>> +- clocks		: Clock phandles (see clock bindings for details).
>> +- address-cells	: Address cells, must be 1.
>> +- size-cells		: Size cells. Must be 1.
>> +
>> +Child nodes:
>> + For NAND the "arm,pl353-nand-r2p1" and for NOR the "cfi-flash" drivers
>are
>> +supported as child nodes.
>> +
>> +Mandatory timing properties for child nodes:
>> +- nand-tRC-ns	: Read cycle time.
>> +- nand-tWC-ns	: Write cycle time.
>> +- nand-tREA-ns	: re_n assertion delay.
>> +- nand-tWP-ns	: we_n de-assertion delay.
>> +- nand-tCLR-ns	: Status read time
>> +- nand-tAR-ns	: ID read time
>> +- nand-tRR-ns	: busy to re_n
>
>These properties should probably be dropped. Look in l2-mtd.git, where
>we now have drivers/mtd/nand/nand_timings.c to define the ONFI timing
>modes, which can be auto-detected (look at struct
>nand_onfi_params::async_timing_mode). Boris also has pending patches for
>non-ONFI chips.

Ok, Thanks. I will check the implementation for onfi timing configuration and I will
use it. 

Regards,
Punnaiah
>
>> +for nand partition information please refer the below file
>> +Documentation/devicetree/bindings/mtd/partition.txt
>> +
>> +Example:
>> +	pl353smcc_0: pl353smcc@e000e000 {
>> +			compatible = "arm,pl353-smcc-r2p1"
>> +			clock-names = "memclk", "aclk";
>> +			clocks = <&clkc 11>, <&clkc 44>;
>> +			reg = <0xe000e000 0x1000>;
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +			ranges;
>> +			nand_0: nand@e1000000 {
>> +				compatible = "arm,pl353-nand-r2p1"
>> +				reg = <0xe1000000 0x1000000>;
>> +				nand-tRC-ns = <40>;
>> +				nand-tWC-ns = <40>;
>> +				nand-tREA-ns = <10>;
>> +				nand-tWP-ns = <20>;
>> +				nand-tCLR-ns = <20>;
>> +				nand-tAR-ns = <20>;
>> +				nand-tRR-ns = <40>;
>> +				(...)
>> +			};
>> +	};
>
>Brian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
