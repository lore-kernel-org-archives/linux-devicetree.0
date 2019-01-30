Return-Path: <SRS0=RC8L=QG=ndufresne.ca=nicolas@kernel.org>
Message-ID: <f0df52b3ac7dfd5bdac8f18053f7db27de5bc230.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/3] [media] allegro: add Allegro DVT video IP core
 driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
Date: Tue, 29 Jan 2019 22:46:15 -0500
In-Reply-To: <20190123151709.395eec98@litschi.hi.pengutronix.de>
References: <20190118133716.29288-1-m.tretter@pengutronix.de>
	 <20190118133716.29288-3-m.tretter@pengutronix.de>
	 <1fab228e-3a5d-d1f4-23a3-bb8ec5914851@xs4all.nl>
	 <20190123151709.395eec98@litschi.hi.pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Michael Tretter <m.tretter@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org, tfiga@chromium.org
List-ID: <devicetree@vger.kernel.org>

Le mercredi 23 janvier 2019 à 15:17 +0100, Michael Tretter a écrit :
> > I have a patch pending that allows an encoder to spread the compressed
> > output over multiple buffers:
> > 
> > https://patchwork.linuxtv.org/patch/53536/
> > 
> > I wonder if this encoder would be able to use it.
> 
> I don't think that the encoder could use this, because of how the
> PUT_STREAM_BUFFER and the ENCODE_FRAME command are working: The
> ENCODE_FRAME will always write the compressed output to a single buffer.
> 
> However, if I stop passing the vb2 buffers to the encoder, use an
> internal buffer pool for the encoder stream buffers and copy the
> compressed buffer from the internal buffers to the vb2 buffers, I can
> spread the output over multiple buffers. That would also allow me, to
> get rid of putting filler nal units in front of the compressed data.
> 
> I will try to implement it that way.

As explained in my previous email, this will break current userspace
expectation, and will force userspace into parsing the following frame
to find the end of it (adding 1 frame latency).

I have used a lot the vendor driver for this platform and it has always
been able possible to get the frame size right, so this should be
possible here too.

Nicolas
