From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 0/6] ARM: sunxi: Add basic support for
 Allwinner A80 SoC
Date: Wed, 24 Sep 2014 18:40:42 +0800
Message-ID: <CAGb2v659fps1WAqkdnbnTtHxAdCZQy+rYXDC90Y44pPtcxnsFg@mail.gmail.com>
References: <1411311493-24344-1-git-send-email-wens@csie.org> <20140924064124.GS15315@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBPV7RKQQKGQE47G7CJY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20140924064124.GS15315@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, Meng Zhang <kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, ctl <ctl-HcjymKqD97rQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Sep 24, 2014 at 2:41 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hi Chen-Yu,
>
> On Sun, Sep 21, 2014 at 10:58:07PM +0800, Chen-Yu Tsai wrote:
>> Hi everyone,
>>
>> This patch series adds very basic support for Allwinner's A80 SoC,
>> a big.LITTLE architecture with 4 Cortex-A7s and 4 Cortex-A15s.
>>
>> Development is done on the A80 Optimus Board, the defacto development
>> board for the A80, with the accompanying SDK as a reference.
>>
>> So far I've been unable to get the board to boot from MMC, or
>> using Android fastboot. I'm using Allwinner's FEL mode to load
>> the bootloader and kernel+dtb image over USB. Notes on my attempts
>> can be found here: http://linux-sunxi.org/User:Wens#A80_Optimus
>
> It looks very nice, thanks a lot. You'll find a minor comments inline.
>
> One thing I forgot to ask you about when doing the A23, and that would
> nice to do is to update the documentation we have in
> Documentation/arm/sunxi/README with the A23 and A80 infos you've been
> able to gather.

I'll add the A80 datasheet in v2, and do a separate series for A23, A31,
and A31s docs.


Thanks
ChenYu
