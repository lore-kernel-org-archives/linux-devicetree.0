From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v6 3/6] regulator: axp20x: prepare support
 for multiple AXP chip families
Date: Thu, 9 Apr 2015 13:30:25 -0700
Message-ID: <CAGb2v66B-__CRcoyoiebNUs-=UBWxP4kQBGVpO4R_FMUSh7MKw@mail.gmail.com>
References: <1427868203-7486-1-git-send-email-wens@csie.org>
 <1427868203-7486-4-git-send-email-wens@csie.org> <CAGb2v66zbATMHY5SgZLs3RCoRETroSh5nC3h4TXRLm5UAbythw@mail.gmail.com>
 <20150409195502.GC6023@sirena.org.uk>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB7OCTOUQKGQEW4BS54A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150409195502.GC6023-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 9, 2015 at 12:55 PM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Apr 09, 2015 at 10:23:41AM -0700, Chen-Yu Tsai wrote:
>
>> Are you OK with Lee taking the 2 regulator patches through his tree?
>> I realize I'm asking this way too late for this merge window.
>
> Someone would need to resend them to me as I've deleted them and it
> appears that this is a part of a series - are you sure there are no
> dependencies?

The 2 patches only touch drivers/regulator/axp20x-regulator.c.
Unless someone else is doing cleanup on them (AFAIK no one has),
there should be no problem.

In any case, I will resend them after 4.1-rc1 if they aren't merged
by then.

ChenYu
