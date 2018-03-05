Return-Path: <SRS0=ZXHR=F3=mleia.com=vz@kernel.org>
Subject: Re: [PATCH v2 2/2] hwrng: mxc-rnga - add driver support on boards
 with device tree
References: <20180305222100.29351-1-vz@mleia.com>
 <20180305222100.29351-3-vz@mleia.com>
 <CAOMZO5DmtaAoZ5CEJDHjLSc4dwjHB4p1uO69-x8KNJ6bvvT7Dw@mail.gmail.com>
From: Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <4e2a63d3-9011-24fb-15b7-d021748931ac@mleia.com>
Date: Tue, 6 Mar 2018 01:44:40 +0200
MIME-Version: 1.0
In-Reply-To: <CAOMZO5DmtaAoZ5CEJDHjLSc4dwjHB4p1uO69-x8KNJ6bvvT7Dw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Fabio Estevam <festevam@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Matt Mackall <mpm@selenic.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-crypto@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Fabio,

On 03/06/2018 12:24 AM, Fabio Estevam wrote:
> Hi Vladimir,
> 
> On Mon, Mar 5, 2018 at 7:21 PM, Vladimir Zapolskiy <vz@mleia.com> wrote:
>> The driver works well on i.MX31 powered boards with device description
>> taken from board device tree, the only change to add to the driver is
>> the missing OF device id, the affected list of included headers and
>> indentation in platform driver struct are beautified a little.
> 
> Patch looks good.
> 

you are welcome to ack :)

> I have an off-topic question though :-)
> 
> Do you have mx31 device tree related patches so that you can test this?

Yes, I have a pretty good i.MX31 dtsi change (tested everything but USB
and multimedia, and that notorious watchdog problem still has to be
agreed with Uwe and solved), but I'm trying to save my time a little, and
my plan is to send everything altogether as a single imx31.dtsi update
(without instant pinctrl though). And basically RNGA support is the only
missing part at the moment.

> Do we have mx31 pinctrl support?

Yes, I have a complete and well tested i.MX31 pinctrl driver, it is done
similarly to all known Freescale pin controller drivers.

I sort of dislike it, and my preference is to "upgrade" it to utilize
generic pin multiplexing with groups, functions and pin configuration
as it is described in pinctrl-bindings.txt, then hopefully some ideas
or code can be migrated to support modern Freescale/NXP SoCs. Legacy
i.MX31 could serve as a distant and convenient test site in my opinion.

> Please advise.
> 

--
With best wishes,
Vladimir
