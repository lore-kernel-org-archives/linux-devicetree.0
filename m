From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [RFC v2 4/4] iio: chemical: add SGX VZ89x VOC sensor support
Date: Mon, 07 Sep 2015 10:08:42 +0200
Message-ID: <55ED460A.1080706@metafoo.de>
References: <1441593547-10896-1-git-send-email-mranostay@gmail.com>	<1441593547-10896-5-git-send-email-mranostay@gmail.com>	<CAFSKS=NvhBvwknAXs-Pfd-bJ4U6zrXD3zBZT0GaC+w5JUg24ig@mail.gmail.com>	<CAKzfze_UBjKauqqCLDSkUu-ee+ZC0VzQCaYpZEgpfRny_H4y1A@mail.gmail.com> <CAKzfze8sEkr5q6-X42Z24nqrqy8JMdqL3omRKOraz1G0BehyJg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKzfze8sEkr5q6-X42Z24nqrqy8JMdqL3omRKOraz1G0BehyJg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, "open list:IIO SUBSYSTEM AND..." <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, George McCollister <george.mccollister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/07/2015 06:27 AM, Matt Ranostay wrote:
> Thinking this over do we needed a IIO_CHAN_INFO_PROCESSED_OFFSET to
> signal that it needs to be after the (value - offset) * scale
> calculation?

Well, value * scale + offset = (value + offset/scale) * scale. So just scale
your offset inversely to the scale.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
