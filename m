From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 29/30] dt-bindings: add vendor prefix for bananapi
Date: Tue, 9 May 2017 09:49:07 +0200
Message-ID: <CABuKBe+pXWk=oRpF75xidDocPQdjUiAqwpKtqEFnFnLO52AqtQ@mail.gmail.com>
References: <1493198774-4478-1-git-send-email-sean.wang@mediatek.com>
 <1493198774-4478-30-git-send-email-sean.wang@mediatek.com>
 <20170428203727.m6jm5w6nb2iirxih@rob-hp-laptop> <1493621880.32195.13.camel@mtkswgap22>
 <CAL_JsqKHpWGviZ2H-xhGMzNWsCCRMj_O5ux8aguFfeVKBfJa_w@mail.gmail.com>
 <1494237213.9662.50.camel@mtkswgap22> <CAK8P3a3FpbGErEo93xaDLZMi0+XQvKk44dniZqrecQf=WJD1-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK8P3a3FpbGErEo93xaDLZMi0+XQvKk44dniZqrecQf=WJD1-g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, RobHerring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sean, Hi Arnd,

+Eddie who pinged me about this in a private mail.


2017-05-08 13:36 GMT+02:00 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:
> On Mon, May 8, 2017 at 11:53 AM, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>> Hi Rob,
>>
>> thanks for helping me looping in the right group
>>
>>
>> Hi Arnd and Olof
>>
>> I found Matthias is inactive for a while (his branch in his tree seemed
>> to stop at 4.10 since the end of February) maybe he was busy at other
>> things. Is there a good way to break the stuck situation and keeping
>> linux-mediatek moving on?
>>
>> I have the willing to fork his tree, prepare dt-for-4.12 and send
>> pull-requests to you.
>
> Hi Sean,
>
> Thanks for offering to help out. I've added Matthias' other email address
> to Cc here, let's see if he notices the discussion now. Ideally any
> important platform should have multiple maintainers so there is
> always a backup person when the primary contact is unavailable
> for any reason.
>
> I'm not sure how much we can still do for 4.12, if you can prepare a
> branch now we can definitely have a look and see what we can
> realistically take for a late merge, but as we are in the second half
> of the merge window already, we would normally put new features
> into a 4.13 branch and only take bug fixes for 4.12. If there are
> some entirely new files for additional boards, or only small changes
> to the existing files, we might make an exception this time.
>
>> But I am worried in that way violating the reviewing process if
>> Matthias no reads it.
>
> Don't worry about that at the moment, if Matthias cannot be reached
> at all, we have to find an alternative way to get patches in.
>


I'm very sorry for the situation. Actually I was struggling lately to
do my maintainer work in an acceptable manner. And this merge window I
definitely wasn't able to follow the discussions. I hope that this
will change in the very near future.

I would propose to send a merge request or a summary with the relevant
patches now and I will look at it today and forward them to Arnd.
For the future we should start to think about who could step-in as
co-maintainer to avoid situation like this.

Once again, sorry for the inconvenience,
Matthias

>         Arnd
>
>> On Tue, 2017-05-02 at 08:52 -0500, Rob Herring wrote:
>>> +arm-soc
>>>
>>> On Mon, May 1, 2017 at 1:58 AM, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>>> > On Fri, 2017-04-28 at 15:37 -0500, Rob Herring wrote:
>>> >> On Wed, Apr 26, 2017 at 05:26:13PM +0800, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
>>> >> > From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>>> >> >
>>> >> > Banana Pi team in Sinovoip Co., Limited which are dedicated to
>>> >> > design and manufacture open hardware product.
>>> >> >
>>> >> > Website: http://www.banana-pi.org/
>>> >> >
>>> >> > Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>>> >> > ---
>>> >> >  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>>> >> >  1 file changed, 1 insertion(+)
>>> >> >
>>> >> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
>>> >> > index ec0bfb9..8ca0f3c 100644
>>> >> > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
>>> >> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
>>> >> > @@ -44,6 +44,7 @@ avia      avia semiconductor
>>> >> >  avic       Shanghai AVIC Optoelectronics Co., Ltd.
>>> >> >  axentia    Axentia Technologies AB
>>> >> >  axis       Axis Communications AB
>>> >> > +bananapi Banana Pi SINOVOP CO., LIMITED
>>> >>
>>> >> s/SINOVOP/SINOVOIP/
>>> >
>>> > Hi Rob,
>>> >
>>> > thanks for your careful reviewing , i will correct it in the next
>>> > version.
>>> >
>>> > BTW, Could those related dts changes go through your tree if everything
>>> > looks good? Because I find Matthias have been inactive for a while and
>>> > the latest branch in his tree seems still staying on 4.10.
>>>
>>> Happy to take binding doc changes, but I don't take dts changes
>>> because those go thru arm-soc. If the platform maintainer is not
>>> responsive, then we should replace or add maintainers.
>>>
>>> Rob



-- 
motzblog.wordpress.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
