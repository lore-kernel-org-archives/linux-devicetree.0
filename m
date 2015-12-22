From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: dts: sun5i: Add backlight node to sun5i-q8-common.dtsi
Date: Tue, 22 Dec 2015 11:21:57 +0800
Message-ID: <CAGb2v65SHwxOftyBFYD2pR3Q2QAAcFGqcNk=StdFaGdz5CZGww@mail.gmail.com>
References: <1442752251-20744-1-git-send-email-hdegoede@redhat.com>
 <1442752251-20744-6-git-send-email-hdegoede@redhat.com> <5df61312-cf32-43d4-8aba-485acf66787d@googlegroups.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB3ED4OZQKGQERSNXIGY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <5df61312-cf32-43d4-8aba-485acf66787d-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: 8001010-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Dec 19, 2015 at 6:54 PM,  <8001010-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> +             default-brightness-level = <8>;
>
>
> Why?
> Is not better 100% ?

It's just an arbitrary value. Plus having the backlight at 100% on battery
powered devices might eat up the battery quicker.

ChenYu
