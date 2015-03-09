From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/3] touchscreen: sun4i-ts: A10 (sun4i) has
 a different temperature curve
Date: Mon, 09 Mar 2015 09:17:50 +0100
Message-ID: <54FD572E.7040201@redhat.com>
References: <1425848022-18001-1-git-send-email-hdegoede@redhat.com> <20150308211117.GA23193@dtor-ws>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBOFO6WTQKGQEPIOPFMY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150308211117.GA23193@dtor-ws>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 08-03-15 22:11, Dmitry Torokhov wrote:
> Hi Hans,
>
> On Sun, Mar 08, 2015 at 09:53:39PM +0100, Hans de Goede wrote:
>> Hi Dmitry, Maxime, et al.
>>
>> Here is a patch-set for the sun4i-ts driver temperature sensor support,
>> it consists of 2 fixes:
>>
>> 1) Use a better temperature curve for A10 SoCs to avoid reporting a way to
>> high temperature.
>>
>> 2) Start with reporting an "estimated" temperature of 40 degrees rather then
>> returning -EAGAIN until we get the first temperature ready interrupt to avoid
>> the kernel tempzone core logging errors because of our -EAGAIN return.
>
> No, I think we better teach thermal core not to complain about
> -EAGAINs.

I was wondering if that would not be a better fix myself, so ack. I'll go do
a patch for that and submit it to the thermalzone maintainer.

Regards,

Hans
