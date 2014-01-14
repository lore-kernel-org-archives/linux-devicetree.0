From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: ARM: mvebu: dt: add missing alias 'eth3' on Armada XP mv78260
Date: Mon, 13 Jan 2014 19:53:00 -0500
Message-ID: <20140114005300.GJ19878@titan.lakedaemon.net>
References: <20140112120924.GA1916@1wt.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140112120924.GA1916-K+wRfnb2/UA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Willy Tarreau <w@1wt.eu>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 12, 2014 at 01:09:24PM +0100, Willy Tarreau wrote:
> It was correctly set on mv78460 but not on mv78260, resulting in my
> OpenBlocks AX3-4 retrieving only 3 of its 4 MAC addresses from the
> boot loader.
> 
> Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Cc: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Signed-off-by: Willy Tarreau <w@1wt.eu>
> ---
>  arch/arm/boot/dts/armada-xp-mv78260.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to mvebu/dt-fixes

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
