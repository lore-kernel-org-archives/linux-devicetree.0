From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH 2/2] media: v4l: xilinx: Add Xilinx UHD-SDI Rx Subsystem
 driver
Date: Sat, 15 Jun 2019 09:55:07 +0200
Message-ID: <740f44cb-24af-72c4-f227-5323efcee8ac@xs4all.nl>
References: <1559656556-79174-1-git-send-email-vishal.sagar@xilinx.com>
 <1559656556-79174-3-git-send-email-vishal.sagar@xilinx.com>
 <023cf8a6-6fbc-6425-8bca-798045d39e02@xs4all.nl>
 <CH2PR02MB608838E59840F73F00534198A7EE0@CH2PR02MB6088.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CH2PR02MB608838E59840F73F00534198A7EE0@CH2PR02MB6088.namprd02.prod.outlook.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vishal Sagar <vsagar@xilinx.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Sandip Kothari <sandipk@xilinx.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hyun Kwon <hyunk@xilinx.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Michal Simek <michals@xilinx.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Vishal Sagar <vishal.sagar@xilinx.com>, Dinesh Kumar <dineshk@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 6/14/19 1:44 PM, Vishal Sagar wrote:
> Hi Hans,
> 
> Thanks for reviewing this patch.
> 
>> -----Original Message-----
>> From: Hans Verkuil [mailto:hverkuil@xs4all.nl]
>> Sent: Wednesday, June 05, 2019 6:28 PM
>> To: Vishal Sagar <vishal.sagar@xilinx.com>; Hyun Kwon <hyunk@xilinx.com>;
>> Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Mauro Carvalho
>> Chehab <mchehab@kernel.org>; Michal Simek <michals@xilinx.com>; Rob
>> Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>
>> Cc: linux-kernel@vger.kernel.org; linux-media@vger.kernel.org; linux-arm-
>> kernel@lists.infradead.org; devicetree@vger.kernel.org; Dinesh Kumar
>> <dineshk@xilinx.com>; Sandip Kothari <sandipk@xilinx.com>
>> Subject: Re: [PATCH 2/2] media: v4l: xilinx: Add Xilinx UHD-SDI Rx Subsystem
>> driver
>>
>> EXTERNAL EMAIL
>>
>> On 6/4/19 3:55 PM, Vishal Sagar wrote:
>>> The Xilinx UHD-SDI Rx subsystem soft IP is used to capture native SDI
>>> streams from SDI sources like SDI broadcast equipment like cameras and
>>> mixers. This block outputs either native SDI, native video or
>>> AXI4-Stream compliant data stream for further processing. Please refer
>>> to PG290 for details.
>>>
>>> The driver is used to configure the IP to add framer, search for
>>> specific modes, get the detected mode, stream parameters, errors, etc.
>>> It also generates events for video lock/unlock, bridge over/under flow.
>>>
>>> The driver supports only 10 bpc YUV 422 media bus format. It also
>>> decodes the stream parameters based on the ST352 packet embedded in the
>>> stream. In case the ST352 packet isn't present in the stream, the core's
>>> detected properties are used to set stream properties.
>>>
>>> The driver currently supports only the AXI4-Stream configuration.
>>>
>>> Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
>>> ---
>>>  drivers/media/platform/xilinx/Kconfig          |   11 +
>>>  drivers/media/platform/xilinx/Makefile         |    1 +
>>>  drivers/media/platform/xilinx/xilinx-sdirxss.c | 1846
>> ++++++++++++++++++++++++
>>>  include/uapi/linux/xilinx-sdirxss.h            |   63 +
>>>  include/uapi/linux/xilinx-v4l2-controls.h      |   30 +
>>>  include/uapi/linux/xilinx-v4l2-events.h        |    9 +

<snip>

>> I am concerned about this driver: I see that none of the *_dv_timings callbacks
>> are implemented. I would expect to see that for a video receiver. There is also
>> no g_input_status implemented.
>>
>> Take a look at another SDI driver: drivers/media/spi/gs1662.c
>>
> 
> I had a look at the gs1662 driver for the dv_timings callbacks. The gs1662 driver
> requires the timings because it is a SDI Transmitter. 
> 
> Here the timings are not required as the IP block generates a AXI4 Stream.
> I think it may be required only in case of native / parallel video being outputted
> as the output stream needs timing information to be decoded.
> 
> Please feel free to correct my understanding if wrong.
> 
> In the current driver, the input stream properties like width, height, frame rate,
> progressive/interlaced  are determined from the ST352 packet payload or from the
> properties detected by the core.
> 
> See the xsdirx_get_stream_properties() for details.

You're wrong. In xsdirx_get_stream_properties() you set the format information.
But you can't just change that: if the video resolution changes, then that means
that userspace needs to be informed that it has changed at the source, it has to
find and set the new timings, update the formats, possibly reallocate memory for
the buffers, update other parts of the video pipeline with the new resolution etc.

The one thing you cannot do is just pass on the new resolution and hope that the
video pipeline can handle it all.

The right sequence of events is:

1) When a change is detected at the source the driver sends the SOURCE_CHANGE
event and either stops transmitting to the video pipeline or keeps sending the
old resolution (some devices have a freewheeling mode where they can do that).

2) Userspace sees the event, calls QUERY_DV_TIMINGS to find a new timings (if
any), usually stops streaming, and calls S_DV_TIMINGS to set the detected timings:
at that point the driver can configure the output towards the video pipeline with
the new timings. Userspace reallocates buffers and resumes streaming with the new
resolution.

Note that G_DV_TIMINGS returns the last configured timings, not the detected
timings: only QUERY_DV_TIMINGS does that.

In other words: userspace has to retain control of the full pipeline.

Regards,

	Hans

> 
>> Some of the controls you add in this driver can likely be dropped. Especially
>> those controls that are not specific to the Xilinx implementation but are
>> generic for any SDI receiver, should be looked at closely: those are
>> candidates for becoming standard controls.
> 
> I don't know how other SDI Receiver devices function.
> So I am assuming all these controls are Xilinx specific implementations.
> 
>>
>> But the documentation above is simply insufficient for me to tell what is
>> SDI specific and what is implementation specific.
>>
> 
> I will add more documentation for these controls.
> 
>> Also, I'm no SDI expert, certainly not for the UHD-SDI.
>>
>> Regards,
>>
>>         Hans
> 
> Regards
> Vishal Sagar
> 
