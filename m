From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH v2 0/7] [PATCH v2 0/7] Add support of OV9655 camera
Date: Tue, 18 Jul 2017 13:59:59 +0200
Message-ID: <956f17e6-36dd-6733-0d35-9b801ed4244d@xs4all.nl>
References: <1499073368-31905-1-git-send-email-hugues.fruchet@st.com>
 <8157da84-1484-8375-1f2b-9831973915b4@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8157da84-1484-8375-1f2b-9831973915b4-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <snawrocki-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>
Cc: "H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/07/17 22:01, Sylwester Nawrocki wrote:
> Hi Hugues,
> 
> On 07/03/2017 11:16 AM, Hugues Fruchet wrote:
>> This patchset enables OV9655 camera support.
>>
>> OV9655 support has been tested using STM32F4DIS-CAM extension board
>> plugged on connector P1 of STM32F746G-DISCO board.
>> Due to lack of OV9650/52 hardware support, the modified related code
>> could not have been checked for non-regression.
>>
>> First patches upgrade current support of OV9650/52 to prepare then
>> introduction of OV9655 variant patch.
>> Because of OV9655 register set slightly different from OV9650/9652,
>> not all of the driver features are supported (controls). Supported
>> resolutions are limited to VGA, QVGA, QQVGA.
>> Supported format is limited to RGB565.
>> Controls are limited to color bar test pattern for test purpose.
> 
> I appreciate your efforts towards making a common driver but IMO it would be 
> better to create a separate driver for the OV9655 sensor.  The original driver 
> is 1576 lines of code, your patch set adds half of that (816).  There are
> significant differences in the feature set of both sensors, there are 
> differences in the register layout.  I would go for a separate driver, we  
> would then have code easier to follow and wouldn't need to worry about possible
> regressions.  I'm afraid I have lost the camera module and won't be able 
> to test the patch set against regressions.
> 
> IMHO from maintenance POV it's better to make a separate driver. In the end 
> of the day we wouldn't be adding much more code than it is being done now.

I agree. We do not have great experiences in the past with trying to support
multiple variants in a single driver (unless the diffs are truly small).

Regards,

	Hans

> 
>>   .../devicetree/bindings/media/i2c/ov965x.txt       |  45 ++
>>   drivers/media/i2c/Kconfig                          |   6 +-
>>   drivers/media/i2c/ov9650.c                         | 816 +++++++++++++++++----
>>   3 files changed, 736 insertions(+), 131 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/media/i2c/ov965x.txt
> 
> --
> Thanks,
> Sylwester
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
