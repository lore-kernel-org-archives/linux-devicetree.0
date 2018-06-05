From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2] arm: sun4i: Add support for Pengpod 1000 tablet
Date: Tue, 5 Jun 2018 16:50:38 +0200
Message-ID: <20180605145038.qptdlcphdbnw6jyg@flea>
References: <20180602160313.26763-1-rah@settrans.net>
 <20180604081302.hcn7j36gt6xeyquq@flea>
 <313a74ea-0be6-cff1-6b2f-06a4b0b7ba8d@settrans.net>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zazi7f7zkd74w65t"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBQGG3LMAKGQESVTVXSY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <313a74ea-0be6-cff1-6b2f-06a4b0b7ba8d-2mWpNWY8JZLk1uMJSBkQmQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Bob Ham <rah-2mWpNWY8JZLk1uMJSBkQmQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--zazi7f7zkd74w65t
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, Jun 04, 2018 at 06:33:02PM +0100, Bob Ham wrote:
> On 04/06/18 09:13, Maxime Ripard wrote:
> > On Sat, Jun 02, 2018 at 05:03:13PM +0100, Bob Ham wrote:
> 
> >> + * This file is dual-licensed: you can use it either under the terms
> >> + * of the GPL or the X11 license, at your option. Note that this dual
> >> + * licensing only applies to this file, and not this project as a
> >> + * whole.
> 
> >> + *     The above copyright notice and this permission notice shall be
> >> + *     included in all copies or substantial portions of the Software.
> 
> > And this is redundant with the SPDX header.
> 
> The X11 license notice states explicitly that the notice has to be
> included in the file.  Wouldn't removing it be a violation of the license?

The SPDX header is explicitly here to remove the license text and
create a tag that is in a indirect reference to the license text in
LICENSES. It's not going away.

> >> +		brightness-levels = <0 10 20 30 40 50 60 70 80 90 100>;
> > 
> > Each step should increase the perceived brightness by roughly 1/Nth, N
> > being the number of steps. Usually PWM backlights don't work like that.
> 
> FYI, this was copied from another .dts file.  All of the other
> brightness-levels settings in sun{4,5,7}i .dts files follow similar
> patterns:
> 
> sun4i-a10-dserve-dsrv9703c.dts:               brightness-levels = <0 10
> 20 30 40 50 60 70 80 90 100>;
> sun4i-a10-inet1.dts:          brightness-levels = <0 10 20 30 40 50 60
> 70 80 90 100>;
> sun4i-a10-pov-protab2-ips9.dts:               brightness-levels = <0 10
> 20 30 40 50 60 70 80 90 100>;
> sun5i-a13-empire-electronix-d709.dts:         brightness-levels = <0 10
> 20 30 40 50 60 70 80 90 100>;
> sun5i-a13-utoo-p66.dts:       brightness-levels = <0 30 40 50 60 70 80
> 90 100>;
> sun5i-gr8-evb.dts:            brightness-levels = <0 10 20 30 40 50 60
> 70 80 90 100>;
> sun7i-a20-wexler-tab7200.dts:         brightness-levels = <0 10 20 30 40
> 50 60 70 80 90 100>;

I never said we were perfect reviewers. Feel free to help in the process.

Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--zazi7f7zkd74w65t--
