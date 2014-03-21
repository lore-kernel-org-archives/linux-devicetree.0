From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 3/3] ARM: dts: socfpga: add gpio pieces
Date: Fri, 21 Mar 2014 20:08:15 +0100
Message-ID: <532C8E1F.8080400@linutronix.de>
References: <1395345324-18299-1-git-send-email-bigeasy@linutronix.de>	<1395345324-18299-4-git-send-email-bigeasy@linutronix.de> <CANk1AXRa4V1ADNaT+T3pYF4zyxni9Y8rmU9UYRoA_7NxW8KWEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CANk1AXRa4V1ADNaT+T3pYF4zyxni9Y8rmU9UYRoA_7NxW8KWEg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: delicious quinoa <delicious.quinoa@gmail.com>
Cc: Alan Tull <atull@altera.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@altera.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 03/21/2014 07:14 PM, delicious quinoa wrote:
>> +               gpio@ff708000 {
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +                       compatible = "snps,dw-apb-gpio";
>> +                       reg = <0xff708000 0x1000>;
>> +                       clocks = <&per_base_clk>;
>> +                       status = "disabled";
>> +
>> +                       gpio0: gpio-controller@0 {
>> +                               compatible = "snps,dw-apb-gpio-port";
>> +                               gpio-controller;
>> +                               #gpio-cells = <1>;
> 
> #gpio-cells = <2>;
> 
> I applied this patch, fixed the gpio-cells, tested on a cyclone5 soc
> devkit, and see that it breaks the interrupts.  Did you test this?

No, as I said. in 0/3. Will take a look on that at somepoint next week.

> 
> Alan

Sebastian
