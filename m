Return-Path: <SRS0=RC8L=QG=ndufresne.ca=nicolas@kernel.org>
Message-ID: <9e29f43951bf25708060bc25f4d1e94756970ee2.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/3] [media] allegro: add Allegro DVT video IP core
 driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
Date: Tue, 29 Jan 2019 22:41:32 -0500
In-Reply-To: <1fab228e-3a5d-d1f4-23a3-bb8ec5914851@xs4all.nl>
References: <20190118133716.29288-1-m.tretter@pengutronix.de>
	 <20190118133716.29288-3-m.tretter@pengutronix.de>
	 <1fab228e-3a5d-d1f4-23a3-bb8ec5914851@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Hans Verkuil <hverkuil@xs4all.nl>, Michael Tretter <m.tretter@pengutronix.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org, tfiga@chromium.org
List-ID: <devicetree@vger.kernel.org>

Hi Hans,

Le mercredi 23 janvier 2019 à 11:44 +0100, Hans Verkuil a écrit :
> > +     if (*nplanes != 0) {
> > +             if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
> > +                     if (*nplanes != 1 ||
> > +                         sizes[0] < channel->sizeimage_encoded)
> > +                             return -EINVAL;
> 
> Question relating to calculating sizeimage_encoded: is that guaranteed to be
> the largest buffer size that is needed to compress a frame? What if it is
> not large enough after all? Does the encoder protect against that?
> 
> I have a patch pending that allows an encoder to spread the compressed
> output over multiple buffers:
> 
> https://patchwork.linuxtv.org/patch/53536/
> 
> I wonder if this encoder would be able to use it.

Userspace around most existing codecs expect well framed capture buffer
from the encoder. Spreading out the buffer will just break this
expectation.

This is specially needed for VP8/VP9 as these format are not meant to
be streamed that way.

I believe a proper solution to that would be to hang the decoding
process and send an event (similar to resolution changes) to tell user
space that capture buffers need to be re-allocated.

Nicolas
