From: Adam Sampson <ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Correct USB regulators on
 pcDuino v3 Nano
Date: Sat, 10 Oct 2015 13:49:45 +0100
Message-ID: <y2amvvqga6u.fsf@cartman.at.offog.org>
References: <1444441679-4802-1-git-send-email-ats@offog.org>
	<CAGb2v67_dSCL2JP1D5SDaqSF3B4KDMKZUJcZ8QLHgFtcO8Bzug@mail.gmail.com>
Reply-To: ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCQPXGGUXQGBB4MS4SYAKGQEFRVMAPY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAGb2v67_dSCL2JP1D5SDaqSF3B4KDMKZUJcZ8QLHgFtcO8Bzug-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Chen-Yu Tsai's message of "Sat, 10 Oct 2015 10:17:52 +0800")
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Siarhei Siamashka <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> writes:

> Since Siarhei spotted the issue, maybe add a Reported-by tag where credit
> is due?

Will do.

>>  &reg_ahci_5v {
>> +       pinctrl-names = "default";
[twice]
>
> This is already in sunxi-common-regulators.dtsi.
> No need to add it again.

OK -- fixed. v2 incoming.

Thanks,

-- 
Adam Sampson <ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>                         <http://offog.org/>
