From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: Re: [PATCH 03/18] arm64: dts: ulcb-kf: initial device tree
Date: Wed, 20 Sep 2017 17:43:25 +0300
Message-ID: <95e3fe73-3c14-aa58-393e-62b41b568db1@cogentembedded.com>
References: <1504737267-22829-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1504737322-22954-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdXyWV52_kZNFGQzPpnAYowa0KZYodMAWusCX5Opj3a1iQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXyWV52_kZNFGQzPpnAYowa0KZYodMAWusCX5Opj3a1iQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

Thank you for the review.

On 20.09.2017 15:20, Geert Uytterhoeven wrote:
> +};
>> +
>> +&hscif0 {
>> +       pinctrl-0 = <&hscif0_pins>;
>> +       pinctrl-names = "default";
>> +       uart-has-rtscts;
>> +
>> +       status = "okay";
> This serial port is driving Bluetooth and WiFi, right?
Yes.
> So I expect this node to gain a child node for that in the future, cfr.
> Documentation/devicetree/bindings/serial/slave-device.txt.
Got it.

-- 
Regards,
Vladimir
