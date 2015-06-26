From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [PATCH 2/3] ARM: dts: axp152: Add a dtsi file
 for the axp152 pmic
Date: Fri, 26 Jun 2015 10:22:26 +0200
Message-ID: <558D0BC2.10004@redhat.com>
References: <1435088503-20776-1-git-send-email-hdegoede@redhat.com>
 <1435088503-20776-3-git-send-email-hdegoede@redhat.com>
 <20150625174027.GF2266@lukather>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBRUXWSWAKGQENOSSFIY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150625174027.GF2266@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 25-06-15 19:40, Maxime Ripard wrote:
> Hi,
>
> On Tue, Jun 23, 2015 at 09:41:42PM +0200, Hans de Goede wrote:
>> From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> Add a dtsi file for the axp152 pmic, this mirrors the way things are
>> handled for the axp202 pmic.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/axp152.dtsi | 49 +++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 49 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/axp152.dtsi
>
> Unfortunately, Mark expressed clearly that he didn't want such files.

That is not how I remember the discussion, he said that he did not consider
them useful, we explained why we do consider them useful for the sunxi
case and then things went quiet.

And we do already have an axp209.dtsi, and I find having that useful
for enabling the regulators on axp209 using boards.

Ultimately it is your call, but I really think we should be consistent
and add an axp152.dtsi to mirror how we do things with the axp209.

Regards,

Hans
