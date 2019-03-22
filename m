Return-Path: <shawnguo@kernel.org>
Date: Fri, 22 Mar 2019 09:22:04 +0800
From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: PM: RE: [PATCH] ARM: dts: imx6dl-yapp4: Use correct pseudo PHY
 address for the switch
Message-ID: <20190322012203.GQ12513@dragon>
References: <1553080145-29348-1-git-send-email-michal.vokac@ysoft.com>
 <3351685.tXMZElDEK0@debian64>
 <517b0bc6-9128-02be-7adb-7da286a0c00d@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <517b0bc6-9128-02be-7adb-7da286a0c00d@ysoft.com>
To: Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Cc: Christian Lamparter <chunkeey@gmail.com>, Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, Mar 21, 2019 at 01:44:26PM +0100, Michal Vokáč wrote:
> Hi Christian,
> 
> I added all the original recipients back to your PM as we may get some
> useful feedback from someone.
> 
> On 21. 03. 19 0:17, Christian Lamparter wrote:
> >On Wednesday, March 20, 2019 12:09:05 PM CET you wrote:
> >>The switch is accessible through pseudo PHY which is located at 0x10.
> >
> >It doesn't look like your patch made it to the device-tree patchwork?!
> >(Maybe your @ysoft.com is blacklisted or something else is broken?)
> 
> I am aware of that and I am quite sure my mail is not blacklisted.
> I submitted quite some patches recently and some of those made it to
> the device-tree patchwork with no problem. I've got the impression that
> only patches that modify something inside Documentation/devicetree/ are
> visible there (but I do not really know how the system works).
> 
> @Rob, would you mind to shortly clarify how this works?
> 
> >Also I don't think devicetree-tree would merge it. I think the best bet
> >would be to resent the mail and include netdev mailing list and everyone
> >from the get_maintainer.pl output:
> 
> I always use the get_maintainter.pl script to get some initial list and
> then I apply common sense to shrink/broaden the list to which people and
> lists send the patches.
> 
> >Shawn Guo <shawnguo@kernel.org> (maintainer:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
> >Sascha Hauer <s.hauer@pengutronix.de> (maintainer:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
> >Pengutronix Kernel Team <kernel@pengutronix.de> (reviewer:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
> >Fabio Estevam <festevam@gmail.com> (reviewer:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
> >NXP Linux Team <linux-imx@nxp.com> (reviewer:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
> >devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
> >linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
> 
> In this case this is really trivial patch so I think bothering all those
> people is not necessary. In my case the script actually reports more
> items then what you posted.

For future patches, please do copy folks above.  We need more eyes.

Shawn
