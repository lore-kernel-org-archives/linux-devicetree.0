Return-Path: <SRS0=IkuC=QG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:54023 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbfA3JWg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 30 Jan 2019 04:22:36 -0500
Date: Wed, 30 Jan 2019 10:22:32 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: Re: [PATCH v2 2/3] [media] allegro: add Allegro DVT video IP core
 driver
Message-ID: <20190130102232.1047239c@litschi.hi.pengutronix.de>
In-Reply-To: <f0df52b3ac7dfd5bdac8f18053f7db27de5bc230.camel@ndufresne.ca>
References: <20190118133716.29288-1-m.tretter@pengutronix.de>
        <20190118133716.29288-3-m.tretter@pengutronix.de>
        <1fab228e-3a5d-d1f4-23a3-bb8ec5914851@xs4all.nl>
        <20190123151709.395eec98@litschi.hi.pengutronix.de>
        <f0df52b3ac7dfd5bdac8f18053f7db27de5bc230.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org, tfiga@chromium.org
List-ID: <devicetree@vger.kernel.org>

On Tue, 29 Jan 2019 22:46:15 -0500, Nicolas Dufresne wrote:
> Le mercredi 23 janvier 2019 à 15:17 +0100, Michael Tretter a écrit :
> > > I have a patch pending that allows an encoder to spread the compressed
> > > output over multiple buffers:
> > > 
> > > https://patchwork.linuxtv.org/patch/53536/
> > > 
> > > I wonder if this encoder would be able to use it.  
> > 
> > I don't think that the encoder could use this, because of how the
> > PUT_STREAM_BUFFER and the ENCODE_FRAME command are working: The
> > ENCODE_FRAME will always write the compressed output to a single buffer.
> > 
> > However, if I stop passing the vb2 buffers to the encoder, use an
> > internal buffer pool for the encoder stream buffers and copy the
> > compressed buffer from the internal buffers to the vb2 buffers, I can
> > spread the output over multiple buffers. That would also allow me, to
> > get rid of putting filler nal units in front of the compressed data.
> > 
> > I will try to implement it that way.  
> 
> As explained in my previous email, this will break current userspace
> expectation, and will force userspace into parsing the following frame
> to find the end of it (adding 1 frame latency).
> 
> I have used a lot the vendor driver for this platform and it has always
> been able possible to get the frame size right, so this should be
> possible here too.

The vendor driver estimates the compressed buffer size based on the
width, height, chroma mode and bit depth of the stream. The v4l2
currently uses the dimensions for the estimate and adds some margin
for the SPS/PPS nals and for the partition table. The driver does not
care about the chroma mode and bit depth, yet.

A partition table at the end of the buffer contains the start and size
of the encoded frame in the encoded buffer after it has been encoded.
The vendor driver uses this information later to copy the actual data
out of the buffers. Instead of copying, I copy a filler nal into the
capture buffer and that's something I would be able to avoid by using
internal buffers instead of passing the capture buffers to the VCU.

If the buffer size is not sufficient, the VCU will signal an error and
the driver should be able to trigger a re-negotiation or do the
necessary things to get a larger buffer. However, I didn't test or
implement any of this and this should come later.

So, yes, getting the frame size right should be possible and that's
what the driver in the current state tries to do.

Michael

> 
> Nicolas
> 
> 
