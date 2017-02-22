From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v4 12/36] add mux and video interface bridge entity
 functions
Date: Wed, 22 Feb 2017 09:19:27 -0800
Message-ID: <1fdb3bb6-46fc-40d9-0011-3f53aa2ac899@gmail.com>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
 <1487211578-11360-13-git-send-email-steve_longerbeam@mentor.com>
 <20170219212812.GA28347@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170219212812.GA28347@amd>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, sakari.ailus@linux.intel.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, Steve Longerbeam <steve_longerbeam@mentor.com>, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, linux@armlinux.org.uk, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, p.zabel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail.com
List-Id: devicetree@vger.kernel.org



On 02/19/2017 01:28 PM, Pavel Machek wrote:
> On Wed 2017-02-15 18:19:14, Steve Longerbeam wrote:
>> From: Philipp Zabel <p.zabel@pengutronix.de>
>>
>> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
>>
>> - renamed MEDIA_ENT_F_MUX to MEDIA_ENT_F_VID_MUX
>>
>> Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
>
> This is slightly "interesting" format of changelog. Normally signoffs
> go below.
>
>> diff --git a/Documentation/media/uapi/mediactl/media-types.rst b/Documentation/media/uapi/mediactl/media-types.rst
>> index 3e03dc2..023be29 100644
>> --- a/Documentation/media/uapi/mediactl/media-types.rst
>> +++ b/Documentation/media/uapi/mediactl/media-types.rst
>> @@ -298,6 +298,28 @@ Types and flags used to represent the media graph elements
>>  	  received on its sink pad and outputs the statistics data on
>>  	  its source pad.
>>
>> +    -  ..  row 29
>> +
>> +       ..  _MEDIA-ENT-F-MUX:
>> +
>> +       -  ``MEDIA_ENT_F_MUX``
>
> And you probably want to rename it here, too.

Done, thanks.
Steve

>
> With that fixed:
>
> Reviewed-by: Pavel Machek <pavel@ucw.cz>
>
