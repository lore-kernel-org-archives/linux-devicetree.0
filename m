From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/9] clk: sunxi: Add prcm mod0 clock driver
Date: Thu, 27 Nov 2014 17:40:56 +0100
Message-ID: <20141127174056.6697cde3@bbrezillon>
References: <54743DE1.7020704@redhat.com>
	<20141126211318.GN25249@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCIPJ6FA2QLBB4NJ3WRQKGQECVMX55A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20141126211318.GN25249@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Boris Brezillon <boris-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, 26 Nov 2014 22:13:18 +0100
Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

[...]

> 
> I remember someone (Chen-Yu? Boris?) saying that the 1wire clock was
> not really a mod0 clk. From what I could gather from the source code,
> it seems to have a wider m divider, so we could argue that it should
> need a new compatible.

Wasn't me :-).

Regarding the rest of the discussion I miss some context, but here's
what I remember decided us to choose the MFD approach for the PRCM
block:

1) it's embedding several unrelated functional blocks (reset, clk, and
some other things I don't remember).
2) none of the functionalities provided by the PRCM were required in
the early boot stage
3) We wanted to represent the HW blocks as they are really described in
the memory mapping instead of splitting small register chunks over the
DT.

Can someone sum-up the current issue you're trying to solve ?

IMHO, if you really want to split those functionalities over the DT
(some nodes under clks and other under reset controller), then I
suggest to use..............
(Maxime, please stop smiling :P)
..............

SYSCON

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
