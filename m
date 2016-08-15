From: "Wu, Songjun" <Songjun.Wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: Re: [PATCH v9 0/2] [media] atmel-isc: add driver for Atmel ISC
Date: Mon, 15 Aug 2016 14:09:21 +0800
Message-ID: <c422fc89-8184-5416-4574-77d6234aa4be@microchip.com>
References: <1470899202-13933-1-git-send-email-songjun.wu@microchip.com>
 <c6593866-db70-b2a6-ee5a-32b6fecc3775@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c6593866-db70-b2a6-ee5a-32b6fecc3775-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, =?UTF-8?Q?Niklas_S=c3=83=c2=b6derlund?= <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sudip Mukherjee <sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kamil Debski <kamil-MZ2JYD8fkKLYtjvyW6yDsg@public.gmane.org>, Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mikhail Ulyanov <mikhail.ulyanov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, =?UTF-8?Q?Richard_R=c3=b6jfors?= <richard-hy+oXTTr619xRVliYXHCzg@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Simon Horman <horms+renesas>
List-Id: devicetree@vger.kernel.org



On 8/12/2016 15:32, Hans Verkuil wrote:
> One quick question:
>
> On 08/11/2016 09:06 AM, Songjun Wu wrote:
>> The Image Sensor Controller driver includes two parts.
>> 1) Driver code to implement the ISC function.
>> 2) Device tree binding documentation, it describes how
>>    to add the ISC in device tree.
>>
>> Test result with v4l-utils.
>> # v4l2-compliance -f
>> v4l2-compliance SHA   : not available
>>
>> Driver Info:
>>         Driver name   : atmel_isc
>>         Card type     : Atmel Image Sensor Controller
>>         Bus info      : platform:atmel_isc f0008000.isc
>>         Driver version: 4.7.0
>>         Capabilities  : 0x84200001
>>                 Video Capture
>>                 Streaming
>>                 Extended Pix Format
>>                 Device Capabilities
>>         Device Caps   : 0x04200001
>>                 Video Capture
>>                 Streaming
>>                 Extended Pix Format
>>
>> Compliance test for device /dev/video0 (not using libv4l2):
>>
>> Required ioctls:
>>         test VIDIOC_QUERYCAP: OK
>>
>> Allow for multiple opens:
>>         test second video open: OK
>>         test VIDIOC_QUERYCAP: OK
>>         test VIDIOC_G/S_PRIORITY: OK
>>         test for unlimited opens: OK
>>
>> Debug ioctls:
>>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>         test VIDIOC_G/S/ENUMINPUT: OK
>>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>         Inputs: 1 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>         test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Test input 0:
>>
>>         Control ioctls:
>>                 test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>                 test VIDIOC_QUERYCTRL: OK (Not Supported)
>>                 test VIDIOC_G/S_CTRL: OK (Not Supported)
>>                 test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>                 test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>                 test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>                 Standard Controls: 0 Private Controls: 0
>
> Can you confirm that the sensor subdevice you are using does not have any controls?
> I ask since that is fairly unusual, so I want to make sure that controls are really
> not supported in this setup.
>
Sorry for the late reply.
The subdevice I use supports controls, but I did not develop the v4l2 
controls in the sensor driver.
Should I add the v4l2 controls and test again?

> Regards,
>
> 	Hans
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
