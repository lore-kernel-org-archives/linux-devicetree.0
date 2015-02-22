From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 2/2] ARM: shmobile: silk: add SDHI0/1 DT support
Date: Sun, 22 Feb 2015 17:54:13 +0300
Message-ID: <54E9ED95.8070702@cogentembedded.com>
References: <10037494.4LD4T2QGPX@wasted.cogentembedded.com>	<2348421.LHyZ4ZOiiG@wasted.cogentembedded.com> <CANqRtoRnDzTSvKYcNDHKHbeaN7jp1VvKnk1jTHDvNt1oyBzwKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <CANqRtoRnDzTSvKYcNDHKHbeaN7jp1VvKnk1jTHDvNt1oyBzwKg@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Magnus Damm <magnus.damm@gmail.com>
Cc: "Simon Horman [Horms]" <horms@verge.net.au>, SH-Linux <linux-sh@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 02/22/2015 03:45 AM, Magnus Damm wrote:

>> Define the SILK board dependent parts of the SDHI0  (connected to SDIO Wi-Fi
>> chip)  and SDHI1  (connected to micro-SD slot) device nodes along with the
>> necessary voltage regulators.

>> Based on the original patch by Vladimir Barinov
>> <vladimir.barinov@cogentembedded.com>.

>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

> Thanks for your patch. One question - above you write that SDHI1 is micro-SD...

    Yes, have double-checked now.

>> @@ -100,3 +159,25 @@
>>          non-removable;
>>          status = "okay";
>>   };
>> +
>> +&sdhi0 {
>> +       pinctrl-0 = <&sdhi0_pins>;
>> +       pinctrl-names = "default";
>> +
>> +       vmmc-supply = <&vcc_sdhi0>;
>> +       vqmmc-supply = <&vccq_sdhi0>;
>> +       cd-gpios = <&gpio6 6 GPIO_ACTIVE_LOW>;
>> +       wp-gpios = <&gpio6 7 GPIO_ACTIVE_LOW>;
>> +       status = "okay";
>> +};
>> +
>> +&sdhi1 {
>> +       pinctrl-0 = <&sdhi1_pins>;
>> +       pinctrl-names = "default";
>> +
>> +       vmmc-supply = <&vcc_sdhi1>;
>> +       vqmmc-supply = <&vccq_sdhi1>;
>> +       cd-gpios = <&gpio6 14 GPIO_ACTIVE_LOW>;
>> +       wp-gpios = <&gpio6 15 GPIO_ACTIVE_LOW>;
>> +       status = "okay";
>> +};

> ... however here the WP signal is assigned.

> I believe micro-SD doesn't use the WP signal, so either I'm wrong or
> the patch needs to be updated to reflect reality. =)

    Both seem correct: SD1_WP signal is just tied to VCCQ_SD1. Do you think we 
should still drop it?

> Also, I doubt that an on-board SDIO module makes use of CD and/or WP signals?

    Those two are tied to VCCQ_SD0 as well. Do you think we should drop them?

> Thanks,
> / magnus

WBR, Sergei

