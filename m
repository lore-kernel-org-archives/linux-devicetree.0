Return-Path: <SRS0=SQzn=QG=chromium.org=tfiga@kernel.org>
MIME-Version: 1.0
References: <20190118133716.29288-1-m.tretter@pengutronix.de>
 <20190118133716.29288-3-m.tretter@pengutronix.de> <1fab228e-3a5d-d1f4-23a3-bb8ec5914851@xs4all.nl>
 <20190123151709.395eec98@litschi.hi.pengutronix.de> <f0df52b3ac7dfd5bdac8f18053f7db27de5bc230.camel@ndufresne.ca>
In-Reply-To: <f0df52b3ac7dfd5bdac8f18053f7db27de5bc230.camel@ndufresne.ca>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 30 Jan 2019 12:54:50 +0900
Message-ID: <CAAFQd5A7w0veEeNXFYMfpzZw4d9HCwHMk8EyKBMv4wmUOVJYiA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] [media] allegro: add Allegro DVT video IP core driver
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Michael Tretter <m.tretter@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>, Linux Media Mailing List <linux-media@vger.kernel.org>, devicetree@vger.kernel.org, Sasha Hauer <kernel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Jan 30, 2019 at 12:46 PM Nicolas Dufresne <nicolas@ndufresne.ca> wr=
ote:
>
> Le mercredi 23 janvier 2019 =C3=A0 15:17 +0100, Michael Tretter a =C3=A9c=
rit :
> > > I have a patch pending that allows an encoder to spread the compresse=
d
> > > output over multiple buffers:
> > >
> > > https://patchwork.linuxtv.org/patch/53536/
> > >
> > > I wonder if this encoder would be able to use it.
> >
> > I don't think that the encoder could use this, because of how the
> > PUT_STREAM_BUFFER and the ENCODE_FRAME command are working: The
> > ENCODE_FRAME will always write the compressed output to a single buffer=
.
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

I don't think you would need to do any parsing to detect it. I think
the assumption that a buffer only contains 1 frame would still hold.
An extra buffer would be used for the remaining part of the current
frame and then we would take another buffer for the next frame.

Still, I also recall that we assumed that we have 1 buffer per 1 frame
for encoders, so indeed it could break some apps. At least it needs
some careful analysis, if we want to change it.

>
> I have used a lot the vendor driver for this platform and it has always
> been able possible to get the frame size right, so this should be
> possible here too.
>
> Nicolas
>
