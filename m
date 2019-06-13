From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 2/2] media: v4l: xilinx: Add Xilinx UHD-SDI Rx Subsystem
 driver
Date: Thu, 13 Jun 2019 15:31:44 -0700
Message-ID: <39e6c0f7d7529da9906a17450a8bcdf416297520.camel@perches.com>
References: <1559656556-79174-1-git-send-email-vishal.sagar@xilinx.com>
         <1559656556-79174-3-git-send-email-vishal.sagar@xilinx.com>
         <20190613220507.GA2473@smtp.xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613220507.GA2473@smtp.xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hyun Kwon <hyun.kwon@xilinx.com>, Vishal Sagar <vishal.sagar@xilinx.com>
Cc: Hyun Kwon <hyunk@xilinx.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michal Simek <michals@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Dinesh Kumar <dineshk@xilinx.com>, Sandip Kothari <sandipk@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Thu, 2019-06-13 at 15:05 -0700, Hyun Kwon wrote:
> On Tue, 2019-06-04 at 06:55:56 -0700, Vishal Sagar wrote:

trivia:

> > diff --git a/drivers/media/platform/xilinx/xilinx-sdirxss.c b/drivers/media/platform/xilinx/xilinx-sdirxss.c
[]
> > +static int xsdirx_get_stream_properties(struct xsdirxss_state *state)
> > +{
[]
> > +	if (valid & XSDIRX_ST352_VALID_DS1_MASK) {
> > +		payload = xsdirxss_read(core, XSDIRX_ST352_DS1_REG);
> > +		byte1 = (payload >> XST352_PAYLOAD_BYTE1_SHIFT) &
> > +				XST352_PAYLOAD_BYTE_MASK;

Is XST352_PAYLOAD_BYTE_MASK correct ?
Should it be XST352_PAYLOAD_BYTE1_MASK ?

> > +		active_luma = (payload & XST352_BYTE3_ACT_LUMA_COUNT_MASK) >>
> > +				XST352_BYTE3_ACT_LUMA_COUNT_OFFSET;
> > +		pic_type = (payload & XST352_BYTE2_PIC_TYPE_MASK) >>
> > +				XST352_BYTE2_PIC_TYPE_OFFSET;
> > +		framerate = (payload >> XST352_BYTE2_FPS_SHIFT) &
> > +				XST352_BYTE2_FPS_MASK;
> > +		tscan = (payload & XST352_BYTE2_TS_TYPE_MASK) >>
> > +				XST352_BYTE2_TS_TYPE_OFFSET;
> 
> Please align consistently throughout the patch. I believe the checkpatch
> --strict warns on these.

I believe not.

Another possibility would be to use a macro like:

#define mask_and_shift(val, type)	\
	((val) & (XST352_ ## type ## _MASK)) >> (XST352_ ## type ## _OFFSET))

> > +		sampling = (payload & XST352_BYTE3_COLOR_FORMAT_MASK) >>
> > +			   XST352_BYTE3_COLOR_FORMAT_OFFSET;

So these could be something like:

		sampling = mask_and_shift(payload, BYTE3_COLOR_FORMAT);
