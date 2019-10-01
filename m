From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 0/3] Pine64+ specific hacks for RTL8211E Ethernet PHY
Date: Tue, 1 Oct 2019 18:52:47 +0200
Message-ID: <20191001165247.GE2031@lunn.ch>
References: <20191001082912.12905-1-icenowy@aosc.io>
 <3ef60a0c-5cfd-420b-6cad-2c16eb2a6c01@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3ef60a0c-5cfd-420b-6cad-2c16eb2a6c01@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Tue, Oct 01, 2019 at 09:47:08AM -0700, Florian Fainelli wrote:
> On 10/1/19 1:29 AM, Icenowy Zheng wrote:
> > There're some Pine64+ boards known to have broken RTL8211E chips, and
> > a hack is given by Pine64+, which is said to be from Realtek.
> > 
> > This patchset adds the hack.
> > 
> > The hack is taken from U-Boot, and it contains magic numbers without
> > any document.
> 
> Such hacks are the very reason why PHY fixups exists, please investigate
> working with Realtek first to understand how to make this hack less of a
> hack so it is understood what it does and you can either add proper
> infrastructure to the realtek PHY driver to perform that hack, or if
> that is not an option, register a board specific fixup.

Hi Icenowy

It would also be nice to know if only Pine64 has these bad PHYs, or if
they were in the general distribution chain and other boards might
have them as well.

     Andrew
