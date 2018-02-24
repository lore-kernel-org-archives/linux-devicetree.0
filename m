From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] ARM: dts: porter: Add missing PMIC nodes
Date: Sat, 24 Feb 2018 23:11:31 +0100
Message-ID: <2860322f-89b9-32aa-37bc-4fa4a52c1837@gmail.com>
References: <20180217020756.21474-1-marek.vasut+renesas@gmail.com>
 <CAMuHMdUiGAV7r55mqRH549BufDsh8_j8_S-BD_49sCM=aO9hZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMuHMdUiGAV7r55mqRH549BufDsh8_j8_S-BD_49sCM=aO9hZQ@mail.gmail.com>
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
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Steve Twiss <stwiss.opensource@diasemi.com>, Simon Horman <horms+renesas@verge.net.au>, linux-arm-kernel@lists.infradead.org, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

On 02/18/2018 04:07 PM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

> CC Steve Twiss
> 
> On Sat, Feb 17, 2018 at 3:07 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
>> Add PMIC nodes to Porter and connect CPU DVFS supply. There is
>> one DA9063 and one DA9210 on Porter, the only difference from
>> the other boards is that DA9063 is at I2C address 0x5a rather
>> than 0x58 .
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> Thanks for your patch!
> 
>> --- a/arch/arm/boot/dts/r8a7791-porter.dts
>> +++ b/arch/arm/boot/dts/r8a7791-porter.dts
>> @@ -354,10 +354,47 @@
>>         clock-frequency = <400000>;
>>  };
>>
>> +&i2c6 {
>> +       status = "okay";
>> +       clock-frequency = <100000>;
>> +
>> +       pmic@5a {
>> +               compatible = "dlg,da9063";
> 
> Does it matter that this is a DA9063L ("Variant 6B")?
> Do we need a new compatible value, or can this be detected at runtime?

The driver detects it

da9063 6-005a: Device detected (chip-ID: 0x61, var-ID: 0x63)

Comparing the datasheets makes it obvious that 9063L is just a cut-down
version of 9063, with less LDOs and one less ADC. So I think we should
have extra compatible and have the driver restrict which LDOs can be
used with this smaller PMIC.

-- 
Best regards,
Marek Vasut
