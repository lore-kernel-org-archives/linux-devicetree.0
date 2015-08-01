From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH 5/5] ARM: dts: sun7i: Add dts file for
 Wits Pro A20 DKT
Date: Sat, 1 Aug 2015 11:30:46 +0200
Message-ID: <20150801093046.GX2564@lukather>
References: <1438333194-21181-1-git-send-email-hdegoede@redhat.com>
 <1438333194-21181-6-git-send-email-hdegoede@redhat.com>
 <20150731102028.GE2564@lukather>
 <CAGb2v65TEogqYFAfen1VnOaiepvez5t8Oh+Q=OYsRS_aZUMO3A@mail.gmail.com>
 <55BB9E92.30604@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZftE6qNd6z54C6+r"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB27Q6OWQKGQES3AMJCA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55BB9E92.30604-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Jelle de Jong <jelledejong-OIcJOM8/mISwoUgIn9SVlA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--ZftE6qNd6z54C6+r
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Fri, Jul 31, 2015 at 06:13:06PM +0200, Hans de Goede wrote:
> mmc-pwrseq-simple supports multiple reset/enable gpios (by listing
> them all as reset-gpios and setting GPIO_ACTIVE_LOW/HIGH depending
> on which value they need to be to activate things).
> 
> It also supports listing clocks which need to be enabled. I think
> that it may be a good idea to use this to also enable the bluetooth
> bits of the ap6210 module on the cubietruck. I know that the
> actual bt is interfaced over an uart, and we really should have
> a mechanism to enable/disable it separately, but for not this seems
> like a good way to get bluetooth to work.
> 
> We should ofcourse add a comment to the dts file that this is not a
> 100% ideal solution, but other then that I think this should work
> nicely. Maxime would enabling the bluetooth bits of this sdio
> module via mmc-pwrseq be acceptable to you?

As long as we have some comment on top, yep.

> ChenYu if Maxime acks this solution I hope you can write a patch for
> this, since you've been working on the bluetooth support before.

Note that I'm in holidays starting today. I plan on doing my
pull-requests for 4.3 later today, and will probably not be able to
merge any patches during the next two weeks, which mean that your
mmc-power seq patch for the cubietruck was probably the last one I was
merging for the 4.3 merge window.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--ZftE6qNd6z54C6+r--
