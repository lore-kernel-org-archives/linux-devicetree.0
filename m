From: Timur Tabi <timur@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: net: qcom: Add binding for shared
 mdio bus
Date: Thu, 20 Sep 2018 08:42:04 -0500
Message-ID: <78719753-77bd-596a-dfc7-ccd676850283@kernel.org>
References: <1537174411-34510-1-git-send-email-dongsheng.wang@hxt-semitech.com>
 <1537174411-34510-3-git-send-email-dongsheng.wang@hxt-semitech.com>
 <20180917145028.GC5458@lunn.ch>
 <b01bb33b30164088a9cae59a825acdc9@HXTBJIDCEMVIW02.hxtcorp.net>
 <13018118-9883-4b26-9017-b324d745cc58@gmail.com>
 <71ba0057c5e547c382793be899e3268a@HXTBJIDCEMVIW02.hxtcorp.net>
 <20180918123545.GA29092@lunn.ch>
 <7696bcd8ca594b1da683b437197b4ddf@HXTBJIDCEMVIW02.hxtcorp.net>
 <20180919122521.GA26940@lunn.ch>
 <1226d3d3-e2ba-571d-5b70-b246cbde2fb6@kernel.org>
 <20180919152052.GD17466@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180919152052.GD17466@lunn.ch>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Wang, Dongsheng" <dongsheng.wang@hxt-semitech.com>, Florian Fainelli <f.fainelli@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>, "Zheng, Joey" <yu.zheng@hxt-semitech.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 9/19/18 10:20 AM, Andrew Lunn wrote:
> I suspect that is not going to be easy. Last time i looked, the ACPI
> standard had nothing about MDIO busses or PHYs. Marcin Wojtas did some
> work in this area a while back for the mvpp2, but if i remember
> correctly, he worked around this by simply not having a PHY when using
> ACPI, and making use of a MAC interrupt which indicated when there was
> link.
> 
> Whoever implements this first needs to be an ACPI expert and probably
> needs to write it up and submit it as an amendment to the ACPI
> standard.

If that's what it takes, then so be it.  But adding DT support for a 
device that is only used on ACPI platforms is not a worthwhile endeavor.

After ACPI support is merged, Dongsheng can choose to add DT support to 
maintain parity, if he wants.  Maybe one day the MSM developers will use 
the upstream driver on one of their SOCs.
