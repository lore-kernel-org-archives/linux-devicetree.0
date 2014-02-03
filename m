From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH v2] of: make of_get_phy_mode parse 'phy-connection-type'
Date: Mon, 03 Feb 2014 14:37:02 +0000
Message-ID: <20140203143702.14B27C40619@trevor.secretlab.ca>
References: <20131114074711.9A8C5C402E1@trevor.secretlab.ca> < 1384496612-28392-1-git-send-email-f.fainelli@gmail.com> <20131116122451. 3F0B9C4038F@trevor.secretlab.ca> <52E47B51.3030308@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <52E47B51.3030308@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: rob.herring@calxeda.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, 25 Jan 2014 19:04:49 -0800, Florian Fainelli <f.fainelli@gmail.=
com> wrote:
> Le 16/11/2013 04:24, Grant Likely a =C3=A9crit :
> > On Fri, 15 Nov 2013 06:23:32 +0000, Florian Fainelli <f.fainelli@gm=
ail.com> wrote:
> >> Per the ePAPR v1.1 specification, 'phy-connection-type' is the can=
onical
> >> property name for describing an Ethernet to PHY connection type. M=
ake
> >> sure that of_get_phy_mode() also attempts to parse that property a=
nd
> >> update the comments mentioning 'phy-mode' to also include
> >> 'phy-connection-type'.
> >>
> >> Acked-by: Grant Likely <grant.likely@linaro.org>
> >> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> >
> > Applied, thanks
>=20
> Grant, where is that patch, and will it be part of a pull request to =
3.14?

I accidentally dropped it for v3.14. It will be in 3.15

g.
