From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH 1/8] ARM: dts: armada-370-rd: Utilize new DSA binding
Date: Thu, 05 Jan 2017 10:41:16 +0100
Message-ID: <87bmvletdv.fsf@free-electrons.com>
References: <20170102022249.10657-1-f.fainelli@gmail.com>
 <20170102022249.10657-2-f.fainelli@gmail.com>
 <20170103163609.GE32450@lunn.ch>
 <307da709-5dbd-845b-b7ec-d0c3d46ad2e6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <307da709-5dbd-845b-b7ec-d0c3d46ad2e6@gmail.com> (Florian
 Fainelli's message of "Wed, 4 Jan 2017 09:30:07 -0800")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, vivien.didelot@savoirfairelinux.com, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Florian,
 
 On mer., janv. 04 2017, Florian Fainelli <f.fainelli@gmail.com> wrote:

> On 01/03/2017 08:36 AM, Andrew Lunn wrote:
>>> +
>>> +	switch: switch@10 {
>>> +		compatible = "marvell,mv88e6085";
>>> +		#address-cells = <1>;
>>> +		#size-cells = <0>;
>>> +		reg = <16>;
>> 
>> Hummm, a device tree question. switch@10, reg = <16>. Is there an
>> implicit understanding that the 10 is hex?
>
> Most (if not all?) unit addresses are hexadecimal, which is why this was
> chosen here, but I really don't mind changing that.

And what about using:
		reg = <0x10>;

Gregory

> -- 
> Florian

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
