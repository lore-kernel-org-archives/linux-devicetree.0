From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: Re: [PATCH 0/2] ARM: sunxi: Enable syscon for the
 system controller
Date: Tue, 6 May 2014 10:42:11 +0200
Message-ID: <CAOQ7t2aAUESX5X6n2PLKfctzNEqjDEbncDHZZL+Ew_29s1WM+g@mail.gmail.com>
References: <1399212160-26934-1-git-send-email-carlo@caione.org>
	<20140505225517.GE9464@lukather>
	<CAGb2v66JBM_Rv8ie=7iuTPrXGPJECTeevnf9LLXNS=FSYs1+Tg@mail.gmail.com>
	<CAOQ7t2akOEr7o4Q5ze5QPr_RHj6MWmA-u5NTuq2q1epy2LBr8w@mail.gmail.com>
	<CAGb2v64nm2i+XivDO8drHSkUUJvGr_=HaWMB26rbytVZAdTQFw@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDWJTUUC5UCBBZGAUKNQKGQE7ZLN4CY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v64nm2i+XivDO8drHSkUUJvGr_=HaWMB26rbytVZAdTQFw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: wens Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 6, 2014 at 10:27 AM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:

<snip>

> I came to the same conclusion, though I somehow forgot to update my tree
> on github. Here it is:
>
>   https://github.com/wens/linux/tree/wip/sunxi-musb
>
> This also has the bit definitions:
>
>   https://github.com/wens/linux/commit/3db9c184df5e5b3e1ddef59926e88fc2d03b4de9

Oh, I missed that wip branch. I'll add your SoB also and I'll add the
bit definitions in v2 (if Maxime ACKs it)

> Beware musb in my tree doesn't work. I was focused on getting the phy driver
> and port controller correct.

No prob, still scouting around :)

Thanks,

-- 
Carlo Caione
