From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [PATCH 7/9] ARM: dts: sun7i: Add new ba10-tvbox board
Date: Tue, 01 Jul 2014 09:06:31 +0200
Message-ID: <53B25DF7.8050508@redhat.com>
References: <1404165479-23785-1-git-send-email-hdegoede@redhat.com> <1404165479-23785-8-git-send-email-hdegoede@redhat.com> <CAGb2v66BO4W5Nrp-9X+20mK+7BObpdmc5x70BC5C7EGEHDcvew@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBCV4ZGOQKGQEKPOSHHQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAGb2v66BO4W5Nrp-9X+20mK+7BObpdmc5x70BC5C7EGEHDcvew-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 07/01/2014 04:16 AM, Chen-Yu Tsai wrote:
> On Tue, Jul 1, 2014 at 5:57 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> The ba10 tvbox is an A10 based android tvbox, with 512M RAM, 8G nand flash,
>> rtl8188ctv usb wifi 1 USB-A receptacle hooked up to an EHCI/OHCI controller,
>> 1 USB-A receptacle hooked up to the OTG and 100Mbit ethernet using a
>> rtl8201 phy.
> 
> Nitpick on the subject, should be sun4i.

Right, I actually noticed that myself too, but I forgot to fix this up before
sending :|

Maxime, can you fix this up, or do you want a resend (and if resend, just this
patch or the entire set?).

Regards,

Hans
