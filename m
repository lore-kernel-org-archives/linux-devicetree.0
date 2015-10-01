From: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: add all hi6220 uart nodes
Date: Thu, 1 Oct 2015 09:43:41 +0800
Message-ID: <CAN1soZyKEFd6aqcDuttf6VwS7v2f+R9N1V5bAacUOeMHMt+dUQ@mail.gmail.com>
References: <1443558552-5734-1-git-send-email-tyler.baker@linaro.org>
	<1459065.BtzC7pyUYF@wuerfel>
	<20150930173145.GG15635@sirena.org.uk>
	<CANMBJr7yY1PJChnFSRknqfOLORuWZSEONV+e=M=9heX3i-ADKA@mail.gmail.com>
	<CAL_JsqLSDXGCush7TMavRkw5F=vbBbrFaexFyBdXHyrfNVGjXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLSDXGCush7TMavRkw5F=vbBbrFaexFyBdXHyrfNVGjXg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kevin's boot bot <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 1, 2015 at 3:03 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Sep 30, 2015 at 1:12 PM, Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> On 30 September 2015 at 10:31, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>> On Wed, Sep 30, 2015 at 10:24:56AM +0200, Arnd Bergmann wrote:
>>>> On Tuesday 29 September 2015 13:29:12 Tyler Baker wrote:
>>>
>>>> >         aliases {
>>>> >                 serial0 = &uart0;
>>>> > +               serial1 = &uart1;
>>>> > +               serial2 = &uart2;
>>>> > +               serial3 = &uart3;
>>>> > +               serial4 = &uart4;
>>>> >         };
>>>
>>>> In the changelog you mention "both uarts", but here you have five of them.
>>>> Are they all accessible on the connector? If not, only provide aliases
>>>> for the ones that are, using numbering that makes most sense for given
>>>> how one would use the board.
>>
>> Thanks for the comment Arnd. Mark's comment below is correct, there
>> are only two UARTs accessible on the LS connection in addition to the
>> one on the board (solder pad).
>>
>> Is the following definition any clearer?
>>
>> serial0 = &uart0; // Onboard UART0
>> serial1 = &uart2; // LS expansion UART0
>> serial2 = &uart3; // LS expansion UART1
>
> Yes, but use C style comments.
>
> What about the BT UART?
>

Yes, all four uarts are used in hikey board. uar0 is onboard serial
uart. uart1 is
BT uart. uart2 & uart3 are connected to low speed expansion board. So Tyler
shouldn't decrease any uart from his current patch.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
