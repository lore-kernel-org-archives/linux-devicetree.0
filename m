From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 3/3] net: phy: Enable C45 PHYs with vendor
 specific address space
Date: Wed, 18 Apr 2018 14:27:07 +0200
Message-ID: <20180418122707.GC31643@lunn.ch>
References: <20180417090233.21548-1-vicentiu.galanopulo@nxp.com>
 <20180417090233.21548-4-vicentiu.galanopulo@nxp.com>
 <b62735bd-d411-2d21-16a2-f6cf7e5d7e4d@gmail.com>
 <AM0PR04MB411620E8DB3E7EF8E55C99B5EEB60@AM0PR04MB4116.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AM0PR04MB411620E8DB3E7EF8E55C99B5EEB60@AM0PR04MB4116.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?VmljZW7Fo2l1?= Galanopulo <vicentiu.galanopulo@nxp.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, "robh@kernel.org" <robh@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "davem@davemloft.net" <davem@davemloft.net>, "marcel@holtmann.org" <marcel@holtmann.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandru Marginean <alexandru.marginean@nxp.com>, Madalin-cristian Bucur <madalin.bucur@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 18, 2018 at 09:38:47AM +0000, Vicenţiu Galanopulo wrote:
> 
> 
> > > Having dev-addr stored in devices_addrs, in get_phy_c45_ids(), when
> > > probing the identifiers, dev-addr can be extracted from devices_addrs
> > > and probed if devices_addrs[current_identifier] is not 0.
> > 
> > I must clearly be missing something, but why are you introducing all these
> > conditionals instead of updating the existing code to be able to operate against
> > an arbitrary dev-addr value, and then just making sure the first thing you do is
> > fetch that property from Device Tree? There is no way someone is going to be
> > testing with your specific use case in the future (except yourselves) so unless you
> > make supporting an arbitrary "dev-addr" value become part of how the code
> > works, this is going to be breaking badly.
> >
> 
> Hi Florian,
> 
> My intention was to have this patch as "plugin" and modify the existing kernel API little to none.

Hi Vicenţiu

In Linux, kernel APIs are not sacred. If you need to change them, do
so.

We want a clear, well integrated solution, with minimal
duplication.

	Andrew
