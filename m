From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH 3/3] DT: add Faraday Tec. as vendor
Date: Sat, 11 Feb 2017 13:34:02 +1030
Message-ID: <CACPK8Xf37KNMjh+xy2j66WJW856M4OqYqm3jNPnotzFwOMOjbg@mail.gmail.com>
References: <20170208200010.21522-1-ulli.kroll@googlemail.com>
 <20170208200010.21522-4-ulli.kroll@googlemail.com> <CACRpkdaYAZAdxTfG90K8UBE1X9Ts7Mh4f+zNcD2JKEMYBmEZCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdaYAZAdxTfG90K8UBE1X9Ts7Mh4f+zNcD2JKEMYBmEZCw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 10, 2017 at 11:46 PM, Linus Walleij
<linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Wed, Feb 8, 2017 at 9:00 PM, Hans Ulli Kroll
> <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>
>> add Faraday Technology Corporation as vendor faraday for DT
>>
>> Signed-off-by: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>
> Reviewed-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> I think I should use this for the PCI block as well, looking over some
> code and the root hub is using Faraday's PCI ID.

Acked-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>

This string is already used by the ftgmac100 Ethernet driver. Thanks
for adding it in.

Cheers,

Joel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
