From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCHv4 4/5] cec-gpio: add HDMI CEC GPIO driver
Date: Thu, 31 Aug 2017 16:19:17 +0200
Message-ID: <7a7ad8d3-a52a-de47-4f50-62cd64aa52e3@xs4all.nl>
References: <20170831110156.11018-1-hverkuil@xs4all.nl>
 <20170831110156.11018-5-hverkuil@xs4all.nl>
 <CACRpkdYQSYMQHgrOimV6iVRdrjhAXvXdzsfnNr8abykOyZP8yw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYQSYMQHgrOimV6iVRdrjhAXvXdzsfnNr8abykOyZP8yw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:DRM PANEL DRIVERS" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 31/08/17 16:10, Linus Walleij wrote:
> On Thu, Aug 31, 2017 at 1:01 PM, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org> wrote:
> 
>> From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
>>
>> Add a simple HDMI CEC GPIO driver that sits on top of the cec-pin framework.
>>
>> While I have heard of SoCs that use the GPIO pin for CEC (apparently an
>> early RockChip SoC used that), the main use-case of this driver is to
>> function as a debugging tool.
>>
>> By connecting the CEC line to a GPIO pin on a Raspberry Pi 3 for example
>> it turns it into a CEC debugger and protocol analyzer.
>>
>> With 'cec-ctl --monitor-pin' the CEC traffic can be analyzed.
>>
>> But of course it can also be used with any hardware project where the
>> HDMI CEC line is hooked up to a pull-up gpio line.
>>
>> In addition this has (optional) support for tracing HPD changes if the
>> HPD is connected to a GPIO.
>>
>> Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> 
> This looks nice!
> Reviewed-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Thank you for the gpio crash course! :-)

	Hans

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
