From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v5 21/39] UAPI: Add media UAPI Kbuild file
Date: Sat, 11 Mar 2017 10:20:39 -0800
Message-ID: <184c02bf-782d-6dbe-e603-a82ac8dcc8b6@gmail.com>
References: <1489121599-23206-1-git-send-email-steve_longerbeam@mentor.com>
 <1489121599-23206-22-git-send-email-steve_longerbeam@mentor.com>
 <20170311134931.GP3220@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170311134931.GP3220@valkosipuli.retiisi.org.uk>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, sakari.ailus@linux.intel.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, Steve Longerbeam <steve_longerbeam@mentor.com>, pavel@ucw.cz, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, linux@armlinux.org.uk, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, p.zabel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail
List-Id: devicetree@vger.kernel.org



On 03/11/2017 05:49 AM, Sakari Ailus wrote:
> Hi Steve,
>
> On Thu, Mar 09, 2017 at 08:53:01PM -0800, Steve Longerbeam wrote:
>> Add an empty UAPI Kbuild file for media UAPI headers.
>>
>> Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
>
> The existing V4L2 UAPI headers are under include/uapi/linux. Could you use
> that directory instead?
>
> I actually wouldn't really object doing this but it should have been done in
> 2002 or so when the first V4L2 header was added. Now the benefit is
> questionable.
>

Agreed, I think the current headers should be moved to uapi/media
eventually, but for now I'll go ahead and put under uapi/linux.

Steve
