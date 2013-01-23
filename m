From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v2 1/3] arm: mvebu: Add support for USB host
 controllers in Armada 370/XP
Date: Wed, 23 Jan 2013 12:40:25 -0500
Message-ID: <20130123174025.GV1758@titan.lakedaemon.net>
References: <1358954792-16160-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <CALF0-+W8dVLHF66VKni+5ZsQpFd=cGDXE0TD=dRc1B=ptrAMUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CALF0-+W8dVLHF66VKni+5ZsQpFd=cGDXE0TD=dRc1B=ptrAMUg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <elezegarcia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Michael Opdenacker <michael.opdenacker-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, iwamatsu-+mkmVskJBflAfugRpC6u6w@public.gmane.org, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 23, 2013 at 02:06:12PM -0300, Ezequiel Garcia wrote:
> Jason,
> 
> On Wed, Jan 23, 2013 at 12:26 PM, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > The Armada 370 and Armada XP SoC has an Orion EHCI USB controller.
> > This patch adds support for this controller in Armada 370
> > and Armada XP SoC common device tree files.
> >
> > Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > Tested-by: Nobuhiro Iwamatsu <iwamatsu-+mkmVskJBflAfugRpC6u6w@public.gmane.org>
> > Tested-by: Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
> > Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> > Changes from v1:
> >  * Remove uneeded USB_ARCH_HAS_EHCI selection as noted by Florian.
> >
> >  arch/arm/boot/dts/armada-370-xp.dtsi |   15 +++++++++++++++
> >  arch/arm/boot/dts/armada-370.dtsi    |    9 +++++++++
> >  arch/arm/boot/dts/armada-xp.dtsi     |   17 +++++++++++++++++
> >  3 files changed, 41 insertions(+), 0 deletions(-)
> 
> Do you think we're still in time to get this series into v3.9 (given
> we decide soon on the OpenBlocks issue)?

That shouldn't be a problem.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
