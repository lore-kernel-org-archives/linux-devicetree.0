From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 1/4] ARM: shmobile: r8a7778: add Ether DT support
Date: Tue, 03 Sep 2013 22:27:39 +0400
Message-ID: <52262A1B.4050406@cogentembedded.com>
References: <201309010311.05466.sergei.shtylyov@cogentembedded.com>
 <201309010315.49763.sergei.shtylyov@cogentembedded.com>
 <CANqRtoQFYFva9msdoEWdU2Z7_=jOtZwvXgL7OqUKhVMO3NOPzg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CANqRtoQFYFva9msdoEWdU2Z7_=jOtZwvXgL7OqUKhVMO3NOPzg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, ian.campbell@citrix.com, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, SH-Linux <linux-sh@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, "Simon Horman [Horms]" <horms@verge.net.au>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 09/03/2013 07:17 PM, Magnus Damm wrote:

>> Define the generic R8A777x part of the Ether device node.

>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

>> ---
>>   arch/arm/boot/dts/r8a7778.dtsi |   11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> Index: renesas/arch/arm/boot/dts/r8a7778.dtsi
>> ===================================================================
>> --- renesas.orig/arch/arm/boot/dts/r8a7778.dtsi
>> +++ renesas/arch/arm/boot/dts/r8a7778.dtsi
>> @@ -98,4 +98,15 @@
>>                  reg = <0xfffc000 0x118>;
>>                  #gpio-range-cells = <3>;
>>          };
>> +
>> +       ether: ethernet@fde00000 {
>> +               device_type = "network";
>> +               compatible = "renesas,ether-r8a7779";

> Hi Sergei,

> Thanks for your patch. What's the reason behind the r8a7778 SoC using
> a compatible string for r8a7779 like "renesas,ether-r8a7779"?

    R8A7779 support has appeared first in Linux and as R8A7778 Ether is 
identical to R8A7779 and no wildcards are allowed in the device tree, I 
decided to use this "compatible" prop.

> It seems that you assume that the r8a7778 ethernet controller is 100%
> compatible with r8a7779. Is that really true? For earlier versions the
> sh_eth hardware documentation was anything but accurate, so it seems
> to me that it must be more safe that r8a7778 would be using
> "renesas,ether-r8a7778". What do you think?

    I think R8A7778 and R8A7779 EtherMACs are identical. I've cross checked 
the documentation at the start of the development and the registers appeared 
to be the same.

> Thanks,

> / magnus

WBR, Sergei
