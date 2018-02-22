From: Amelie DELAUNAY <amelie.delaunay@st.com>
Subject: Re: [PATCH 5/6] ARM: dts: stm32: add joystick support on
 stm32746g-eval
Date: Thu, 22 Feb 2018 15:35:28 +0000
Message-ID: <f8d91cc7-66aa-72bf-c1ed-8e95d39388ba@st.com>
References: <1518100057-23234-1-git-send-email-amelie.delaunay@st.com>
 <1518100057-23234-6-git-send-email-amelie.delaunay@st.com>
 <CACRpkdbaFpLNdxZThVTO5V4y8wzekVpXoFJ_6EOOsKCD_h59cA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdbaFpLNdxZThVTO5V4y8wzekVpXoFJ_6EOOsKCD_h59cA@mail.gmail.com>
Content-Language: en-US
Content-ID: <903C948E0C2F20429AC9EA9E2E0A4A8D@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



On 02/22/2018 02:52 PM, Linus Walleij wrote:
> Hi Amelie,
> 
> thanks for your patch.
> 
> On Thu, Feb 8, 2018 at 3:27 PM, Amelie Delaunay <amelie.delaunay@st.com> wrote:
> 
>> The joystick on stm32746g-eval uses gpios on MFX gpio expander.
>>
>> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> (...)
>> +       joystick {
>> +               compatible = "gpio-keys";
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +               button@1 {
>> +                       label = "JoySel";
>> +                       linux,code = <KEY_ENTER>;
>> +                       gpios = <&mfxgpio 0 (GPIO_ACTIVE_LOW | GPIO_IN_PUSH_PULL | GPIO_PULL_UP)>;
>> +               };
> 
> As I think this should not all be handled by GPIO, the joystick on
> gpio-keys needs a pin control handle pointing back to pin control
> states on the respective pins in the pin control/GPIO driver,
> where it can set up these properties.
> 
> For the individual lines the pushing and pulling flags should be
> removed.
> 

Sure! I keep this in mind, thanks!

Regards,
Amelie

> Yours,
> Linus Walleij
> 
