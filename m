From: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun4i: Use red1 LED for heartbeat
 indication on Marsboard A10
Date: Tue, 29 Dec 2015 16:58:19 +0300
Message-ID: <20151229165819.a4c0e978aa5ebd121113cad1@gmail.com>
References: <1451123879-7212-1-git-send-email-mamlinav@gmail.com>
	<20151227205151.GK30359@lukather>
Reply-To: mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCENVD7YAEIOHAUKWQCRUBEKMG4RW-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20151227205151.GK30359@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 27 Dec 2015 21:51:51 +0100
Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> On Sat, Dec 26, 2015 at 12:57:59PM +0300, Aleksei Mamlin wrote:
> > Marsboard A10 have four red LEDs, the first one can be used for
> > heartbeat indication.
> > 
> > Signed-off-by: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> I'm really not sure about this one.
> 
> This is something that can easily be changed through sysfs, and it
> will likely end up being a "war" on what trigger people want to use.
> 

If so, then Ok, please ignore this patch.

Is there any way to set led triggers through cmdline instead of sysfs?

>
> Hans, Chen-Yu, What's your view on this?
> 
> Thanks,
> Maxime
> 
> -- 
> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com


-- 
Thanks and regards,
Aleksei Mamlin
