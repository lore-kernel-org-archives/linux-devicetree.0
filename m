From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sunxi: Banana Pi: increase
 startup-delay for the GMAC PHY regulator
Date: Tue, 11 Nov 2014 19:35:48 +0100
Message-ID: <54625704.7030100@redhat.com>
References: <1415539714-7652-1-git-send-email-merker@debian.org> <1415539714-7652-2-git-send-email-merker@debian.org> <545FD716.5060305@redhat.com> <20141111173435.GJ14919@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBHNORGRQKGQEXLGGIGA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20141111173435.GJ14919@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 11/11/2014 06:34 PM, Maxime Ripard wrote:
> On Sun, Nov 09, 2014 at 10:05:26PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 11/09/2014 02:28 PM, Karsten Merker wrote:
>>> On the LeMaker Banana Pi, probing the external ethernet PHY connected
>>> to the SoC's internal GMAC module sometimes fails.  The PHY power
>>> supply is handled via a GPIO-controlled regulator, and the existing
>>> regulator startup-delay of 50000us is too short to make sure that the
>>> PHY is always fully powered up when it is queried by phylib.  To
>>> guarantee a reliable PHY detection, the startup-delay has to be
>>> increased to 60000us.
>>
>> We should probably just increase it to 100000us to be safe, otherwise:
>>
>> Acked-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> 
> Soooo, should I merge it or will there be a v2?

It might be easiest if you merge it with the delay increased to 100000 us,
assuming you agree that it is a good idea to add some extra safety margin.

Regards,

Hans
