From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 3/4] dt-bindings: display: add Amlogic Meson DRM
 Bindings
Date: Wed, 30 Nov 2016 17:22:02 +0100
Message-ID: <6d0450dd-eb7c-a422-ec97-376c1f5fb6c6@baylibre.com>
References: <1480520625-13269-1-git-send-email-narmstrong@baylibre.com>
 <1480520625-13269-4-git-send-email-narmstrong@baylibre.com>
 <2734274.BAOZxRirYz@avalon>
 <2e1b16c6-eec5-8cf3-5795-d6de02f36570@baylibre.com>
 <m21sxtkkg1.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m21sxtkkg1.fsf-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, airlied-cv59FeDIM0c@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, Xing.Xu-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/30/2016 05:21 PM, Kevin Hilman wrote:
> Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:
> 
>> Hi Laurent,
>> On 11/30/2016 04:58 PM, Laurent Pinchart wrote:
>>> Hi Neil,
>>>
>>> On Wednesday 30 Nov 2016 16:43:44 Neil Armstrong wrote:
>>>> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>>>> ---
>>>>  .../bindings/display/meson/meson-drm.txt           | 101 ++++++++++++++++++
>>>
>>> I forgot to mention that the file should not be named meson-drm.txt as DRM is 
>>> a Linux-specific concept. You can name it meson.txt, but a better option would 
>>> be amlogic,meson.txt. By the way does it really need a subdirectory ?
>>
>> I took example of the sun4i layout the naming, and no it does not need a subdirector..
>>
>> I will move it to amlogic,meson.txt, seems far better.
>>
> 
> To me, amlogic,meson is redundant.  Probably should be amlogic,vpu.txt?
> 
> Kevin
> 

Yes, seems more coherent.

Thanks,
Neil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
