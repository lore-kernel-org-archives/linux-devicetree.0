From: Pascal Roeleven <dev-/1Tg0gxlrOS4ObxHbWkkimZHpeb/A1Y/@public.gmane.org>
Subject: Re: Re: [PATCH] ARM: dts: sun4i: Fix incorrect clocks
 for displays
Date: Mon, 23 Apr 2018 13:01:03 +0200
Message-ID: <887c9144972ab75a4520141a17e1607b@pascalroeleven.nl>
References: <20180420102112.2843-1-dev@pascalroeleven.nl>
 <20180423071421.byupsz4gxpmhfe44@flea>
Reply-To: dev-/1Tg0gxlrOS4ObxHbWkkimZHpeb/A1Y/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Return-path: <linux-sunxi+bncBDVPTC5KRECBBEX263LAKGQE2KNZMOY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180423071421.byupsz4gxpmhfe44@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2018-04-23 09:14, Maxime Ripard wrote:
> On Fri, Apr 20, 2018 at 12:21:12PM +0200, Pascal Roeleven wrote:
>> Some displays on SUN4i devices wouldn't properly stay on unless
>> 'clk_ignore_unused' is used.
>> 
>> Change the duplicate clocks to the probably intended ones.
>> 
>> Signed-off-by: Pascal Roeleven <dev-/1Tg0gxlrOS4ObxHbWkkimZHpeb/A1Y/@public.gmane.org>
> 
> What was the difference with the first patch you sent?
> 
> Anyway, I've applied it, thanks
> 
> Maxime
> 
> --
> Maxime Ripard, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com

I'm sorry there isn't any.
It's the first patch I have ever send so had some git-send-email issues 
and
didn't know the correct procedure to resend a patch.
