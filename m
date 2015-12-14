From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [Patch v5 1/2] media: v4l: ti-vpe: Add CAL v4l2 camera capture
 driver
Date: Mon, 14 Dec 2015 15:41:54 +0100
Message-ID: <566ED532.6060308@xs4all.nl>
References: <1447879632-22635-1-git-send-email-bparrot@ti.com>
 <1447879632-22635-2-git-send-email-bparrot@ti.com>
 <20151203111922.7b9bb226@recife.lan> <20151211221633.GF1517@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151211221633.GF1517-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/11/2015 11:16 PM, Benoit Parrot wrote:
> Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org> wrote on Thu [2015-Dec-03 11:19:22 -0200]:
>>> +static int cal_enum_framesizes(struct file *file, void *fh,
>>> +			       struct v4l2_frmsizeenum *fsize)
>>> +{
>>> +	struct cal_ctx *ctx = video_drvdata(file);
>>> +	const struct cal_fmt *fmt;
>>> +	struct v4l2_subdev_frame_size_enum fse;
>>> +	int ret;
>>> +
>>> +	ctx_dbg(2, ctx, "%s\n", __func__);
>>
>> This s a general note: do you really need tracing-like debug macros
>> all around the code?
>>
>> You could easily check if the functions are called via trace.
> 
> True but that also mean to rebuild the kernel in order to
> get to it since function tracing is usually not enabled
> by default.
> 

You can enable debugging by doing:

echo 2 >/sys/class/video4linux/video0/dev_debug

See also: Documentation/video4linux/v4l2-framework.txt, section "video device
debugging" for more info.

That's always available and basically does what you want.

Regards,

	Hans

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
