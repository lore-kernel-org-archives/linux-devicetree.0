From: Timur Tabi <timur@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: net: qcom: Add binding for shared
 mdio bus
Date: Wed, 19 Sep 2018 09:05:36 -0500
Message-ID: <1226d3d3-e2ba-571d-5b70-b246cbde2fb6@kernel.org>
References: <1537174411-34510-1-git-send-email-dongsheng.wang@hxt-semitech.com>
 <1537174411-34510-3-git-send-email-dongsheng.wang@hxt-semitech.com>
 <20180917145028.GC5458@lunn.ch>
 <b01bb33b30164088a9cae59a825acdc9@HXTBJIDCEMVIW02.hxtcorp.net>
 <13018118-9883-4b26-9017-b324d745cc58@gmail.com>
 <71ba0057c5e547c382793be899e3268a@HXTBJIDCEMVIW02.hxtcorp.net>
 <20180918123545.GA29092@lunn.ch>
 <7696bcd8ca594b1da683b437197b4ddf@HXTBJIDCEMVIW02.hxtcorp.net>
 <20180919122521.GA26940@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180919122521.GA26940@lunn.ch>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, "Wang, Dongsheng" <dongsheng.wang@hxt-semitech.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>, "Zheng, Joey" <yu.zheng@hxt-semitech.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 9/19/18 7:25 AM, Andrew Lunn wrote:
> ACPI is completely separate and should not affect the DT binding.
> I've not yet looked at the ACPI changes you added.

Just FYI, there is no device tree platform on which the upstream EMAC 
driver works.  All of the DT code in the driver is theoretical.  It 
worked once on a prototype platform, when I originally wrote the code, 
but since then DT support is mostly a guess.

The focus of any patches for the EMAC should be ACPI, not DT.  If 
anything, ACPI support should come first.  No one should be writing or 
reviewing DT code before ACPI code.

The upstream EMAC driver is only known to work on the QDF2400, which is 
an ACPI-only chip.  I feel like I've been repeating this too often.
