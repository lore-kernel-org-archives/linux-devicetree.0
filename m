From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: mailbox: Introduce Hi3660 controller
 binding
Date: Wed, 20 Dec 2017 08:27:50 +0800
Message-ID: <20171220002747.GA10511@leoy-linaro>
References: <1513682145-19892-1-git-send-email-zhongkaihua@huawei.com>
 <1513682145-19892-2-git-send-email-zhongkaihua@huawei.com>
 <20171219233038.mjkqakshn7ud7ise@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171219233038.mjkqakshn7ud7ise@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kaihua Zhong <zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, suzhuangluan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuezhiliang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, kevin.wangtao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 19, 2017 at 05:30:38PM -0600, Rob Herring wrote:
> On Tue, Dec 19, 2017 at 07:15:43PM +0800, Kaihua Zhong wrote:
> > From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > 
> > Introduce a binding for the Hi3660 mailbox controller, the mailbox is
> > used within application processor (AP), communication processor (CP),
> > HIFI and MCU, etc.
> > 
> > Signed-off-by: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  .../bindings/mailbox/hisilicon,hi3660-mailbox.txt  | 51 ++++++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.txt
> 
> Please add acks when posting new versions.

Thanks, Rob.

This is my bad :) and will add acks in later version.

Thanks,
Leo Yan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
