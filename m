From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sun7i: Correct USB regulators
 on pcDuino v3 Nano
Date: Sun, 11 Oct 2015 19:27:43 +0200
Message-ID: <20151011172743.GW2278@lukather>
References: <1444481572-13617-1-git-send-email-ats@offog.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p609JBPwWeYlfsbE"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBEFY5KYAKGQEG6EF73A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444481572-13617-1-git-send-email-ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Adam Sampson <ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Siarhei Siamashka <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--p609JBPwWeYlfsbE
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sat, Oct 10, 2015 at 01:52:52PM +0100, Adam Sampson wrote:
> The LinkSprite pcDuino v3 Nano's two USB host ports are powered by a
> single RT9701GB regulator, which has its enable input tied to the A20's
> PD2 pin, pulled up to 3v3 via a 10k resistor.
> 
> However, the script.bin that shipped with the device listed PH11 and PH3
> as Vbus control pins for the two USB ports. Neither of these are
> actually connected to anything.
> 
> Siarhei Siamashka spotted this problem while reviewing the other
> LinkSprite boards. This patch fixes it by only defining a single
> regulator, controlled by PD2. Testing shows that the USB ports are now
> (correctly) only powered up once the USB PHY driver is loaded.
> 
> Reported-by: Siarhei Siamashka <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Adam Sampson <ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>

Applied, thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--p609JBPwWeYlfsbE--
