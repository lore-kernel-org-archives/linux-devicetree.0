From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v3 18/24] media: imx: Add SMFC subdev driver
Date: Wed, 1 Feb 2017 10:52:35 -0800
Message-ID: <af7f27be-827d-548f-5b26-1e987069a6c0@gmail.com>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
 <1483755102-24785-19-git-send-email-steve_longerbeam@mentor.com>
 <20170201183918.GP27312@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170201183918.GP27312@n2100.armlinux.org.uk>
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
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, Steve Longerbeam <steve_longerbeam@mentor.com>, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, p.zabel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail.com
List-Id: devicetree@vger.kernel.org



On 02/01/2017 10:39 AM, Russell King - ARM Linux wrote:
> Hi Steve,
>
> On Fri, Jan 06, 2017 at 06:11:36PM -0800, Steve Longerbeam wrote:
>> +/*
>> + * Min/Max supported width and heights.
>> + *
>> + * We allow planar output from the SMFC, so we have to align
>> + * output width by 16 pixels to meet IDMAC alignment requirements,
>> + * which also means input width must have the same alignment.
>> + */
>> +#define MIN_W       176
>> +#define MIN_H       144
>> +#define MAX_W      8192
>> +#define MAX_H      4096
>> +#define W_ALIGN    4 /* multiple of 16 pixels */
> Does this only apply to planar formats?
>
> I notice Philipp's driver allows 8 pixel alignment.  If it's only for
> planar formats, it ought to determine the alignment based on the
> requested format rather than hard-coding it to the maximum alignment
> of all the supported formats.

yeah, I got lazy/tired there. I will fix this.

Steve
