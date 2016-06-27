From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] iio: pressure: bmp280: augment DT bindings
Date: Mon, 27 Jun 2016 10:52:26 +0200
Message-ID: <CACRpkdap7oMnzP6u7dz3-hvbMAFfMf1iSp7v=czq1VBwMj51cA@mail.gmail.com>
References: <1466176341-17442-1-git-send-email-linus.walleij@linaro.org>
 <20160620164645.GA3191@rob-hp-laptop> <058533b8-a0a7-b7fa-9745-d72eb2a2db21@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <058533b8-a0a7-b7fa-9745-d72eb2a2db21-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Irina Tirdea <irina.tirdea-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 26, 2016 at 6:47 PM, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On 20/06/16 17:46, Rob Herring wrote:
>> On Fri, Jun 17, 2016 at 05:12:18PM +0200, Linus Walleij wrote:

>>>  Required properties:
>>> -- compatible: bosch,bmp085
>>> +- compatible: "bosch,bmp085" or "bosch,bmp180" or "bosch,bmp280"
>>
>> One per line is preferred, but I wouldn't respin just for that.
>>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
> Applied to the togreg branch of iio.git - initially pushed out
> as testing.

Actually I did fix Rob's minor comments and sent out as v2,
but no big deal.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
