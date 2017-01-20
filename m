From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v3 00/24] i.MX Media Driver
Date: Fri, 20 Jan 2017 21:39:22 +0100
Message-ID: <5d23d244-aa0e-401c-24a9-07f28acf1563@xs4all.nl>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
 <c6e98327-7e2c-f34a-2d23-af7b236de441@xs4all.nl>
 <1484929911.2897.70.camel@pengutronix.de>
 <3fb68686-9447-2d8a-e2d2-005e4138cd43@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <3fb68686-9447-2d8a-e2d2-005e4138cd43@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Steve Longerbeam <slongerbeam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, nick@shmanahar.org, songjun.wu@microchip.com, Steve Longerbeam <steve_longerbeam@mentor.com>, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, linux@armlinux.org.uk, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail.com
List-Id: devicetree@vger.kernel.org

On 01/20/2017 07:40 PM, Steve Longerbeam wrote:
> Hi Hans, Philipp,
> 
> 
> On 01/20/2017 08:31 AM, Philipp Zabel wrote:
>> Hi Hans,
>>
>> On Fri, 2017-01-20 at 14:52 +0100, Hans Verkuil wrote:
>>> Hi Steve, Philipp,
>>>
>>> On 01/07/2017 03:11 AM, Steve Longerbeam wrote:
>>>> In version 3:
>>>>
>>>> Changes suggested by Rob Herring <robh@kernel.org>:
>>>>
>>>>    - prepended FIM node properties with vendor prefix "fsl,".
>>>>
>>>>    - make mipi csi-2 receiver compatible string SoC specific:
>>>>      "fsl,imx6-mipi-csi2" instead of "fsl,imx-mipi-csi2".
>>>>
>>>>    - redundant "_clk" removed from mipi csi-2 receiver clock-names property.
>>>>
>>>>    - removed board-specific info from the media driver binding doc. These
>>>>      were all related to sensor bindings, which already are (adv7180)
>>>>      or will be (ov564x) covered in separate binding docs. All reference
>>>>      board info not related to DT bindings has been moved to
>>>>      Documentation/media/v4l-drivers/imx.rst.
>>>>
>>>>    - removed "_mipi" from the OV5640 compatible string.
>>>>
>>>> Changes suggested by Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>:
>>>>
>>>>    Mostly cosmetic/non-functional changes which I won't list here, except
>>>>    for the following:
>>>>
>>>>    - spin_lock_irqsave() changed to spin_lock() in a couple interrupt handlers.
>>>>
>>>>    - fixed some unnecessary of_node_put()'s in for_each_child_of_node() loops.
>>>>
>>>>    - check/handle return code from required reg property of CSI port nodes.
>>>>
>>>>    - check/handle return code from clk_prepare_enable().
>>>>
>>>> Changes suggested by Fabio Estevam <festevam@gmail.com>:
>>>>
>>>>    - switch to VGEN3 Analog Vdd supply assuming rev. C SabreSD boards.
>>>>
>>>>    - finally got around to passing valid IOMUX pin config values to the
>>>>      pin groups.
>>>>
>>>> Other changes:
>>>>
>>>>    - removed the FIM properties that overrided the v4l2 FIM control defaults
>>>>      values. This was left-over from a requirement of a customer and is not
>>>>      necessary here.
>>>>
>>>>    - The FIM must be explicitly enabled in the fim child node under the CSI
>>>>      port nodes, using the status property. If not enabled, FIM v4l2 controls
>>>>      will not appear in the video capture driver.
>>>>
>>>>    - brought in additional media types patch from Philipp Zabel. Use new
>>>>      MEDIA_ENT_F_VID_IF_BRIDGE in mipi csi-2 receiver subdev.
>>>>
>>>>    - brought in latest platform generic video multiplexer subdevice driver
>>>>      from Philipp Zabel (squashed with patch that uses new MEDIA_ENT_F_MUX).
>>>>
>>>>    - removed imx-media-of.h, moved those prototypes into imx-media.h.
>>> Based on the discussion on the mailinglist it seems everyone agrees that this
>>> is the preferred driver, correct?
>> No. I have some major reservations against the custom mem2mem framework
>> embedded in Steve's driver.
>> I think it is a misuse of the media entity links (which should describe
>> hardware connections) for something that should be done at the vb2 level
>> (letting one device's capture EOF interrupt trigger the next device's
>> m2m device_run without going through userspace).
>> Steve and I disagree on that point, so we'd appreciate if we could get
>> some more eyes on the above issue.
> 
> This needs some background first, so let me first describe one example
> pipeline in this driver.
> 
> There is a VDIC entity in the i.MX IPU that performs de-interlacing with
> hardware filters for motion compensation. Some of the motion compensation
> modes ("low" and "medium" motion) require that the VDIC receive video
> frame fields from memory buffers (dedicated dma channels in the
> IPU are used to transfer those buffers into the VDIC).
> 
> So one option to support those modes would be to pass the raw buffers
> from a camera sensor up to userspace to a capture device, and then pass
> them back to the VDIC for de-interlacing using a mem2mem device.
> 
> Philipp and I are both in agreement that, since userland is not interested
> in the intermediate interlaced buffers in this case, but only the final
> result (motion compensated, de-interlaced frames), it is more efficient
> to provide a media link that allows passing those intermediate frames
> directly from a camera source pad to VDIC sink pad, without having
> to route them through userspace.
> 
> So in order to support that, I've implemented a simple FIFO dma buffer
> queue in the driver to allow passing video buffers directly from a source
> to a sink. It is modeled loosely off the vb2 state machine and API, but
> simpler (for instance it only allows contiguous, cache-coherent buffers).
> 
> This is where Philipp has an argument, that this should be done with a
> new API in videobuf2.
> 
> And I'm actually in total agreement with that. I definitely agree that there
> should be a mechanism in the media framework that allows passing video
> buffers from a source pad to a sink pad using a software queue, with no
> involvement from userland.
> 
> My only disagreement is when this should be implemented. I think it is
> fine to keep my custom implementation of this in the driver for now. Once
> an extension of vb2 is ready to support this feature, it would be fairly
> straightforward to strip out my custom implementation and go with the
> new API.

For a staging driver this isn't necessary, as long as it is documented in
the TODO file that this needs to be fixed before it can be moved out of
staging. The whole point of staging is that there is still work to be
done in the driver, after all :-)

BTW, did you look at the vb2_thread_* functions in videobuf2-core.c? A lot
of what you need is already there. Making a new version that has producer
and consumer queues shouldn't be hard given that code.

Regards,

	Hans
