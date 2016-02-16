From: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/5] dt/bindings: Add binding for the DA8xx MUSB driver
Date: Tue, 16 Feb 2016 18:14:30 +0100
Message-ID: <56C358F6.6010008@barix.com>
References: <1455188466-10879-1-git-send-email-petr@barix.com>
 <20160212162110.GA21833@rob-hp-laptop> <56BE1531.8060800@barix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56BE1531.8060800-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Rob,

is there any follow-up on this one?

Thanks
Petr

On 12.02.2016 18:24, Petr Kulhavy wrote:
>
> On 12.02.2016 17:21, Rob Herring wrote:
>> On Thu, Feb 11, 2016 at 12:01:06PM +0100, Petr Kulhavy wrote:
>>> + - mentor,power : Specifies the maximum current in milliamperes the 
>>> controller can
>>> +     supply in host mode.
>> Still a no for me. Looks like this just sets hcd->power_budget. This
>> property may not be a regulator, but ultimately the value depends on
>> some regulator supplying Vbus. Also, given this has nothing to do with
>> MUSB h/w, however this is described should be generic.
>
> I understand your point that the description should be generic.
> However the USB 2.0 specification does not define any relation between 
> the bMaxPower provided by the device and the actual power control.
> As far as I understand the value just serves the purpose to raise a 
> flag to the user if the attached device would draw too much power, and 
> not to enable it at all.
> Further, the value used by the protocol is not necessarily related to 
> the real current that can be supported. The maximum current supported 
> by the protocol is 510mA.
>
> For instance on my development board the real maximum current is 
> limited only by the mains power-supply used.
> So it cannot even be modelled in the DT as a regulator because the 
> power-supply is not part of the HW and
> everybody can take a different one.
>
> So defining a regulator just to store this arbitrary USB 2.0 value is 
> a bit overkill for me.
>
> Regards
> Petr

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
