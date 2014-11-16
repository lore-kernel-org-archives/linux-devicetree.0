From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] clk: sunxi: gmac-tx-clk mux is not a
 CLK_MUX_INDEX_BIT mux
Date: Sun, 16 Nov 2014 18:13:52 +0100
Message-ID: <20141116171352.GO6414@lukather>
References: <1416142617-4094-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+cfQkLQGU7KOA/8T"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBF5XUORQKGQEKGBTT7I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1416142617-4094-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--+cfQkLQGU7KOA/8T
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sun, Nov 16, 2014 at 01:56:57PM +0100, Hans de Goede wrote:
> A CLK_MUX_INDEX_BIT mux has one bit per parent, but the sun7i-a20-gmac-clk
> has 2 bits selecting between 3 possible parents using values of 0, 1, 2,
> which makes it a regular mux which should not have CLK_MUX_INDEX_BIT set in
> its flag.
> 
> However we do not support parent 1 (an external clock), so use a table to
> select parent 0 or 2, which are the 2 parents we support.
> 
> Note this has not been causing any issues sofar, because we start with a
> parent setting of parent 0, and only ever re-parent to parent 2 (for which
> we use an index of 1 as we skip parent 1) and with CLK_MUX_INDEX_BIT set
> we write a value of 2 for index 1.
> 
> Tested on both a cubietruck (which uses rgmii mode) as well as a cs908
> (an a31s board which uses mii mode).
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied, thanks.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--+cfQkLQGU7KOA/8T--
