From: Andrea Greco <andrea.greco.gapmilano@gmail.com>
Subject: Re: [PATCH 2/4] arcnet: com20020: bindings for smsc com20020
Date: Wed, 30 May 2018 16:07:22 +0200
Message-ID: <4f6cda28-478e-1af8-4a63-2165298cabcb@gmail.com>
References: <20180517130628.2770-1-andrea.greco.gapmilano@gmail.com>
 <20180523164931.GA3635@rob-hp-laptop>
 <CAPoXtQJYmfk+-4qOpbEetUAdVwTgVPmk=mQaFv7yLF2V2dO=4A@mail.gmail.com>
 <CAL_JsqL1M3SuH_cJGUhh0+Xg+UYDjAc-=a+USENOKznvWib1Ng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqL1M3SuH_cJGUhh0+Xg+UYDjAc-=a+USENOKznvWib1Ng@mail.gmail.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "Tobin C. Harding" <tobin@apporbit.com>, Andrea Greco <a.greco@4sigma.it>, Mark Rutland <mark.rutland@arm.com>, netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 05/24/2018 04:36 PM, Rob Herring wrote> If you want to add it, that's 
fine. But it's really not something that
> comes up often. For UARTs, there's already the "current-speed"
> property and most other things I can think of use Hz to express
> speeds.

No, Pref keep standard and use Hz.

This if finally:
```
SMSC com20020 Arcnet network controller

Required property:
- timeout-ns: Arcnet bus timeout, Idle Time (328000 - 20500)
- bus-speed-bps: Arcnet bus speed (10000000 - 156250)
- smsc,xtal-mhz: External oscillator frequency
- smsc,backplane-enabled: Controller use backplane mode
- reset-gpios: Chip reset pin
- interrupts: Should contain controller interrupt

arcnet@28000000 {
	compatible = "smsc,com20020";

	timeout-ns = <20500>;
	bus-speed-hz = <10000000>;
	smsc,xtal-mhz = <20>;
	smsc,backplane-enabled;

	reset-gpios = <&gpio3 21 GPIO_ACTIVE_LOW>;
	interrupts = <&gpio2 10 GPIO_ACTIVE_LOW>;
};
```
If confirmed, for me is right

Andrea
