From: Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH 2/4] arm64: dts: ti: k3-am65-main: Add IPC sub-mailbox
 nodes for R5Fs
Date: Tue, 23 Jul 2019 12:54:01 -0500
Message-ID: <5e8e402e-d577-f1dd-b011-8ddc4407f30b@ti.com>
References: <20190722202024.14867-1-s-anna@ti.com>
 <20190722202024.14867-3-s-anna@ti.com>
 <20190723113706.ctrxtpezuknohbj3@kahuna>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190723113706.ctrxtpezuknohbj3@kahuna>
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
To: Nishanth Menon <nm@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Nishanth,

On 7/23/19 6:37 AM, Nishanth Menon wrote:
> On 15:20-20190722, Suman Anna wrote:
>> Add the sub-mailbox nodes that are used to communicate between
>> MPU and the two R5F remote processors present in the MCU domain.
>> The parent mailbox cluster nodes are enabled and the interrupts
>> associated with the Mailbox Cluster User interrupt used by the
>> sub-mailbox nodes are also added. The GIC_SPI interrupt to be
>> used is dynamically allocated and managed by the System Firmware
>> through the ti-sci-intr irqchip driver.
>>
>> The sub-mailbox nodes utilize the System Mailbox clusters 1 and 2.
>> These sub-mailbox nodes are added to match the hard-coded mailbox
>> configuration used within the TI RTOS IPC software packages. The
>> Cortex R5F processor sub-system is assumed to be running in Split
>> mode, so a sub-mailbox node is used by each of the R5F cores. Only
>> the sub-mailbox node from cluster 0 is used in case of Lockstep
>> mode.
>>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> ---
>>  arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 16 ++++++++++++++--
>>  1 file changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
>> index 0b3ea2a871ee..317563c995b1 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
>> @@ -426,7 +426,13 @@
>>  			#mbox-cells = <1>;
>>  			ti,mbox-num-users = <4>;
>>  			ti,mbox-num-fifos = <16>;
>> -			status = "disabled";
>> +			interrupt-parent = <&intr_main_navss>;
>> +			interrupts = <164 0>;
>> +
>> +			mbox_mcu_r5fss0_core0: mbox-mcu-r5fss0-core0 {
>> +				ti,mbox-tx = <1 0 0>;
>> +				ti,mbox-rx = <0 0 0>;
>> +			};
> 
> Should'nt this rather be a board specific node? This is completely
> dependent on the pre-defined communication scheme with R5F firmware?

These are the default assignments we are using and inherited by all
derivative boards leveraging the TI RTOS-side firmwares/stacks.
Otherwise, these sub-mailboxes have to be added to every board dts file.
One can always overwrite the values or disable the nodes if they chose a
different configuration.

regards
Suman

> 
>>  		};
>>  
>>  		mailbox0_cluster1: mailbox@31f81000 {
>> @@ -435,7 +441,13 @@
>>  			#mbox-cells = <1>;
>>  			ti,mbox-num-users = <4>;
>>  			ti,mbox-num-fifos = <16>;
>> -			status = "disabled";
>> +			interrupt-parent = <&intr_main_navss>;
>> +			interrupts = <165 0>;
>> +
>> +			mbox_mcu_r5fss0_core1: mbox-mcu-r5fss0-core1 {
>> +				ti,mbox-tx = <1 0 0>;
>> +				ti,mbox-rx = <0 0 0>;
>> +			};
>>  		};
>>  
>>  		mailbox0_cluster2: mailbox@31f82000 {
>> -- 
>> 2.22.0
>>
> 
