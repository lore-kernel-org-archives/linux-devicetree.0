From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: sun7i: dt: Enable audio codec on
 pcDuino V3 Nano
Date: Tue, 27 Oct 2015 18:56:18 +0100
Message-ID: <20151027175618.GD6114@lukather>
References: <1445639787-23715-1-git-send-email-ats@offog.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBRHVX2YQKGQEFSXRUOA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1445639787-23715-1-git-send-email-ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Adam Sampson <ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Fri, Oct 23, 2015 at 11:36:27PM +0100, Adam Sampson wrote:
> The pcDuino V3 Nano has a 3.5mm TRRS jack socket for audio, using the
> CTIA standard pinout, connected to HPOUTL, HPOUTR, HPCOM/HPCOMFB and
> MICIN1/VMIC (via appropriate RC networks) on the A20. The PH00 GPIO is
> wired for headphone plug detection: it reads 0 when nothing's plugged
> in, and 1 when a plug is inserted.
> 
> LINEINL/R and FMINL/R are not connected.

Ah, so there's a design out there with headphone detect. Cool :)

Do you feel like writing the headphone detection code?

Anyway, queued for 4.5, thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--QKdGvSO+nmPlgiQ/--
