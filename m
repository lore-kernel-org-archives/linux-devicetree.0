From: Joshua Henderson <joshua.henderson@microchip.com>
Subject: Re: [PATCH 03/14] DEVICETREE: Add PIC32 clock binding documentation
Date: Wed, 25 Nov 2015 21:05:45 -0700
Message-ID: <56568519.3060308@microchip.com>
References: <1448065205-15762-1-git-send-email-joshua.henderson@microchip.com>
 <1448065205-15762-4-git-send-email-joshua.henderson@microchip.com>
 <7182714.6Xmo6Noc6V@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <7182714.6Xmo6Noc6V@wuerfel>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Purna Chandra Mandal <purna.mandal@microchip.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On 11/21/2015 1:49 PM, Arnd Bergmann wrote:
> On Friday 20 November 2015 17:17:15 Joshua Henderson wrote:
>> +/* PIC32 specific clks */
>> +pic32_clktree {
>> +       #address-cells = <1>;
>> +       #size-cells = <1>;
>> +       reg = <0x1f801200 0x200>;
>> +       compatible = "microchip,pic32-clk";
>> +       interrupts = <12>;
>> +       ranges;
>> +
>> +       /* secondary oscillator; external input on SOSCI pin */
>> +       SOSC:sosc_clk {
>> +               #clock-cells = <0>;
>> +               compatible = "microchip,pic32-sosc";
>> +               clock-frequency = <32768>;
>> +               reg = <0x1f801200 0x10   /* enable reg */
>> +                       0x1f801390 0x10>; /* status reg */
>> +               microchip,bit-mask = <0x02>; /* enable mask */
>> +               microchip,status-bit-mask = <0x10>; /* status-mask*/
>> +       };
>>
> 
> If you want to use the reg property in this way for each cell,
> at least use a 'ranges' that only translates the actual registers
> like this
> 
> 	ranges = <0 0x1f801200 0x200>
> 
> 	sosc_clk {
> 		...
> 		reg = <0x000 0x10>, <0x190 0x10>;
> 		...
> 	};
> 
> 	Arnd
> 

This does indeed seem to be the correct way to use ranges in this case.  Consider it done.

Thanks for the feedback,
Josh
