From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [EXT] Re: [PATCH 1/3] enetc: add hardware timestamping support
Date: Sun, 19 May 2019 21:41:07 -0700
Message-ID: <20190520044107.ugro6zb7vkveyjw5@localhost>
References: <20190516100028.48256-1-yangbo.lu@nxp.com>
 <20190516100028.48256-2-yangbo.lu@nxp.com>
 <20190516143251.akbt3ns6ue2jrhl5@localhost>
 <VI1PR0401MB2237FB387B3F5ABC70EE4285F8060@VI1PR0401MB2237.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <VI1PR0401MB2237FB387B3F5ABC70EE4285F8060@VI1PR0401MB2237.eurprd04.prod.outlook.com>
Sender: netdev-owner@vger.kernel.org
To: "Y.b. Lu" <yangbo.lu@nxp.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, David Miller <davem@davemloft.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 20, 2019 at 03:20:23AM +0000, Y.b. Lu wrote:
> > > +config FSL_ENETC_HW_TIMESTAMPING
> > > +     bool "ENETC hardware timestamping support"
> > > +     depends on FSL_ENETC || FSL_ENETC_VF
> > > +     help
> > > +       Enable hardware timestamping support on the Ethernet packets
> > > +       using the SO_TIMESTAMPING API. Because the RX BD ring dynamic
> > > +       allocation hasn't been supported and it's too expensive to use
> > 
> > s/it's/it is/
> 
> [Y.b. Lu] Will modify it. BTW, may I know what's the purpose of dropping single quote character? For searching, script checking, or something else?

Simply because "it's" is informal speech, but the Kconfig help is
formal technical documentation.  (Or at least it should be!)

Thanks,
Richard
