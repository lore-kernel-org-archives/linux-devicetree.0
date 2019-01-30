Return-Path: <SRS0=y9Vk=QG=xs4all.nl=hverkuil@kernel.org>
Subject: Re: [PATCH v2 2/3] [media] allegro: add Allegro DVT video IP core
 driver
References: <20190118133716.29288-1-m.tretter@pengutronix.de>
 <20190118133716.29288-3-m.tretter@pengutronix.de>
 <1fab228e-3a5d-d1f4-23a3-bb8ec5914851@xs4all.nl>
 <9e29f43951bf25708060bc25f4d1e94756970ee2.camel@ndufresne.ca>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f983efdb-4ac1-d2e2-4be3-421d337f94ef@xs4all.nl>
Date: Wed, 30 Jan 2019 08:47:20 +0100
MIME-Version: 1.0
In-Reply-To: <9e29f43951bf25708060bc25f4d1e94756970ee2.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Michael Tretter <m.tretter@pengutronix.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org, tfiga@chromium.org
List-ID: <devicetree@vger.kernel.org>

On 1/30/19 4:41 AM, Nicolas Dufresne wrote:
> Hi Hans,
> 
> Le mercredi 23 janvier 2019 à 11:44 +0100, Hans Verkuil a écrit :
>>> +     if (*nplanes != 0) {
>>> +             if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
>>> +                     if (*nplanes != 1 ||
>>> +                         sizes[0] < channel->sizeimage_encoded)
>>> +                             return -EINVAL;
>>
>> Question relating to calculating sizeimage_encoded: is that guaranteed to be
>> the largest buffer size that is needed to compress a frame? What if it is
>> not large enough after all? Does the encoder protect against that?
>>
>> I have a patch pending that allows an encoder to spread the compressed
>> output over multiple buffers:
>>
>> https://patchwork.linuxtv.org/patch/53536/
>>
>> I wonder if this encoder would be able to use it.
> 
> Userspace around most existing codecs expect well framed capture buffer
> from the encoder. Spreading out the buffer will just break this
> expectation.
> 
> This is specially needed for VP8/VP9 as these format are not meant to
> be streamed that way.

Good to know, thank you.

> I believe a proper solution to that would be to hang the decoding
> process and send an event (similar to resolution changes) to tell user
> space that capture buffers need to be re-allocated.

That's indeed an alternative. I wait for further feedback from Tomasz
on this.

I do want to add that allowing it to be spread over multiple buffers
also means more optimal use of memory. I.e. the buffers for the compressed
data no longer need to be sized for the worst-case size.

Regards,

	Hans
