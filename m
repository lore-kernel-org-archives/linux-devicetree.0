MIME-Version: 1.0
Date: Thu, 16 May 2019 21:31:06 -0500
References: <20190513172131.15048-1-m.tretter@pengutronix.de>
	<20190513172131.15048-4-m.tretter@pengutronix.de>
In-Reply-To: <20190513172131.15048-4-m.tretter@pengutronix.de>
Message-ID: <CAL_JsqKUu083oeQuZwSckT3a3X=Htv2ru02jewGuMFzp=uamNA@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] media: dt-bindings: media: Add vendor prefix for allegro
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, devicetree@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa <tfiga@chromium.org>, Dhaval Shah <dshah@xilinx.com>, Hans Verkuil <hverkuil@xs4all.nl>
List-ID: <devicetree@vger.kernel.org>

On Mon, May 13, 2019 at 12:21 PM Michael Tretter
<m.tretter@pengutronix.de> wrote:
>
> Add vendor prefix for Allegro DVT, a provider of H.264/AVC, H.265/HEVC,
> AVS2, VP9 and AV1 compliance test suites and H.264/AVC, H.265/HEVC, and
> VP9 encoder, codec and decoder hardware (RTL) IPs.
>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> v5 -> v6:
> none
>
> v5:
> - new patch
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)

I've converted this file to json-schema as of v5.2-rc1. See commit
8122de54602e. Sorry, but you will have to rework this patch.


Rob
