From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 8/8] ARM: dts: sun7i: Add ethernet alias
 for GMAC
Date: Wed, 5 Feb 2014 12:43:18 +0800
Message-ID: <CAGb2v659T_QTLChB0NRS0seQvwDBCmTAH6UBEghZng9Ac6uL4g@mail.gmail.com>
References: <1391398346-5094-1-git-send-email-wens@csie.org>
 <1391398346-5094-9-git-send-email-wens@csie.org> <20140203193802.GE25625@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCMILY6JWQBBB6UCY6LQKGQECVZZM7A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20140203193802.GE25625@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 4, 2014 at 3:38 AM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Mon, Feb 03, 2014 at 11:32:26AM +0800, Chen-Yu Tsai wrote:
>> U-Boot will insert MAC address into the device tree image.
>> It looks up ethernet[0-5] aliases to find the ethernet nodes.
>> Alias GMAC as ethernet0, as it is the only ethernet controller used.
>>
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sun7i-a20.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
>> index 65fb8d0..c48fb11 100644
>> --- a/arch/arm/boot/dts/sun7i-a20.dtsi
>> +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
>> @@ -17,7 +17,7 @@
>>       interrupt-parent = <&gic>;
>>
>>       aliases {
>> -             ethernet0 = &emac;
>> +             ethernet0 = &gmac;
>>       };
>
> I'm not very fond of this patch.
>
> People might rely on the fact that ethernet0 is actually the emac, and
> are expecting u-boot to fill the ethaddr variable to the emac, and not
> the gmac.
>
> Since u-boot is totally able to deal with several ethernet addresses,
> please add it as ethernet1.

Actually I think we should override this in the board dts.
The boards we currently support can only use emac or gmac,
and in our u-boot tree, they have been converted to using
gmac. If any future boards support both emac and gmac, we
can address the ordering then. And the ordering should
match u-boot.

What do you think?


Cheers
ChenYu
