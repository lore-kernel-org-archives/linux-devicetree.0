From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC] ARM: dts: sunxi: Add regulators and
 board-specific operating points for LeMaker BananaPi
Date: Tue, 28 Jul 2015 16:24:58 +0200
Message-ID: <55B790BA.5000509@redhat.com>
References: <1437960486-2809-1-git-send-email-public_timo.s@silentcreek.de>
 <55B5E6DB.8020009@redhat.com>
 <20150727120918.191F76C82FB4@dd34104.kasserver.com>
 <55B62768.6040403@redhat.com> <20150728124911.GA2564@lukather>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBQFB32WQKGQEC2PCEEQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150728124911.GA2564@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 07/28/2015 02:49 PM, Maxime Ripard wrote:
> Hi,
>
> On Mon, Jul 27, 2015 at 02:43:20PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 27-07-15 14:09, public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org wrote:
>>> Hi,
>>>
>>> Hans de Goede schrieb am 27.07.2015 10:07:
>>>
>>>> I've a simular patch here:
>>>>
>>>> https://github.com/jwrdegoede/linux-sunxi/commit/6a30b7d5be6012b81e5e1439a444e41c0ac1afc1
>>>>
>>>> I did not submit this upstream yet as it is part of a series to enable the otg
>>>> controller on the bananapi which needs axp-usb-power-supply support for which
>>>> the actual powersupply driver changes are still pending.
>>>
>>> Oops, I see. Are you planning to submit this for 4.3 or later?
>>
>> I plan to submit this for 4.3.
>
> I don't feel like holding patches that were posted before you did
> because you did them some time ago and never submitted them is
> reasonnable and / or encouraging for new submitters of patches.
>
> I'd really like to get more sunxi-people contributing, and that starts
> with that kind of trivial stuff. Holding them back because one of the
> usual (and experienced) developpers is a bit counter-productive (and
> I'm sure you still have a lot of patches to submit anyway ;)).

I've no problem with Timo submitting a cleaned up version of his
patch and you taking that instead. I just wanted to point out that
I do have a similar patch pending.

Regards,

Hans
