From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [PATCH 4/4] ARM: dts: sun5i: Add i2c axp152
 pmic support for Auxtek T004 boards
Date: Fri, 20 Nov 2015 19:24:50 +0100
Message-ID: <564F6572.2070909@redhat.com>
References: <1448027950-14629-1-git-send-email-hdegoede@redhat.com>
 <1448027950-14629-4-git-send-email-hdegoede@redhat.com>
 <20151120164235.GJ32142@lukather>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORB66KXWZAKGQEZNLU24Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20151120164235.GJ32142@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Michael van Slingerland <michael-D+wD5cluMvBGkk3ZsQTy/Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 20-11-15 17:42, Maxime Ripard wrote:
> On Fri, Nov 20, 2015 at 02:59:10PM +0100, Hans de Goede wrote:
>> From: Michael van Slingerland <michael-D+wD5cluMvBGkk3ZsQTy/Q@public.gmane.org>
>>
>> Add a node describing the AXP152 pmic used on Auxtek T004 boards.
>>
>> Signed-off-by: Michael van Slingerland <michael-D+wD5cluMvBGkk3ZsQTy/Q@public.gmane.org>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>
> I don't really get why this patch is in the same set as the other
> patches, but I just applied it. Thanks!

The theme of the set was dts patches which do not depend on anything
else :)

And sorry about the conflicts, I had the touchscreen patches in my
tree before this set.

Regards,

Hans
