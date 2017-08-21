From: Hugues FRUCHET <hugues.fruchet@st.com>
Subject: Re: [PATCH v1 4/5] [media] stm32-dcmi: set default format at open()
Date: Mon, 21 Aug 2017 10:20:25 +0000
Message-ID: <47cc9905-27d8-abec-2e28-f97a073249c9@st.com>
References: <1501236302-18097-1-git-send-email-hugues.fruchet@st.com>
 <1501236302-18097-5-git-send-email-hugues.fruchet@st.com>
 <a5a158b3-b502-d220-52bb-8138328c1773@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <a5a158b3-b502-d220-52bb-8138328c1773@xs4all.nl>
Content-Language: en-US
Content-ID: <D571CBB92F7257419B98DC26795D6F33@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hans Verkuil <hverkuil@xs4all.nl>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yannick FERTRE <yannick.fertre@st.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 08/04/2017 02:00 PM, Hans Verkuil wrote:
> On 28/07/17 12:05, Hugues Fruchet wrote:
>> Ensure that we start with default pixel format and resolution
>> when opening a new instance.
> 
> Why? The format is persistent in V4L2 and (re)opening the video device
> shouldn't change the format.
> 
> Suppose you use v4l2-ctl to set up a format. E.g. v4l2-ctl -v width=320,height-240.
> Now run v4l2-ctl -V to get the format and with this code it would suddenly be
> back to the default!
> 
> You set up the default format in the dcmi_graph_notify_complete, but after that
> it is only changed if userspace explicitly requests it.
> 
> Regards,
> 
> 	Hans
> 

Thanks Hans, I didn't catch this before, thanks for explanation.

>>
>> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
>> ---
>>   drivers/media/platform/stm32/stm32-dcmi.c | 49 ++++++++++++++++++-------------
>>   1 file changed, 28 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
>> index 4733d1f..2be56b6 100644
>> --- a/drivers/media/platform/stm32/stm32-dcmi.c
>> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
>> @@ -890,6 +890,28 @@ static int dcmi_enum_frameintervals(struct file *file, void *fh,
>>   	return 0;
>>   }
>>   
>> +static int dcmi_set_default_fmt(struct stm32_dcmi *dcmi)
>> +{
>> +	struct v4l2_format f = {
>> +		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
>> +		.fmt.pix = {
>> +			.width		= CIF_WIDTH,
>> +			.height		= CIF_HEIGHT,
>> +			.field		= V4L2_FIELD_NONE,
>> +			.pixelformat	= dcmi->sd_formats[0]->fourcc,
>> +		},
>> +	};
>> +	int ret;
>> +
>> +	ret = dcmi_try_fmt(dcmi, &f, NULL);
>> +	if (ret)
>> +		return ret;
>> +	dcmi->sd_format = dcmi->sd_formats[0];
>> +	dcmi->fmt = f;
>> +
>> +	return 0;
>> +}
>> +
>>   static const struct of_device_id stm32_dcmi_of_match[] = {
>>   	{ .compatible = "st,stm32-dcmi"},
>>   	{ /* end node */ },
>> @@ -916,7 +938,13 @@ static int dcmi_open(struct file *file)
>>   	if (ret < 0 && ret != -ENOIOCTLCMD)
>>   		goto fh_rel;
>>   
>> +	ret = dcmi_set_default_fmt(dcmi);
>> +	if (ret)
>> +		goto power_off;
>> +
>>   	ret = dcmi_set_fmt(dcmi, &dcmi->fmt);
>> +
>> +power_off:
>>   	if (ret)
>>   		v4l2_subdev_call(sd, core, s_power, 0);
>>   fh_rel:
>> @@ -991,27 +1019,6 @@ static int dcmi_release(struct file *file)
>>   	.read		= vb2_fop_read,
>>   };
>>   
>> -static int dcmi_set_default_fmt(struct stm32_dcmi *dcmi)
>> -{
>> -	struct v4l2_format f = {
>> -		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
>> -		.fmt.pix = {
>> -			.width		= CIF_WIDTH,
>> -			.height		= CIF_HEIGHT,
>> -			.field		= V4L2_FIELD_NONE,
>> -			.pixelformat	= dcmi->sd_formats[0]->fourcc,
>> -		},
>> -	};
>> -	int ret;
>> -
>> -	ret = dcmi_try_fmt(dcmi, &f, NULL);
>> -	if (ret)
>> -		return ret;
>> -	dcmi->sd_format = dcmi->sd_formats[0];
>> -	dcmi->fmt = f;
>> -	return 0;
>> -}
>> -
>>   static const struct dcmi_format dcmi_formats[] = {
>>   	{
>>   		.fourcc = V4L2_PIX_FMT_RGB565,
>>
> 
