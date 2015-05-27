From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/3] phy-sun4i-usb: Add a sunxi specific
 function for setting squelch-detect
Date: Wed, 27 May 2015 17:39:40 +0530
Message-ID: <5565B404.1050003@ti.com>
References: <1427626248-6257-1-git-send-email-hdegoede@redhat.com> <1427626248-6257-2-git-send-email-hdegoede@redhat.com> <20150526153816.GK26599@saruman.tx.rr.com>
Reply-To: kishon-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBCOOP4VF5IDRBEXIS2VQKGQESWFTGNA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150526153816.GK26599-HgARHv6XitJaoMGHk7MhZQC/G2K4zDHf@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: balbi-l0cyMroinI0@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Felipe,

On Tuesday 26 May 2015 09:08 PM, Felipe Balbi wrote:
> On Sun, Mar 29, 2015 at 12:50:46PM +0200, Hans de Goede wrote:
>> The sunxi otg phy has a bug where it wrongly detects a high speed squelch
>> when reset on the root port gets de-asserted with a lo-speed device.
>>
>> The workaround for this is to disable squelch detect before de-asserting
>> reset, and re-enabling it after the reset de-assert is done. Add a sunxi
>> specific phy function to allow the sunxi-musb glue to do this.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>
> Kishon, do you want to take this patch?

This patch should go along with the other patch in the series. So I think it's 
better you take this series along with the musb sunxi patch series.

Acked-by: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>

Thanks
Kishon
