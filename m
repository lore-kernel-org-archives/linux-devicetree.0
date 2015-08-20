From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [PATCH 2/3] ARM: dts: sun6i: Turn on gmac on Colombus
Date: Thu, 20 Aug 2015 22:54:51 +0800
Message-ID: <CAGb2v64YBmkmRbHz=XFmQG-Newvxm_R2MS2Jg0v-XO_qYgZQxg@mail.gmail.com>
References: <1438960955-6551-1-git-send-email-hdegoede@redhat.com>
 <1438960955-6551-2-git-send-email-hdegoede@redhat.com> <20150819151754.GH30520@lukather>
 <55D5725F.6000106@redhat.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBUWU26XAKGQEE2RIH4A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <55D5725F.6000106-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 20, 2015 at 2:23 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Hi,
>
> On 08/19/2015 05:17 PM, Maxime Ripard wrote:
>>
>> On Fri, Aug 07, 2015 at 05:22:34PM +0200, Hans de Goede wrote:
>>>
>>> We've everything we need to support the gmac on Colombus, turn it on.
>>>
>>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>
>>
>> I recall that the phy was powered by one of the AXP221 regulators,
>> does it require some additional stuff (like a recent u-boot), or does
>> it just work and my memory is bad :) ?
>
>
> I think it just works, it MAY be connected to aldo1 but according to
> the git history for the u-boot defconfig that one is used for wifi not
> for the gmac, and we do not enable any other "spare" regulators in the
> u-boot config.
>
> I do not have any schematics, so no way to say for sure.
>
> I can confirm that the GMAC work fine with the latest u-boot
> master. Looking in the history we've always enabled ALDO1
> on the Colombus in upstream u-boot, so this should all just work.

Could you test it with ALDO1 disabled in U-boot? That should give us
an answer.

ChenYu
