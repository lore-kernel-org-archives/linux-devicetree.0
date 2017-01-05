From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH 08/12] ARM: dts: socfpga: Add NAND device tree for Arria10
Date: Thu, 5 Jan 2017 05:42:54 -0600
Message-ID: <7b15c95e-6d9f-bb2e-8c73-2f01dc3c8af2@kernel.org>
References: <1483575694-29599-1-git-send-email-dinguyen@kernel.org>
 <1483575694-29599-9-git-send-email-dinguyen@kernel.org>
 <73a8b5ga1v.fsf@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <73a8b5ga1v.fsf@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: devicetree@vger.kernel.org, dinguyen@opensource.altera.com, linux-arm-kernel@lists.infradead.org, Graham Moore <grmoore@opensource.altera.com>
List-Id: devicetree@vger.kernel.org



On 01/05/2017 02:55 AM, Steffen Trumtrar wrote:

>> +#include "socfpga_arria10_socdk.dtsi"
>> +
>> +/ {
>> +	soc {
>> +		nand: nand@ffb90000 {
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +			status = "okay";
>> +
>> +			compatible = "denali,denali-nand-dt", "altr,socfpga-denali-nand";
>> +			reg = <0xffb90000 0x72000>, <0xffb80000 0x10000>;
>> +			reg-names = "nand_data", "denali_reg";
>> +			interrupts = <0 99 4>;
>> +			dma-mask = <0xffffffff>;
>> +			clocks = <&nand_clk>;
> 
> This belongs into the socfpga_arria10.dtsi.
> 

Ah yes, you're right. Thanks for the review.

Dinh
