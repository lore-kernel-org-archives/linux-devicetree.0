From: Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH v3 6/7] media: Add controls for JPEG quantization tables
Date: Tue, 28 Aug 2018 23:50:36 -0300
Message-ID: <d55bf57ed63ba82524af1dcae3201a513cec9f48.camel@collabora.com>
References: <20180822165937.8700-1-ezequiel@collabora.com>
 <20180822165937.8700-7-ezequiel@collabora.com>
 <3a92082b201776bfed0f68facc30577cb7d2a5c1.camel@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <3a92082b201776bfed0f68facc30577cb7d2a5c1.camel-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Nicolas Dufresne <nicolas.dufresne-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Miouyouyou <myy-tmjzNUIc0P1+EYZtW95mkQ@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Shunqian Zheng <zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2018-08-27 at 09:47 +0200, Paul Kocialkowski wrote:
> Hi,
> 
> On Wed, 2018-08-22 at 13:59 -0300, Ezequiel Garcia wrote:
> > From: Shunqian Zheng <zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > 
> > Add V4L2_CID_JPEG_LUMA/CHROMA_QUANTIZATION controls to allow userspace
> > configure the JPEG quantization tables.
> 
> How about having a single control for quantization?
> 
> In MPEG-2/H.264/H.265, we have a single control exposed as a structure,
> which contains the tables for both luma and chroma. In the case of JPEG,
> it's not that big a deal, but for advanced video formats, it would be
> too much hassle to have one control per table.
> 
> In order to keep the interface consistent, I think it'd be best to merge
> both matrices into a single control.
> 
> What do you think?
> 

I think it makes a lot of sense. I don't see the benefit in having luma
and chroma separated, and consistency is good.

I guess the more consistent solution would be to expose a compound
control, similar to the video quantization one.

struct v4l2_ctrl_jpeg_quantization {
       __u8    luma_quantization_matrix[64];
       __u8    chroma_quantization_matrix[64];
};

Thanks!
Eze
