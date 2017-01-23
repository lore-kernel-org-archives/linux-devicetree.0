From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 6/6] dt-bindings: mt8173-mtu3: add reference clock
Date: Mon, 23 Jan 2017 08:02:44 -0600
Message-ID: <CAL_JsqJg7=ykNkAbMeLqFT6HK-pK+FQAK7ZS_UMMy8ftrGM-KA@mail.gmail.com>
References: <1484719707-12107-1-git-send-email-chunfeng.yun@mediatek.com>
 <1484719707-12107-6-git-send-email-chunfeng.yun@mediatek.com>
 <20170121201155.cqcihopdc3kjyfi6@rob-hp-laptop> <1485049780.10292.78.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485049780.10292.78.camel@mhfsdcap03>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jan 21, 2017 at 7:49 PM, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> Hi,
>
> On Sat, 2017-01-21 at 14:11 -0600, Rob Herring wrote:
>> On Wed, Jan 18, 2017 at 02:08:27PM +0800, Chunfeng Yun wrote:
>> > add a reference clock for compatibility
>>
>> Why? This block suddenly has 2 clocks instead of 1?
> In fact, there is a reference clock which comes from 26M oscillator
> directly. I ignore it because it is a fixed-clock in DTS, and always
> turned on for mt8173. But later, I find that I made a mistake before
> when I bring up it on a new platform whose reference clock comes from
> PLL, and need control it. So here add it, no matter it is a fixed-clock
> or not.

Add this explanation to the changelog.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
