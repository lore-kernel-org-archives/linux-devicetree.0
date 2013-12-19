From: Jonas Jensen <jonas.jensen@gmail.com>
Subject: Re: [PATCH v6 2/2] ARM: mach-moxart: add MOXA ART SoC device tree files
Date: Thu, 19 Dec 2013 11:58:57 +0100
Message-ID: <CACmBeS2WaRDwvq=WvDgK_eodw90AGbjK3+OiV6Ts03d5h4wtCg@mail.gmail.com>
References: <1387371526-15309-1-git-send-email-jonas.jensen@gmail.com>
	<1387371526-15309-3-git-send-email-jonas.jensen@gmail.com>
	<CAEgOgz4sxg6khQwKtj5owPrm_Jsz+i-bV9-u7Wh9U_YBWvNtmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAEgOgz4sxg6khQwKtj5owPrm_Jsz+i-bV9-u7Wh9U_YBWvNtmw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Soren Brinkmann <soren.brinkmann@xilinx.com>, "linux@roeck-us.net" <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

On 19 December 2013 00:41, Peter Crosthwaite
<peter.crosthwaite@xilinx.com> wrote:
>> +       clocks {
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +
>> +               ref12: ref12M {
>> +                       compatible = "fixed-clock";
>
> Is the correct split to perhaps have the fixed-clock node in dtsi as
> you have here but ...
>
>> +                       #clock-cells = <0>;
>> +                       clock-frequency = <12000000>;
>
> The board is responsible for the frequency?
>
> I guess in this schema,
>
> 1. the "fixed-clock" node corresponds to the existence of clock input
> pins on the SoC level - hence the node is DTSI.
> 2. setting the clock-frequency corresponds to populatation of those
> input pins with a soldered crystal - hence done in DTS

Yes, the soldered crystal belongs to board. Changes in v7 should reflect that.

I tried to doing what you said above, it didn't quite work, I got the
same error from of_clk_get() / of_clk_get_by_name(), but came up with
another solution please have a look at v7.

Thanks,
Jonas
