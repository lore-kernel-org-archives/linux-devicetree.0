From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: mailbox: Document Hi6220 mailbox driver
Date: Fri, 16 Oct 2015 10:26:48 +0530
Message-ID: <CABb+yY0S18ShH3+sBnq=mOYMY=f4BNp947cUJae4YPfR=wPGGg@mail.gmail.com>
References: <1444667535-16948-1-git-send-email-leo.yan@linaro.org>
	<1444667535-16948-2-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444667535-16948-2-git-send-email-leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Yiping Xu <xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 12, 2015 at 10:02 PM, Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> +
> +Mailbox Device Node:
> +====================
> +
> +Required properties:
> +--------------------
> +- compatible:          Shall be "hisilicon,hi6220-mbox"
> +- reg:                 Contains the mailbox register address range (base
> +                       address and length); the first item is for IPC
> +                       registers, the second item is shared buffer for
> +                       slots.
>
Is the shared-buffer a part of mailbox controller or just regular
memory that could be used for purposes other than mailbox also? If
latter, please remove it from here.

> +Mailbox client
> +===============
> +
> +"mboxes" and the optional "mbox-names" (please see
> +Documentation/devicetree/bindings/mailbox/mailbox.txt for details). Each value
> +of the mboxes property should contain a phandle to the mailbox controller
> +device node and second argument is the channel index. It must be 0 (hardware
> +support only one channel).
>
sorry, what must be 0?  You have MBOX_CHAN_MAX and MBOX_CHAN_NUM as 32
and 2 in the driver.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
