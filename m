From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: dts: rockchip: Point rk3288 dwc2 usb at the full
 PHY reset
Date: Mon, 22 Aug 2016 13:30:01 +0300
Message-ID: <3fcb28bd-eab1-3460-45ef-487435e64ccc@cogentembedded.com>
References: <4c931176-a09a-546c-d2b6-ea74028c78a2@cogentembedded.com>
 <1471766205-12940-1-git-send-email-ayaka@soulik.info>
 <1471766205-12940-5-git-send-email-ayaka@soulik.info>
 <95d6e178-b9c5-ed40-2adc-5ffd1d78db07@cogentembedded.com>
 <b60bcef2-31d7-5a15-a09a-b71006c99c92@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b60bcef2-31d7-5a15-a09a-b71006c99c92-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ayaka <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 8/21/2016 3:19 PM, ayaka wrote:

>>> The "host1" port (AKA the dwc2 port that isn't the OTG port) on rk3288
>>> has a hardware errata that causes everything to get confused when we get
>>> a remote wakeup.  We'll use the reset that's in the CRU to reset the
>>> port when it's in a bad state.
>>>
>>> Note that we add the reset to both dwc2 controllers even though only one
>>> has the errata in case we find some other use for this reset that's
>>> unrelated to the current hardware errata.  Only the host port gets the
>>> quirk property, though.
>>>
>>> This patch came from Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> originally.
>>
>>    Was it signed off by him? Don't you need to keep his authorship via th
>> "From:" tag?

> I would rather the idea comes from him, but the implementation is different. I

    Then write exactly that. Because now it sounds like the patch itself was 
originated from him.

> don't which tag would be
> better? If the "From:" would be the best choice. I would resend the last two
> patches.

    There's also "Suggested-by:" tag which might fit here.

>>> Signed-off-by: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
[...]

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
