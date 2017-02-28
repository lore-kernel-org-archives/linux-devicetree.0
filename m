From: Florian Vaussard <florian.vaussard@heig-vd.ch>
Subject: Re: [PATCH 0/6] ARM: dts: socfpga: Fix dtc warnings
Date: Tue, 28 Feb 2017 11:56:03 +0100
Message-ID: <4c12f161-d19d-2e58-55d0-88754283bf55@heig-vd.ch>
References: <1488002069-22404-1-git-send-email-florian.vaussard@heig-vd.ch>
 <f70f5daa-2d24-041c-6e3a-195b7e1bde0b@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <f70f5daa-2d24-041c-6e3a-195b7e1bde0b@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Florian Vaussard <florian.vaussard@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 02/27/2017 05:45 PM, Dinh Nguyen wrote:
> 
> 
> On 02/24/2017 11:54 PM, Florian Vaussard wrote:
>> We get a bunch of warnings when compiling the SoCFPGA device trees with W=1.
>> This warnings happens because some nodes have a unit name but no 'reg' property,
>> or are missing a unit name while having a 'reg' property. This series enables to
>> compile all SoCFPGA dts without warnings.
>>
>> Patches 1 to 5 fix these warnings by adding the unit name or removing the
>> 'reg' property when approriate.
>>
>> Patch 6 removes the inclusion of the deprecated skeleton.dtsi file, as SoCFPGA
>> device trees already define the mandatory properties and nodes. This is needed
>> to remove the latest warning.
>>
>> This series was boot tested on a Cyclone5 SoC DK, thus covering some of the
>> changes dones by patches 1 -> 3 + 6.
>>
>> Regards,
>> Florian
>>
>> Florian Vaussard (6):
>>   ARM: dts: socfpga: Add unit name to clock nodes
>>   ARM: dts: socfpga: Add unit name to memory nodes
>>   ARM: dts: socfpga: Remove unneeded unit names
>>   ARM: dts: socfpga: Remove unneeded reg from stmpe_touchscreen
>>   ARM: dts: socfpga: Remove unit name for LEDs in EBV SOCrates
>>   ARM: dts: socfpga: Do not include skeleton.dtsi
>>
>>  arch/arm/boot/dts/socfpga.dtsi                     | 43 +++++++++---------
>>  arch/arm/boot/dts/socfpga_arria10.dtsi             | 51 +++++++++++-----------
>>  arch/arm/boot/dts/socfpga_arria10_socdk.dtsi       |  2 +-
>>  arch/arm/boot/dts/socfpga_arria5_socdk.dts         |  2 +-
>>  arch/arm/boot/dts/socfpga_cyclone5_de0_sockit.dts  |  2 +-
>>  arch/arm/boot/dts/socfpga_cyclone5_mcv.dtsi        |  2 +-
>>  arch/arm/boot/dts/socfpga_cyclone5_mcvevk.dts      |  1 -
>>  arch/arm/boot/dts/socfpga_cyclone5_socdk.dts       |  2 +-
>>  arch/arm/boot/dts/socfpga_cyclone5_sockit.dts      |  2 +-
>>  arch/arm/boot/dts/socfpga_cyclone5_socrates.dts    |  8 ++--
>>  arch/arm/boot/dts/socfpga_cyclone5_sodia.dts       |  2 +-
>>  arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts |  2 +-
>>  arch/arm/boot/dts/socfpga_vt.dts                   |  2 +-
>>  13 files changed, 59 insertions(+), 62 deletions(-)
>>
> 
> All applied!
> 

Thanks! BTW did you saw my other patch to clean up IRQ descriptors?

Regards,
Florian
