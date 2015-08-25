From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 1/3] dt-bindings: mailbox: Document Hi6220 mailbox
 driver
Date: Tue, 25 Aug 2015 21:01:49 +0800
Message-ID: <20150825130149.GA28262@leoy-linaro>
References: <1439977055-1747-1-git-send-email-leo.yan@linaro.org>
 <1439977055-1747-2-git-send-email-leo.yan@linaro.org>
 <55DC4EC0.4060301@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55DC4EC0.4060301-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yiping Xu <xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jian Zhang <zhangjian001-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Zhenwei Wang <Zhenwei.wang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Haoju Mo <mohaoju-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Dan Zhao <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, kongfei@hisilicon
List-Id: devicetree@vger.kernel.org

Hi Sudeep,

Thanks for review, please see below comment.

On Tue, Aug 25, 2015 at 12:17:20PM +0100, Sudeep Holla wrote:
> On 19/08/15 10:37, Leo Yan wrote:
> >Document the new compatible for Hisilicon Hi6220 mailbox driver.
> >
> >Signed-off-by: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >---
> >  .../bindings/mailbox/hisilicon,hi6220-mailbox.txt  | 57 ++++++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt
> >
> >diff --git a/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt b/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt
> >new file mode 100644
> >index 0000000..3dfb0b0
> >--- /dev/null
> >+++ b/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt
> >@@ -0,0 +1,57 @@
> >+Hisilicon Hi6220 Mailbox Driver
> >+===============================
> >+
> >+Hisilicon Hi6220 mailbox supports up to 32 channels. Each channel
> >+is unidirectional with a maximum message size of 8 words. I/O is
> >+performed using register access (there is no DMA) and the cell
> >+raises an interrupt when messages are received.
> >+
> >+Mailbox Device Node:
> >+====================
> >+
> >+Required properties:
> >+--------------------
> >+- compatible:		Shall be "hisilicon,hi6220-mbox"
> >+- reg:			Contains the mailbox register address range (base
> >+			address and length); the first item is for IPC
> >+			registers, the second item is shared buffer for
> >+			slots.
> 
> Not sure if the shared buffer needs to be part of the controller binding
> as it's not related to it. It's just agreement between the endpoints of
> this mailbox on particular SoC and IMO has to part of the client binding.

Yes, we need distinguish the buffer is really used for channel's
management or just only used for client. Here "shared buffer" is
used for channels' state machine, mode and raw data with 8 words.

So mailbox driver just read/write raw data according to client's
requirement, client will define their specific format for data
transcation.

Thanks,
Leo Yan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
