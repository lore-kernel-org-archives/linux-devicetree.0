From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 12/13] ARM: dts: sun6i: Add sun6i-a31s.dtsi
Date: Mon, 05 Jan 2015 10:31:05 +0100
Message-ID: <54AA59D9.7030909@redhat.com>
References: <1418836704-15689-1-git-send-email-hdegoede@redhat.com> <1418836704-15689-13-git-send-email-hdegoede@redhat.com> <20141219183450.GZ4820@lukather> <54954E77.4070302@redhat.com> <20141221223941.GC4820@lukather> <549820A4.9090900@redhat.com> <20150105090825.GA31311@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBYFTVGSQKGQEKCSBYRY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150105090825.GA31311@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 05-01-15 10:08, Maxime Ripard wrote:
> Hi,
>
> On Mon, Dec 22, 2014 at 02:46:12PM +0100, Hans de Goede wrote:
>> On 21-12-14 23:39, Maxime Ripard wrote:
>>> On Sat, Dec 20, 2014 at 11:24:55AM +0100, Hans de Goede wrote:

<snip>

>>>>> Given your previous changes, you should also update the enable-method.
>>>>
>>>> I've not added a new compatible for the enable-method, given that
>>>> this is the exact same die, so the 2 are 100?% compatible, just like you
>>>> insisted that "allwinner,sun4i-a10-mod0-clk" should be used for the ir-clk
>>>> since it was 100% compatible to that I believe that the enable method
>>>> should use the existing compatible and not invent a new one for something
>>>> which is 100% compatible.
>>>
>>> Yeah, you have a point and I agree, but your patch 3 does add a
>>> CPU_METHOD_OF_DECLARE for the A31s.
>>
>> Ah right, it does, my bad.
>>
>>> Since I was going to push the branch now that 3.19-rc1 is out, do you
>>> want me to edit your patch before doing so?
>>
>> Yes, please drop the addition of the extra CPU_METHOD_OF_DECLARE, or let
>> me know if you want a new version instead.
>
> I just modified it, and pushed it, no need to resend it.

Thanks, while looking at your dt-for-3.20 branch I noticed that you've
merged v2 of "ARM: dts: sun6i: Add ir node", I did a v3 adding an ir:
label to the node, which I noticed was missing because you asked me to
move the a31s dt stuff to moving label references, can you fix this up, or
do you want me to do a follow up patch ?

Note that having this fixed is a pre-req for the csq-cs908 dts patch.

Regards,

Hans
