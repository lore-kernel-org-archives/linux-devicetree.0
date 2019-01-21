From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/1] arm64: dts: marvell: armada-ap806: reserve PSCI
 area
Date: Mon, 21 Jan 2019 11:41:39 +0100
Message-ID: <20190121104139.GA16002@kroah.com>
References: <20181221164503.5128-1-xypron.glpk@gmx.de>
 <874lagpycx.fsf@FE-laptop>
 <2c42946c-8bc1-d4cf-b6af-da54aba61c94@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2c42946c-8bc1-d4cf-b6af-da54aba61c94@gmx.de>
Sender: stable-owner@vger.kernel.org
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: stable@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Jan 20, 2019 at 03:14:05PM +0100, Heinrich Schuchardt wrote:
> On 1/10/19 12:04 PM, Gregory CLEMENT wrote:
> > Hi Heinrich,
> >  
> >  On ven., déc. 21 2018, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> > 
> >> The memory area [0x4000000-0x4200000[ is occupied by the PSCI firmware. Any
> >> attempt to access it from Linux leads to an immediate crash.
> >>
> >> So let's make the same memory reservation as the vendor kernel.
> >>
> >> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> > 
> > 
> > Applied on mvebu/fixes
> > 
> > I added a comment about the use with a mainline /U-Boot
> > 
> > Thanks,
> > 
> > Gregory
> > 
> > 
> 
> 
> Hello Greg,
> 
> please, consider
> 
> arm64: dts: marvell: armada-ap806: reserve PSCI area
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.0-rc2&id=132ac39cffbcfed80ada38ef0fc6d34d95da7be6
> 
> for backporting to v4.19.
> 
> This patch is needed to run Linux on the MACCHIATObin and other boards.

Now queued up, thanks.

greg k-h
