From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] Revert "ARM: dts: sun8i: Add new
 sun8i-a33-q8-tzx-723q4.dts file"
Date: Fri, 25 Sep 2015 08:42:58 +0200
Message-ID: <20150925064258.GA4684@lukather>
References: <1443108234-14837-1-git-send-email-hdegoede@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TguDem35cI6GfxJY"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB46ZSOYAKGQEZQB6ORI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1443108234-14837-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jelle van der Waa <jelle-oJJ1AqDjjO4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--TguDem35cI6GfxJY
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Thu, Sep 24, 2015 at 05:23:52PM +0200, Hans de Goede wrote:
> The tzx-723q[a]4 board variant of A33 based Q8 formfactor tablets was
> given its own dts file because the mmc would not work with a drive
> strength of 30mA, Android seemed to be using a lower drive-strength
> and doing the same with the upstream kernel seemed to fix this issue.
> 
> While working on a similar fix for u-boot I noticed that Android did
> not use a lower drive strength for mmc0, but for mmc1, so mmc0 should
> work fine with a drive strength of 30mA.
> 
> Further investigation has shown that Allwinner is using slightly
> tweaked clock sample phase settings in newer Android kernels, and
> that updating the mainstream sunxi mmc driver to these settings fixes
> this.
> 
> With this fixed we no longer need a dts file specifically for these
> pcb varants -> drop this dts file.

I dropped the patch.

> This reverts commit fb61c559a810f1487892b83d2d0606af1d020318.

Checkpatch prints an error about this one. Make sure you have the
right commit format.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--TguDem35cI6GfxJY--
