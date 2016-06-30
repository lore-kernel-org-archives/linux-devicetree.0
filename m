From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [PATCH 1/4] ARM: dts: sun5i: Enable otg on the
 auxtex t004
Date: Thu, 30 Jun 2016 11:45:00 +0200
Message-ID: <dbce3f4a-dbd6-2ee6-292a-6dec71b99d63@redhat.com>
References: <1467226022-10525-1-git-send-email-hdegoede@redhat.com>
 <20160629203838.GI6095@lukather>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBJGU2O5QKGQEABM7JBI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160629203838.GI6095@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 29-06-16 22:38, Maxime Ripard wrote:
> Hi,
>
> On Wed, Jun 29, 2016 at 08:46:59PM +0200, Hans de Goede wrote:
>> The auxtek t004 has its otg usb vbus hardwired to 5v (likely in case
>> people use it to power the board instead of the dedicated power micro
>> usb connector), it does have an id pin, so it allows full otg
>> functionality.
>
> I don't really get what you're saying here. Is the VBUS hardcoded to
> 5V, without any way to switch it, or it is not wired at all?

It is hardwired to 5v, quoting from my commit msg
"has its otg usb vbus hardwired to 5v"

> In the former case, how can one of the PMIC output be related to the
> board power input?

I believe it is not wired to the pmic output, but to the pmic 5v input.

Regards,

Hans
