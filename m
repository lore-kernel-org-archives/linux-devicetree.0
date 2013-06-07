From: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] pinmux: Add TB10x pinmux driver
Date: Fri, 7 Jun 2013 22:57:41 +0800
Message-ID: <CAD6h2NQ9Ht1BSTWpNBib0QQ5kGkKpoPoQq7dUg9QSnzKBSUSyQ@mail.gmail.com>
References: <20130522142824.GC4789@ab42.lan>
 <CAD6h2NT4FqmEsLvtTDwwDL2YVzXYNpw72hTOcSxSMvHLhWvFPQ@mail.gmail.com>
 <20130524115053.GB5203@ab42.lan>
 <CAD6h2NSh_4TNAGeFhg+va5QX2hGia+gkw-mPaeMezghsa=Zc6Q@mail.gmail.com>
 <20130603123001.GD31808@ab42.lan>
 <CAD6h2NQVKKvcoPdD4sm5rUM5G-FpF3abL=k+WfQsnKnm7qhREA@mail.gmail.com>
 <20130606141115.GA10345@ab42.lan>
 <CAD6h2NRNMQP-ZQ0Cc613tGThVEo7AzRExBmWsbtr1DXgiPwz7w@mail.gmail.com>
 <20130606153030.GA19876@ab42.lan>
 <CAD6h2NQRdgeBkMJkJWeDt-304KY7e6+qyKVE-h9MY6bRnMAPLA@mail.gmail.com>
 <20130607113207.GE11875@ab42.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130607113207.GE11875-7oYq3qWSd+k@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Christian Ruppert <christian.ruppert-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org>
Cc: Sascha Leuenberger <sascha.leuenberger-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org>, Pierrick Hascoet <pierrick.hascoet-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shiraz HASHIM <shiraz.hashim-qxv4g6HH51o@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 7 June 2013 19:32, Christian Ruppert <christian.ruppert-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org> wrote:
> On Fri, Jun 07, 2013 at 08:00:57AM +0800, Haojian Zhuang wrote:
>> On 6 June 2013 23:30, Christian Ruppert <christian.ruppert-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org> wrote:
>> > On Thu, Jun 06, 2013 at 10:32:21PM +0800, Haojian Zhuang wrote:
>> >> On 6 June 2013 22:11, Christian Ruppert <christian.ruppert-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org> wrote:
>> >> > On Wed, Jun 05, 2013 at 09:44:27AM +0800, Haojian Zhuang wrote:
>> >> >> On 3 June 2013 20:30, Christian Ruppert <christian.ruppert-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org> wrote:
>> >> >> > OK, here's a simplified example of what we would like to do (this seems
>> >> >> > pretty common so I suppose there is a way I haven't understood). Our
>> >> >> > situation is slightly more complex but for the purpose of discussion
>> >> >> > let's assume a chip with 8 pins which can be configured for the
>> >> >> > following functions:
>> >> >> >
>> >> >> > Pin   GPIO-A    I2C    SPI0     SPI1
>> >> >> > ------------------------------------
>> >> >> >  1    GPIOA0    SDA             MISO1
>> >> >> >  2    GPIOA1    SCL             MOSI1
>> >> >> >  3    GPIOA2                    SS1_B
>> >> >> >  4    GPIOA3                    SCLK1
>> >> >> >  5    GPIOA4           MISO0
>> >> >> >  6    GPIOA5           MOSI0
>> >> >> >  7    GPIOA6           SS0_B
>> >> >> >  8    GPIOA7           SCLK0
>> >> >> >
>> >> >> > We can now define the following pinctrl-single:
>> >> >> >
>> >> >> > pinmux: pinmux@0xFFEE0000 {
>> >> >> >         compatible = "pinctrl-single";
>> >> >> >         reg = <0xFFEE0000 0x8>;
>> >> >> >         #address-cells = <1>;
>> >> >> >         #size-cells = <0>;
>> >> >> >         #gpio-range-cells = <3>;
>> >> >> >         pinctrl-single,register-width = <32>;
>> >> >> >         pinctrl-single,function-mask = <0xffffffff>;
>> >> >> >         pinctrl-single,gpio-range = <&range 1 8 0>;
>> >> >> >         gpioa_pins: pinmux_gpioa_pins {
>> >> >> >                 pinctrl-single,pins = <0x0 0 0x4 0>
>> >> >> >         };
>> >> >> >         i2c_pins: pinmux_i2c_pins {
>> >> >> >                 pinctrl-single,pins = <0x0 1>
>> >> >> >         };
>> >> >> >         spi0_pins: pinmux_spi0_pins {
>> >> >> >                 pinctrl-single,pins = <0x1 1>
>> >> >> <0x1 1>?
>> >> >>
>> >> >> If each pinmux register is only for one pin in your SoC.
>> >> >> I think that your definitions are wrong above. We use
>> >> >> register offset as the first argument, not pin number.
>> >> >> And the second argument should be pin function number.
>> >> >
>> >> > In our case each pinmux register (bit field) actually controls an entire
>> >> > group of pins.
>> >> >
>> >> >> If multiple pins are sharing one register with different bits,
>> >> >> you need to enable "pinctrl-single,bit-per-mux".
>> >> >
>> >> > Multiple pins are sharing the same bits in the same register. Do you
>> >> > think this prevents us from using pinctrl-single?
>> >> >
>> >> Could you give me your register definition? Then I can understand you
>> >> better.
>> >
>> > In our example, the register map would look a bit like the following.
>> > Note that every register configures four pins at a time.
>> >
>> > Register 0x0:
>> >  Mode  GPIO-A    I2C    SPI1
>> >  Value 0x0       0x1    0x2
>> >  ---------------------------
>> >  Pin1  GPIOA0    SDA    MISO1
>> >  Pin2  GPIOA1    SCL    MOSI1
>> >  Pin3  GPIOA2           SS1_B
>> >  Pin4  GPIOA3           SCLK1
>> >
>> > Register 0x4:
>> >  Mode  GPIO-A    SPI0
>> >  Value 0x0       0x1
>> >  ---------------------
>> >  Pin5  GPIOA4    MISO0
>> >  Pin6  GPIOA5    MOSI0
>> >  Pin7  GPIOA6    SS0_B
>> >  Pin8  GPIOA7    SCLK0
>> >
>>
>> You said "Multiple pins are sharing the same bits in the same register.".
>> I need to understand which bits you're talking about in your register.
>
> In the above example, bits 0 and 1 of register 0x0 control pins 1
> through 4 and bit 0 of register 0x4 controls pins 5 through 8. The
> moment you write a new value in either of those registers, all four pins
> will change functionality simultaneously. There is no way to control the
> functionality of each pin individually.
>

Oh. So some bits in the same register control multiple pins.

Yeah, I also meet this in Hisilicon SoC. My solution is to only define the
pinmux register for one pin, and skip other pins.

1. You're using GPIOA0 & GPIOA1 in two different driver.
You only need to define GPIOA0 or GPIOA1 in one of driver. Don't define
them at the same time.

2. You're using GPIOA0 & GPIOA1 in the same driver.
You only need to define GPIOA0 or GPIOA1.

3. If you're using SPI or any other function, it's same as GPIO function.

4. There's no #4. Since you won't use GPIOA0 with SCL pin together.

Regards
Haojian
