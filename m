From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 04/14] OF: pinctrl: MIPS: lantiq: implement lantiq/xway
 pinctrl support
Date: Tue, 08 May 2012 09:28:23 -0600
Message-ID: <4FA93B97.4070406@wwwdotorg.org>
References: <1336133919-26525-1-git-send-email-blogic@openwrt.org>
 <1336133919-26525-4-git-send-email-blogic@openwrt.org>
 <CACRpkdYJDd84GbKM7r4Xy+d4iOtdD+rJ3kdq-zwVbf_Attj2Gw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACRpkdYJDd84GbKM7r4Xy+d4iOtdD+rJ3kdq-zwVbf_Attj2Gw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/08/2012 07:21 AM, Linus Walleij wrote:
> On Fri, May 4, 2012 at 2:18 PM, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> wrote:
> 
>> Implement support for pinctrl on lantiq/xway socs. The IO core found on these
>> socs has the registers for pinctrl, pinconf and gpio mixed up in the same
>> register range. As the gpio_chip handling is only a few lines, the driver also
>> implements the gpio functionality. This obseletes the old gpio driver that was
>> located in the arch/ folder.
...
>> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
>> index f73a5ea..a19bac96 100644
>> --- a/drivers/pinctrl/Kconfig
>> +++ b/drivers/pinctrl/Kconfig
>> @@ -30,6 +30,11 @@ config PINCTRL_PXA3xx
>>        bool
>>        select PINMUX
>>
>> +config PINCTRL_LANTIQ
>> +       bool
>> +       select PINMUX
>> +       select PINCONF
> 
> depends on LANTIQ
> 
> ?
> 
> I don't think anyone else is going to want to compile
> this.

This Kconfig option is selected by the ARCH Kconfig, so only selected at
the right time. The user won't get prompted for it since there's no
string after "bool". I think this is OK. Tegra's pinctrl Kconfig option
doesn't have any "depends ARCH_TEGRA" here either, although I note that
many other pinctrl drivers do.

>>  config PINCTRL_MMP2
>>        bool "MMP2 pin controller driver"
>>        depends on ARCH_MMP
>> @@ -83,6 +88,10 @@ config PINCTRL_COH901
>>          COH 901 335 and COH 901 571/3. They contain 3, 5 or 7
>>          ports of 8 GPIO pins each.
>>
>> +config PINCTRL_XWAY
>> +       bool
>> +       select PINCTRL_LANTIQ
> 
> Shouldn't this be:
> 
> depends on SOC_TYPE_XWAY

Maybe, but see comments above.

> depends on PINCTRL_LANTIQ

Selecting PINCTRL_LANTIQ seems more appropriate; the ARCH Kconfig just
selects PINCTRL_XWAY when appropriate, and that then selects anything it
depends on.

(IIRC, the driver for SOC_TYPE_XWAY uses the driver for LANTIQ, not the
other way around?)

> So LANTIQ selects it's pinctrl driver, the the xway SoC
> selects its driver and they both are dependent on their
> respective system.
