From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 11/11] arm64: dts: add Pine64 support
Date: Thu, 11 Feb 2016 11:32:30 +0100
Message-ID: <20160211103230.GM31506@lukather>
References: <1454348370-3816-1-git-send-email-andre.przywara@arm.com>
 <1454348370-3816-12-git-send-email-andre.przywara@arm.com>
 <20160205090337.GB1139@lukather>
 <56B47391.1040709@arm.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="np6E2rbShIadjoVu"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBQOG6G2QKGQEKPYJ36Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56B47391.1040709-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--np6E2rbShIadjoVu
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi Andre,

On Fri, Feb 05, 2016 at 10:04:01AM +0000, Andre Przywara wrote:
> >> +&uart0 {
> >> +	pinctrl-names = "default";
> >> +	pinctrl-0 = <&uart0_pins_a>;
> >> +	status = "okay";
> >> +};
> >> +
> >> +&uart2 {
> >> +	pinctrl-names = "default";
> >> +	pinctrl-0 = <&uart2_pins>;
> >> +	status = "okay";
> >> +};
> >> +
> >> +&uart3 {
> >> +	pinctrl-names = "default";
> >> +	pinctrl-0 = <&uart3_pins_a>;
> >> +	status = "okay";
> >> +};
> >> +
> >> +&uart4 {
> >> +	pinctrl-names = "default";
> >> +	pinctrl-0 = <&uart4_pins>;
> >> +	status = "okay";
> >> +};
> > 
> > Our policy for boards with "open" pin headers the user can plug
> > anything he wants is that unless the pin is explicitly dedicated to
> > that usage, we simply leave them aside so that we don't enforce
> > anything.
> 
> Makes sense, I just wonder what a user is expected to do if she wants to
> use the serial ports?
> Hack the DT?
> Use U-Boot to create those nodes on the fly?
> Use overlays?
> Directly setup serial ports from userland? (thinking of this bloody
> mechanism x86 (used to?) have)

Until we have a configfs overlay interface, then yeah, we have to hack
the DT.

That's not very much different than what you'd have to do if you
wanted some other bus exposed on those pins though.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--np6E2rbShIadjoVu--
