From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/4] [media] davinci: vpif_capture: don't lock over s_stream
Date: Mon, 21 Nov 2016 16:10:19 -0800
Message-ID: <m237ik1ij8.fsf@baylibre.com>
References: <20161119003208.10550-1-khilman@baylibre.com>
        <20161119003208.10550-2-khilman@baylibre.com>
        <f385c65b-1f73-a5b1-b498-43916d5bdfb6@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f385c65b-1f73-a5b1-b498-43916d5bdfb6-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org> (Hans Verkuil's
        message of "Mon, 21 Nov 2016 15:37:20 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Bartosz =?utf-8?Q?Go=C5=82aszewski?= <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org> writes:

> On 19/11/16 01:32, Kevin Hilman wrote:
>> Video capture subdevs may be over I2C and may sleep during xfer, so we
>> cannot do IRQ-disabled locking when calling the subdev.
>>
>> Signed-off-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>> ---
>>  drivers/media/platform/davinci/vpif_capture.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
>> index 79cef74e164f..becc3e63b472 100644
>> --- a/drivers/media/platform/davinci/vpif_capture.c
>> +++ b/drivers/media/platform/davinci/vpif_capture.c
>> @@ -193,12 +193,16 @@ static int vpif_start_streaming(struct vb2_queue *vq, unsigned int count)
>>  		}
>>  	}
>>
>> +	spin_unlock_irqrestore(&common->irqlock, flags);
>> +
>>  	ret = v4l2_subdev_call(ch->sd, video, s_stream, 1);
>>  	if (ret && ret != -ENOIOCTLCMD && ret != -ENODEV) {
>>  		vpif_dbg(1, debug, "stream on failed in subdev\n");
>>  		goto err;
>>  	}
>>
>> +	spin_lock_irqsave(&common->irqlock, flags);
>
> This needs to be moved to right after the v4l2_subdev_call, otherwise the
> goto err above will not have the spinlock.

Yes indeed.  Will respin.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
