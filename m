From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2 1/3] devicetree: bindings: Document qcom,msm-id and qcom,board-id
Date: Tue, 10 Mar 2015 10:55:47 -0700
Message-ID: <CAOesGMjJXyjNH-Lm66mZXq0X=52DyRtdmpvQ4sFEr0cMAp3b-w@mail.gmail.com>
References: <1425503602-24916-1-git-send-email-galak@codeaurora.org>
	<CAOesGMjpOx4SxY7j8jnoEwLG+mhPKB2st8qCb-hduHLOVw=RcQ@mail.gmail.com>
	<F9B276F7-61EF-4406-AB46-97D7F1ECEEFE@codeaurora.org>
	<89746055.qtEO3GZJmR@wuerfel>
	<F5017A7F-0EA2-41B3-A9DD-6123CCFD36FA@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <F5017A7F-0EA2-41B3-A9DD-6123CCFD36FA-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 10, 2015 at 10:13 AM, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wro=
te:
>
> On Mar 9, 2015, at 7:11 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>
>> On Friday 06 March 2015 14:37:52 Kumar Gala wrote:
>>> On Mar 6, 2015, at 1:15 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
>>>
>>>> On Fri, Mar 6, 2015 at 8:08 AM, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> =
wrote:
>>>>>
>>>>> On Mar 5, 2015, at 7:59 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote=
:
>>>>>
>>>>>> On Thu, Mar 5, 2015 at 12:23 PM, Kumar Gala <galak-sgV2jX0FEOJiIJoWrK/4GQ@public.gmane.org=
g> wrote:
>>>>>>>
>>>>>>> On Mar 5, 2015, at 1:42 PM, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> w=
rote:
>>>>>>>
>>>>>>>> Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> writes:
>>>>>>>>
>>>>>>>>> The top level qcom,msm-id and qcom,board-id are utilized by b=
ootloaders
>>>>>>>>> on Qualcomm MSM platforms to determine which device tree shou=
ld be
>>>>>>>>> utilized and passed to the kernel.
>>>>>>>>>
>>>>>>>>> Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
>>>>>>>>> Signed-off-by: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>>>>>>>>
>>>>>>>> Is this the special magic that allows qcom bootloaders to take=
 a kernel
>>>>>>>> plus multiple DTBs and figure out which DTB to pass?
>>>>>>>>
>>>>>>>> Kevin
>>>>>>>
>>>>>>> yes
>>>>>>
>>>>>> That's a bummer.
>>>>>>
>>>>>> Luckily, the solution for upstream is still quite simple: Provid=
e only
>>>>>> one devicetree, and it'll be used, right?
>>>>>
>>>>> We can provide only one, we still need the IDs in the DT.
>>>>
>>>> How are the DTS provided? Concatenated with the kernel, or in a
>>>> wrapped data format? Or in a separate partition from the kernel?
>>>
>>> Its a wrapped data format that is than concatenated with the kernel=
 if I remember correctly.
>>
>> Then you should be able to create a tool that can write this concate=
nated
>> format and insert these properties from a table that matches the boo=
t
>> loader, right?
>>
>>       Arnd
>
> Are you suggesting the tool insert the properties in the DT?  I=E2=80=
=99m not sure I understand what the point of doing that would be.

To insert platform-local properties that mean nothing outside of the
firmware packaging of the device trees, which is the case here?

I think the idea of having the installer script inserting them is
quite reasonable in this case.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
