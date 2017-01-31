From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH v3 20/24] media: imx: Add Camera Interface subdev driver
Date: Tue, 31 Jan 2017 20:33:40 +0000
Message-ID: <20170131203340.GC27312@n2100.armlinux.org.uk>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
 <1483755102-24785-21-git-send-email-steve_longerbeam@mentor.com>
 <b7456d40-040d-41b7-45bc-ef6709ab7933@xs4all.nl>
 <20170131134252.GX27312@n2100.armlinux.org.uk>
 <b0517394-7717-3e1d-b850-e2b69a9c19e9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <b0517394-7717-3e1d-b850-e2b69a9c19e9@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Steve Longerbeam <slongerbeam@gmail.com>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, nick@shmanahar.org, songjun.wu@microchip.com, Hans Verkuil <hverkuil@xs4all.nl>, Steve Longerbeam <steve_longerbeam@mentor.com>, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, p.zabel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail.com
List-Id: devicetree@vger.kernel.org

On Tue, Jan 31, 2017 at 10:21:26AM -0800, Steve Longerbeam wrote:
> On 01/31/2017 05:42 AM, Russell King - ARM Linux wrote:
> >On Fri, Jan 20, 2017 at 03:38:28PM +0100, Hans Verkuil wrote:
> >>Should be set to something like 'platform:imx-media-camif'. v4l2-compliance
> >>should complain about this.
> >... and more.
> 
> Right, in version 3 that you are working with, no v4l2-compliance fixes were
> in yet. A lot of the compliance errors are fixed, please look in latest
> branch
> imx-media-staging-md-wip at git@github.com:slongerbeam/mediatree.git.

Sorry, I'm not prepared to pull random trees from github as there's
no easy way to see what's in the branch.

I've always disliked github because its web interface makes it soo
difficult to navigate around git trees hosted there.  You can see
a commit, you can see a diff of the commit.  You can get a list of
branches.  But there seems to be no way to get a list of commits
similar to "git log" or even a one-line summary of each commit on
a branch.  If there is, it's completely non-obvious (which I think is
much of the problem with github, it's web interface is horrendous.)

Or you can clone/pull the tree without knowing what you're fetching
(eg, what the tree is based upon.)

Or you can waste time clicking repeatedly on the "parent" commit link
on each patch working your way back through the history...

Well, it looks like it's bsaed on 4.10-rc1 with who-knows-what work
from the linux-media tree (I didn't try and go back any further.)
As I don't want to take a whole pile of other changes into my tree,
I'm certainly not going to pull from your github tree.  Sorry.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
