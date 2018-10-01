From: Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH v6 0/6] Add Rockchip VPU JPEG encoder
Date: Mon, 01 Oct 2018 14:54:09 -0300
Message-ID: <faca3960d0478610b73071b471acfa26df987985.camel@collabora.com>
References: <20180917173022.9338-1-ezequiel@collabora.com>
 <7bd9573e-e0c6-71a6-84ed-deb0904593fd@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <7bd9573e-e0c6-71a6-84ed-deb0904593fd-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Nicolas Dufresne <nicolas.dufresne-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Miouyouyou <myy-tmjzNUIc0P1+EYZtW95mkQ@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2018-09-28 at 14:33 +0200, Hans Verkuil wrote:
> On 09/17/2018 07:30 PM, Ezequiel Garcia wrote:
> > This series adds support for JPEG encoding via the VPU block
> > present in Rockchip platforms. Currently, support for RK3288
> > and RK3399 is included.
> > 
> > Please, see the previous versions of this cover letter for
> > more information.
> > 
> > Compared to v5, the only change is in the V4L2_CID_JPEG_QUANTIZATION
> > control. We've decided to support only baseline profile,
> > and only add 8-bit luma and chroma tables.
> > 
> > struct v4l2_ctrl_jpeg_quantization {
> >        __u8    luma_quantization_matrix[64];
> >        __u8    chroma_quantization_matrix[64];
> > };
> > 
> > By doing this, it's clear that we don't currently support anything
> > but baseline.
> > 
> > This series should apply cleanly on top of
> > 
> >   git://linuxtv.org/hverkuil/media_tree.git br-cedrus tag.
> > 
> > If everyone is happy with this series, I'd like to route the devicetree
> > changes through the rockchip tree, and the rest via the media subsystem.
> 
> OK, so I have what is no doubt an annoying question: do we really need
> a JPEG_RAW format?
> 

Not annoying, as it helps clarify a few things :-)
I think we do need the JPEG_RAW format. The way I see it, using
JPEG opens a can of worms...

> The JPEG header is really easy to parse for a decoder and really easy to
> prepend to the compressed image for the encoder.
> 
> The only reason I can see for a JPEG_RAW is if the image must start at
> some specific address alignment. Although even then you can just pad the
> JPEG header that you will add according to the alignment requirements.
> 
> I know I am very late with this question, but I never looked all that
> closely at what a JPEG header looks like. But this helped:
> 
> https://en.wikipedia.org/wiki/JPEG_File_Interchange_Format
> 
> and it doesn't seem difficult at all to parse or create the header.
> 
> 

... I think that having JPEG_RAW as the compressed format
is much more clear for userspace, as it explicitly specifies
what is expected.

This way, for a stateless encoder, applications are required
to set quantization and/or entropy tables, and are then in
charge of using the compressed JPEG_RAW payload in whatever form
they want. Stupid simple.

On the other side, if the stateless encoder driver supports
JPEG (creating headers in-kernel), it means that:

*) applications should pass a quality control, if supported,
and the driver will use hardcoded tables or...

*) applications pass quantization control and, if supported,
entropy control. The kernel uses them to create the JPEG frame.
But also, some drivers (e.g. Rockchip), use default entropy
tables, which should now be in the kernel.

So the application would have to query controls to find out
what to do. Not exactly hard, but I think having the JPEG_RAW
is much simpler and more clear.

Now, for stateless decoders, supporting JPEG_RAW means
the application has to pass quantization and entropy
controls, probably using the Request API.
Given the application has parsed the JPEG,
it knows the width and height and can request
buffers accordingly.

The hardware is stateless, and so is the driver.

On the other hand, supporting JPEG would mean that
drivers will have to parse the image, extracting
the quantization and entropy tables.

Format negotiation is now more complex,
either we follow the stateful spec, introducing a little
state machine in the driver... or we use the Request API,
but that means parsing on both sides kernel and application.

Either way, using JPEG_RAW is just waaay simpler and puts
things where they belong. 

> I also think there are more drivers (solo6x10) that
> manipulate the JPEG header.

Well, I've always thought this was kind of suboptimal.

Thanks,
Ezequiel
