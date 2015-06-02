From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 6/6] ARM: sun8i: dts: Add Ippo-q8h v1.2
 with A33 and 1024x600 lcd support
Date: Tue, 02 Jun 2015 10:29:09 +0200
Message-ID: <556D6955.8030708@redhat.com>
References: <1432997706-20172-1-git-send-email-hdegoede@redhat.com> <1432997706-20172-7-git-send-email-hdegoede@redhat.com> <20150602081459.GO23777@lukather>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBWGSWWVQKGQELIWTR6Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150602081459.GO23777@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 02-06-15 10:14, Maxime Ripard wrote:
> On Sat, May 30, 2015 at 04:55:06PM +0200, Hans de Goede wrote:
>> The Ippo-q8h is a tablet circuit board commonly found in cheap Android
>> tablets. The v1.2 version can be used with either an A23 or A33 SoC.
>>
>> This adds a dts file for the v1.2 board with an A33 SoC and a 1024x600
>> LCD screen (most of these tablets have a 800x480 screen).
>
> I think the difference between the resolution here is more of a case
> for the DT quirks interface:
> https://lkml.org/lkml/2015/2/18/258

I would expect the only difference between the 2 dts files to be the
node describing the lcd panel, so yes that makes somewhat sense.

> Do you know if there's some way to autodetect the two board versions
> (like a board id somewhere in an EEPROM)?

No, AFAIK there is no way to tell the difference. There is no eeprom no
the board, and we really cannot rely on the nand contents.

> If not, then maybe u-boot can simply add that board compatible to the
> list, and we'll base our logic on that when we'll need it.

That means extra logic in u-boot, and on the kernel side, for what
benefit exactly? Such logic would make sense if there was one u-boot
image which runtime adjusted itself, but that is not an option.

And we can avoid copy and paste on the dts side by putting all
the common stuff in a common file and including that, I believe
that that is better (KISS = better) since we've no way to runtime
do the right thing AFAICT.

Regards,

Hans
