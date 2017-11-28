From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH 03/13] ARM: dts: imx6qdl: SolidRun: move microsom
 includes into .dts
Date: Tue, 28 Nov 2017 10:45:03 +0000
Message-ID: <20171128104503.GU31757@n2100.armlinux.org.uk>
References: <20171127165134.GH31757@n2100.armlinux.org.uk>
 <E1eJMdo-0002qf-2D@rmk-PC.armlinux.org.uk>
 <CALHpu36Kjy4SSn1m8ZOYwEr+9u67dobfNHiOX6s75UFGVm3atw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CALHpu36Kjy4SSn1m8ZOYwEr+9u67dobfNHiOX6s75UFGVm3atw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jon Nettleton <jon.nettleton@gmail.com>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 28, 2017 at 05:46:07AM +0100, Jon Nettleton wrote:
> On Mon, Nov 27, 2017 at 5:52 PM, Russell King <rmk+kernel@armlinux.org.uk>
> wrote:
> 
> > Move the microsom includes into the .dts files so different options can
> > be accomodated at the lowest level.
> >
> > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> 
> Since we are going through and adding the som dtsi include to all the
> device-tree files, would it make sense to rename the microsom.dtsi at this
> point in time?  Perhaps something like imx6qdl-sr-microsom.dtsi?

Shawn,

Having discussed with Jon this morning, we've decided that as 
"imx6qdl-microsom.dtsi" is too generic, we'll to rename that file as
"imx6qdl-sr-som.dtsi" instead.  New patch series on its way.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
