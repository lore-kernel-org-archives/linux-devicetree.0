From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v4 15/36] platform: add video-multiplexer subdevice driver
Date: Tue, 28 Feb 2017 16:20:07 -0800
Message-ID: <6262f5bd-08e0-20b0-9e41-a01db75587dd@gmail.com>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
 <1487211578-11360-16-git-send-email-steve_longerbeam@mentor.com>
 <20170227144153.g4jzzbrcb7oyddyj@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170227144153.g4jzzbrcb7oyddyj@rob-hp-laptop>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Rob Herring <robh@kernel.org>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, sakari.ailus@linux.intel.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, pavel@ucw.cz, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, linux@armlinux.org.uk, geert@linux-m68k.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, Steve Longerbeam <steve_longerbeam@mentor.com>, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, p.zabel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.orgsu
List-Id: devicetree@vger.kernel.org



On 02/27/2017 06:41 AM, Rob Herring wrote:
> On Wed, Feb 15, 2017 at 06:19:17PM -0800, Steve Longerbeam wrote:
>> From: Philipp Zabel <p.zabel@pengutronix.de>
>>
>> This driver can handle SoC internal and external video bus multiplexers,
>> controlled either by register bit fields or by a GPIO. The subdevice
>> passes through frame interval and mbus configuration of the active input
>> to the output side.
>>
>> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
>> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
>>
>> --
>>
>> - fixed a cut&paste error in vidsw_remove(): v4l2_async_register_subdev()
>>    should be unregister.
>>
>> - added media_entity_cleanup() and v4l2_device_unregister_subdev()
>>    to vidsw_remove().
>>
>> - added missing MODULE_DEVICE_TABLE().
>>    Suggested-by: Javier Martinez Canillas <javier@dowhile0.org>
>>
>> - there was a line left over from a previous iteration that negated
>>    the new way of determining the pad count just before it which
>>    has been removed (num_pads = of_get_child_count(np)).
>>
>> - Philipp Zabel has developed a set of patches that allow adding
>>    to the subdev async notifier waiting list using a chaining method
>>    from the async registered callbacks (v4l2_of_subdev_registered()
>>    and the prep patches for that). For now, I've removed the use of
>>    v4l2_of_subdev_registered() for the vidmux driver's registered
>>    callback. This doesn't affect the functionality of this driver,
>>    but allows for it to be merged now, before adding the chaining
>>    support.
>>
>> Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
>> ---
>>   .../bindings/media/video-multiplexer.txt           |  59 +++
> Please make this a separate commit.

Done.

Steve
