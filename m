From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: salvator-common: Configure
 PMIC for DDR Backup Power
Date: Fri, 16 Mar 2018 15:08:13 +0300
Message-ID: <1ae32fee-578e-1091-561a-200a8036b670@cogentembedded.com>
References: <1521029386-29975-1-git-send-email-geert+renesas@glider.be>
 <1521029386-29975-3-git-send-email-geert+renesas@glider.be>
 <9c6289e4-23dd-c79b-bd1f-058d843739d2@cogentembedded.com>
 <CAMuHMdUO-Op4u44naZJ37VgzN1GJBL33yRWnF11D9a24y8+x1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMuHMdUO-Op4u44naZJ37VgzN1GJBL33yRWnF11D9a24y8+x1g@mail.gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

On 03/16/2018 03:00 PM, Geert Uytterhoeven wrote:

>>> On Salvator-X(S), all of the DDR0, DDR1, DDR0C, and DDR1C power rails
>>> need to be kept powered when backup mode is enabled.  Reflect this in
>>> the "rohm,ddr-backup-power" property for the BD9571MWV PMIC node.
>>>
>>> The accessory power switch (SW23) is a toggle switch, hense specify
>>> "rohm,rstbmode-level".
>>>
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> ---
>>> v2:
>>>   - Add rohm,rstbmode-level.
>>> ---
>>>  arch/arm64/boot/dts/renesas/salvator-common.dtsi | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
>>> index 2a7f36abd2dd85c6..80794c38c2669d75 100644
>>> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
>>> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
>>> @@ -376,6 +376,8 @@
>>>               #interrupt-cells = <2>;
>>>               gpio-controller;
>>>               #gpio-cells = <2>;
>>> +             rohm,ddr-backup-power = <15>;
>>
>>   Why not 0xf if those are all bit flags?
> 
> Because it's a small number?
> Does it matter?

   I think hex is preferable for the bit flags. Decimal makes one think it's something
else -- some magnitude, etc...

> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergei
