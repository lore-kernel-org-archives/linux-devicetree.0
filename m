From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] ARM: dts: BCM5301X: Add support for TP-LINK Archer C5 V2
Date: Mon, 13 Mar 2017 20:15:27 +0100
Message-ID: <89081716-c0e3-236f-4291-e700dbedbd34@milecki.pl>
References: <20170311121453.18534-1-zajec5@gmail.com>
 <20170312171032.GK15842@lunn.ch>
 <437d898d-b0f4-a4b5-cb51-8ea88ba7a35a@milecki.pl>
 <20170313191416.GB10397@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170313191416.GB10397@lunn.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Rafa?? Mi??ecki <zajec5@gmail.com>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, John Crispin <john@phrozen.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 03/13/2017 08:14 PM, Andrew Lunn wrote:
> On Mon, Mar 13, 2017 at 07:48:26PM +0100, Rafa?? Mi??ecki wrote:
>> On 03/12/2017 06:10 PM, Andrew Lunn wrote:
>>>> +	chosen {
>>>> +		bootargs = "console=ttyS0,115200 earlycon";
>>>
>>> Using bootargs to pass the serial settings has been deprecated for a
>>> while. Please use stdout-path instead.
>>
>> I tried following patch with my SR400ac (I put Archer C5 aside for now).
>
> Hi Rafael
>
> Take a look at for example the bcm911360k.dts
>
>         aliases {
>                 serial0 = &uart3;
>         };
>
>         chosen {
>                 stdout-path = "serial0:115200n8";
>         };
>
> You need an alias to the serial device you want to us, and you should
> list the speed, parity, bits etc.

That was actually my first try (just with s/uart3/uart0) and I got the same problem.
