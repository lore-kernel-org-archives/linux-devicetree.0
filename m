From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v6 00/39] i.MX Media Driver
Date: Thu, 30 Mar 2017 09:12:29 -0700
Message-ID: <d715bcdf-b2df-8080-6ab4-854aeace31a8@gmail.com>
References: <1490661656-10318-1-git-send-email-steve_longerbeam@mentor.com>
 <20170330110249.GF7909@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170330110249.GF7909@n2100.armlinux.org.uk>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, sakari.ailus@linux.intel.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, Steve Longerbeam <steve_longerbeam@mentor.com>, pavel@ucw.cz, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, p.zabel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail.com
List-Id: devicetree@vger.kernel.org



On 03/30/2017 04:02 AM, Russell King - ARM Linux wrote:
> This fails at step 1.  The removal of the frame interval support now
> means my setup script fails when trying to set the frame interval on
> the camera:
>
> Enumerating pads and links
> Setting up format SRGGB8_1X8 816x616 on pad imx219 0-0010/0
> Format set: SRGGB8_1X8 816x616
> Setting up frame interval 1/25 on pad imx219 0-0010/0
> Frame interval set: 1/25
> Setting up format SRGGB8_1X8 816x616 on pad imx6-mipi-csi2/0
> Format set: SRGGB8_1X8 816x616
> Setting up frame interval 1/25 on pad imx6-mipi-csi2/0
> Unable to set frame interval: Inappropriate ioctl for device (-25)Unable to setup formats: Inappropriate ioctl for device (25)
>
> This is because media-ctl tries to propagate it from the imx219 source
> pad to the csi2 sink pad, and the csi2 now fails that ioctl.

I assume you're using Philipp's frame interval patches to media-ctl.
Can you make the frame interval propagation optional in those patches?
I.e. don't error-out with a failure code if the ioctl returns ENOTTY.

Steve

>
> This makes media-ctl return a failure code, which means that it's not
> possible for a script to determine whether the failure was due to the
> camera setup or something else.  So, we have to assume that the
> whole command failed.
>
> This is completely broken, and I'm even more convinced that those
> arguing for this behaviour really have not thought it through well
> enough before demanding that this code was removed.
>
> As far as I'm concerned, the end result is completely broken and
> unusable.  I'm going to be merging the frame interval support back
> into my test tree, because that's the only sane thing to do.
>
> If v4l2 people want to object to having frame interval support present
> for all subdevs, then _they_ need to make sure that the rest of their
> software conforms to what they're telling people to do.
>
