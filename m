From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH v5 00/39] i.MX Media Driver
Date: Sun, 19 Mar 2017 15:09:22 +0000
Message-ID: <20170319150922.GV21222@n2100.armlinux.org.uk>
References: <1489121599-23206-1-git-send-email-steve_longerbeam@mentor.com>
 <20170318192258.GL21222@n2100.armlinux.org.uk>
 <aef6c412-5464-726b-42f6-a24b7323aa9c@mentor.com>
 <20170318204324.GM21222@n2100.armlinux.org.uk>
 <4e7f91fa-e1c4-1cbc-2542-2aaf19a35329@mentor.com>
 <20170319142110.GT21222@n2100.armlinux.org.uk>
 <20170319142240.GA23922@n2100.armlinux.org.uk>
 <51e2be34-6fa2-9d91-5111-adcd697b3e3f@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <51e2be34-6fa2-9d91-5111-adcd697b3e3f@mentor.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, sakari.ailus@linux.intel.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, pavel@ucw.cz, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, Steve Longerbeam <steve_longerbeam@mentor.com>, shuah@kernel.org, geert@linux-m68k.org, Steve Longerbeam <slongerbeam@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, laurent.pinchart+renesas@ideasonboard.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, p.zabel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, sud
List-Id: devicetree@vger.kernel.org

On Sun, Mar 19, 2017 at 05:00:08PM +0200, Vladimir Zapolskiy wrote:
> On 03/19/2017 04:22 PM, Russell King - ARM Linux wrote:
> > On Sun, Mar 19, 2017 at 02:21:10PM +0000, Russell King - ARM Linux wrote:
> >> There's a good reason why I dumped a full debug log using GST_DEBUG=*:9,
> >> analysed it for the cause of the failure, and tried several different
> >> pipelines, including the standard bayer2rgb plugin.
> >>
> >> Please don't blame this on random stuff after analysis of the logs _and_
> >> reading the appropriate plugin code has shown where the problem is.  I
> >> know gstreamer can be very complex, but it's very possible to analyse
> >> the cause of problems and pin them down with detailed logs in conjunction
> >> with the source code.
> > 
> > Oh, and the proof of correct analysis is that fixing the kernel capture
> > driver to enumerate the frame sizes and intervals fixes the issue, even
> > with bayer2rgbneon being used.
> > 
> > Therefore, there is _no way_ what so ever that it could be caused by that
> > plugin.
> > 
> 
> Hey, no blaming of the unknown to me bayer2rgbneon element from my side,
> I've just asked an innocent question, thanks for reply. I failed to find
> the source code of the plugin, I was interested to compare its performance
> and features with mine in-house NEON powered RGGB/BGGR to RGB24 GStreamer
> conversion element, which is written years ago. My question was offtopic.

If you wanted to know where to get it from, you should've asked that.
You can find all the bits here:

	https://git.phytec.de/

You need bayer2rgb-neon and gst-bayer2rgb-neon, and it requires some
fixes to the configure script and Makefiles get it to build if you
don't have gengenopt available.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
