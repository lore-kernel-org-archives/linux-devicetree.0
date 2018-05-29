From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77980: add I2C support
Date: Tue, 29 May 2018 18:42:43 +0200
Message-ID: <CAMuHMdVhOa2iM0NnZeB4faNSigd6QZaEsXTXAvH0hxt-WhcuqQ@mail.gmail.com>
References: <e9c94553-be9d-0eec-a1ee-1713bb97fbab@cogentembedded.com>
 <3675b19f-b800-172f-9472-c47a37760fa9@cogentembedded.com>
 <20180529130504.lpkpgads7lfomois@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180529130504.lpkpgads7lfomois@verge.net.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Simon Horman <horms@verge.net.au>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Simon,

On Tue, May 29, 2018 at 3:05 PM, Simon Horman <horms@verge.net.au> wrote:
> On Mon, May 28, 2018 at 11:13:08PM +0300, Sergei Shtylyov wrote:
>> Define the generic R8A77980 parts of the I2C[0-5] device node.
>>
>> Based on the original (and large) patch by Vladimir Barinov.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

>> +             i2c3: i2c@e66d0000 {
>> +                     compatible = "renesas,i2c-r8a77980",
>> +                                  "renesas,rcar-gen3-i2c";
>> +                     reg = <0 0xe66d0000 0 0x40>;
>> +                     interrupts = <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&cpg CPG_MOD 928>;
>> +                     power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>> +                     resets = <&cpg 928>;
>> +                     dmas = <&dmac1 0x97>, <&dmac1 0x96>,
>> +                            <&dmac2 0x97>, <&dmac2 0x96>;
>> +                     dma-names = "tx", "rx", "tx", "rx";
>> +                     i2c-scl-internal-delay-ns = <6>;
>> +                     #address-cells = <1>;
>> +                     #size-cells = <0>;
>> +                     status = "disabled";
>> +             };
>
> DMA for i2c3 and i2c4  seems unclear in v0.80 and v1.00 of the User's Manual.
> Although what is described here does match v0.55E of the User's Manual.
> Have you been able to confirm what is correct here?

Given they bothered adding rows to the table, I assume they just forgot to
add checkmarks in the V3H column.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
