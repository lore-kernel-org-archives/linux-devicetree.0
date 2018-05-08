From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77970: add SMP support
Date: Tue, 8 May 2018 21:47:10 +0300
Message-ID: <db136ee6-4ce6-756e-743d-3342b2e65f2b@cogentembedded.com>
References: <14666252.G84Ipxe6EL@wasted.cogentembedded.com>
 <54dbd1d2-8279-5073-cffb-c647fba91e42@cogentembedded.com>
 <CAMuHMdUqVVWz0jLb2Vmrkk3BQBsYVsCOW1zsaPUi8o6jr_mojQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMuHMdUqVVWz0jLb2Vmrkk3BQBsYVsCOW1zsaPUi8o6jr_mojQ@mail.gmail.com>
Content-Language: en-MW
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 05/08/2018 09:40 PM, Geert Uytterhoeven wrote:

>> Add the device node for the second Cortex-A53 CPU core.
>>
>> Based on the original (and large) patch by Daisuke Matsushita
>> <daisuke.matsushita.ns@hitachi.com>.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Dupe of https://patchwork.kernel.org/patch/10032875/

   Sorry!
   Not an exact dupe, though -- mine has clock/power #define's used,
yours -- only bare #s. :-)

> From series "[PATCH 0/2] arm64: dts: renesas: r8a77970: Add SMP Support"
> (https://www.spinics.net/lists/linux-renesas-soc/msg19681.html)

   Hmm... what's the fate of this series?

>> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
>> @@ -41,6 +41,16 @@
>>                         enable-method = "psci";
>>                 };
>>
>> +               a53_1: cpu@1 {
>> +                       device_type = "cpu";
>> +                       compatible = "arm,cortex-a53","arm,armv8";
> 
> Missing space after the comma.

   Oops. :-)

> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergei
