From: Nicolas Dufresne <nicolas.dufresne@gmail.com>
Subject: Re: [PATCH 3/7] [Media] vcodec: mediatek: Add Mediatek V4L2 Video
 Decoder Driver
Date: Mon, 18 Apr 2016 13:48:17 -0400
Message-ID: <1461001697.2719.7.camel@gmail.com>
References: <1460548915-17536-1-git-send-email-tiffany.lin@mediatek.com>
	 <1460548915-17536-2-git-send-email-tiffany.lin@mediatek.com>
	 <1460548915-17536-3-git-send-email-tiffany.lin@mediatek.com>
	 <1460548915-17536-4-git-send-email-tiffany.lin@mediatek.com>
	 <5710FA3A.2030603@xs4all.nl> <1460958046.7861.48.camel@mtksdaap41>
	 <57148D8E.9060601@xs4all.nl> <1460967754.7861.61.camel@mtksdaap41>
Reply-To: nicolas@ndufresne.ca
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460967754.7861.61.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: tiffany lin <tiffany.lin@mediatek.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: Pawel Osciak <pawel@osciak.com>, Hans Verkuil <hans.verkuil@cisco.com>, daniel.thompson@linaro.org, Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Kurtz <djkurtz@chromium.org>, Pawel Osciak <posciak@chromium.org>, Eddie Huang <eddie.huang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, PoChun.Lin@mediatek.com
List-Id: devicetree@vger.kernel.org

Le lundi 18 avril 2016 =C3=A0 16:22 +0800, tiffany lin a =C3=A9crit=C2=A0=
:
> > > We are plaining to remove m2m framework in th feature, although
> we think
> >=C2=A0
> > Remove it for just the decoder driver or both encoder and decoder?
> >=C2=A0
> Remove it from decoder driver.

Did you look at how CODA handle it (drivers/media/platform/coda/coda-
common.c) ? I don't know any detail, but they do have the same issue
and use both=C2=A0v4l2_m2m_fop_poll and=C2=A0v4l2_m2m_fop_mmap.

cheers,
Nicolas
