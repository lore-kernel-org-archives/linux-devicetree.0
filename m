From: "Andrew Jeffery" <andrew@aj.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_1/3]_dt-bindings:_net:_ftgmac100:_Document_AST2600_?=
 =?UTF-8?Q?compatible?=
Date: Wed, 09 Oct 2019 15:19:53 +1030
Message-ID: <6f70580a-4b4b-45e0-8899-8a74f9587002@www.fastmail.com>
References: <20191008115143.14149-1-andrew@aj.id.au>
 <20191008115143.14149-2-andrew@aj.id.au>
 <75d915aec936be64ea5ebd63402efd90bb1c29d9.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <75d915aec936be64ea5ebd63402efd90bb1c29d9.camel@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, netdev <netdev@vger.kernel.org>
Cc: David Miller <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
List-Id: devicetree@vger.kernel.org



On Wed, 9 Oct 2019, at 15:08, Benjamin Herrenschmidt wrote:
> On Tue, 2019-10-08 at 22:21 +1030, Andrew Jeffery wrote:
> > The AST2600 contains an FTGMAC100-compatible MAC, although it no-
> > longer
> > contains an MDIO controller.
> 
> How do you talk to the PHY then ?

There are still MDIO controllers, they're just not in the MAC IP on the 2600.

Andrew
