From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 00/20] ARM: dts: Add USB and OTG related
 nodes and enable on various boards
Date: Wed, 10 Jun 2015 15:27:08 +0200
Message-ID: <55783B2C.3080207@redhat.com>
References: <1433530943-12599-1-git-send-email-hdegoede@redhat.com> <20150608100358.GW23777@lukather>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBMHW4CVQKGQEWYJAEBY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150608100358.GW23777@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 08-06-15 12:03, Maxime Ripard wrote:
> Hi Hans,
>
> On Fri, Jun 05, 2015 at 09:02:03PM +0200, Hans de Goede wrote:
>> Hi Maxime,
>>
>> Here is a patch-set with all the otg / sun8i-usb-host related dts patches
>> I've accumulated.
>>
>> These are intended for 4.3, and go hand in hand with the outstanding
>> musb-sunxi / phy-sun4i-usb patches, which I expect to be merged as is
>> for 4.3 .
>
> I'm fine with these patches. Do you have a branch somewhere that I can
> pull (without the one that you wanted me to drop, obviously)?

I've just created a branch with just these patches directly on top
of sunxi/for-next for you:

https://github.com/jwrdegoede/linux-sunxi/commits/otg-dts-for-maxime

While preparing this branch I noticed that the dts for
the ippo q8h a33 tablets is not yet merged:

http://www.spinics.net/lists/devicetree/msg82149.html

You suggested to use the DT quirks interface instead of creating
a separate dts for each board variant, and in the end I agreed,
and asked you to merge it renamed to a more generic name
without the lcd1024x600 bit in there.

I can make it more generic and resend it myself. Do you want me
to squash in the otg changes when I resend it, or shall I keep
those separate ?

Regards,

Hans
