From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/7] ARM: dts: sun5i: Stop using different
 compatibles for ehci/ohci on a13 vs a10s
Date: Sun, 8 Mar 2015 18:19:24 +0100
Message-ID: <20150308171924.GC5085@lukather>
References: <1425754884-7875-1-git-send-email-hdegoede@redhat.com>
 <1425754884-7875-2-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="raC6veAxrt5nqIoY"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBZUR6KTQKGQE644SD3I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425754884-7875-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--raC6veAxrt5nqIoY
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sat, Mar 07, 2015 at 08:01:19PM +0100, Hans de Goede wrote:
> The A13 and the A10s use the same die (this has been confirmed by Allwinner),
> as such there is no need to differentiate between the ehci/ohci parts of both,
> the only reasons there were different allwinner,sun5i-a*-foo compatible
> between these 2 parts is costemetically and because we could when we still
> had 2 completely different dtsi files.
> 
> The allwinner,sun5i-a*-foo compatible strings are not used for binding at all,
> the actual driver binds to the generic-?hci compatible, so we can safely remove
> this cosmetical difference and simplify the dtsi files.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Appplied, thanks!

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--raC6veAxrt5nqIoY--
