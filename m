From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 1/3] dt-bindings: net: ftgmac100: Document AST2600
 compatible
Date: Thu, 10 Oct 2019 11:10:44 +1100
Message-ID: <991382b92be6b78e596b089d2c3677358afa52fc.camel@kernel.crashing.org>
References: <20191008115143.14149-1-andrew@aj.id.au>
         <20191008115143.14149-2-andrew@aj.id.au>
         <75d915aec936be64ea5ebd63402efd90bb1c29d9.camel@kernel.crashing.org>
         <6f70580a-4b4b-45e0-8899-8a74f9587002@www.fastmail.com>
         <4998960d-6125-4402-9905-869653a84e52@www.fastmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4998960d-6125-4402-9905-869653a84e52@www.fastmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>, netdev <netdev@vger.kernel.org>
Cc: David Miller <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
List-Id: devicetree@vger.kernel.org

On Wed, 2019-10-09 at 15:25 +1030, Andrew Jeffery wrote:
> 
> On Wed, 9 Oct 2019, at 15:19, Andrew Jeffery wrote:
> > 
> > 
> > On Wed, 9 Oct 2019, at 15:08, Benjamin Herrenschmidt wrote:
> > > On Tue, 2019-10-08 at 22:21 +1030, Andrew Jeffery wrote:
> > > > The AST2600 contains an FTGMAC100-compatible MAC, although it
> > > > no-
> > > > longer
> > > > contains an MDIO controller.
> > > 
> > > How do you talk to the PHY then ?
> > 
> > There are still MDIO controllers, they're just not in the MAC IP on
> > the 2600.
> 
> Sorry, on reflection that description is a little ambiguous in its
> use of 'it'. I'll
> fix that in v2 as well. Does this read better?
> 
> "The AST2600 contains an FTGMAC100-compatible MAC, although the MAC
> no-longer contains an MDIO controller."

That's fine. Or to be pendantic, say the MDIO controller has been moved
of the MAC unit into its own separate block or something along those
lines so people like me don't get anxious :)

Cheers,
Ben.
