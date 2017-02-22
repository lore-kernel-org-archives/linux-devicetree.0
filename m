From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v4 33/36] media: imx: redo pixel format enumeration and
 negotiation
Date: Wed, 22 Feb 2017 15:52:50 -0800
Message-ID: <9a4a4da7-418e-860e-05ec-da44b3c945cc@gmail.com>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
 <1487211578-11360-34-git-send-email-steve_longerbeam@mentor.com>
 <1487244744.2377.38.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1487244744.2377.38.camel@pengutronix.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, Steve Longerbeam <steve_longerbeam@mentor.com>, pavel@ucw.cz, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, linux@armlinux.org.uk, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, sakari.ailus@linux.intel.com, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Philipp,


On 02/16/2017 03:32 AM, Philipp Zabel wrote:
> On Wed, 2017-02-15 at 18:19 -0800, Steve Longerbeam wrote:
>> The previous API and negotiation of mbus codes and pixel formats
>> was broken, and has been completely redone.
>>
>> The negotiation of media bus codes should be as follows:
>>
>> CSI:
>>
>> sink pad     direct src pad      IDMAC src pad
>> --------     ----------------    -------------
>> RGB (any)        IPU RGB           RGB (any)
>> YUV (any)        IPU YUV           YUV (any)
>> Bayer              N/A             must be same bayer code as sink
>
> The IDMAC src pad should also use the internal 32-bit RGB / YUV format,
> except if bayer/raw mode is selected, in which case the attached capture
> video device should only allow a single mode corresponding to the output
> pad media bus format.

The IDMAC source pad is going to memory, so it has left the IPU.
Are you sure it should be an internal IPU format? I realize it
is linked to a capture device node, and the IPU format could then
be translated to a v4l2 fourcc by the capture device, but IMHO this
pad is external to the IPU.

Steve
