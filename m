From: Romain Perier <romain.perier@free-electrons.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: marvell: Add ethernet switch
 definition for the ESPRESSObin
Date: Tue, 20 Dec 2016 17:09:38 +0100
Message-ID: <c27998fd-3807-5c99-382b-b8d0d0f06526@free-electrons.com>
References: <20161220085138.3998-1-romain.perier@free-electrons.com>
 <20161220085138.3998-4-romain.perier@free-electrons.com>
 <20161220154234.GC30952@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20161220154234.GC30952@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>
List-Id: devicetree@vger.kernel.org

Hi,

Le 20/12/2016 à 16:42, Andrew Lunn a écrit :
>> +&mdio {
>> +	switch0: switch0@0 {
>> +		compatible = "marvell,mv88e6085";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		reg = <1>;
>
> Ah, sorry, missed this last time. reg = <1>, that means switch0@1.
> That is a general rule for all device tree bindings.


Ahhh, I did not pay attention either :/
I will fix this.


>
>> +		mdio {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <1>;
>
> what is this reg value for?
>
>      Andrew
>

It was required to avoid a warning thrown by the mdio subsystem

Romain
