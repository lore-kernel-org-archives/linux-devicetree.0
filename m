From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sunxi: Add regulators for
 LeMaker BananaPi
Date: Tue, 18 Aug 2015 17:32:08 +0200
Message-ID: <20150818153208.GF2547@lukather>
References: <1438532305-5884-1-git-send-email-public_timo.s@silentcreek.de>
 <20150803094723.GD2564@lukather>
 <20150804090224.4B5676C83963@dd34104.kasserver.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bqc0IY4JZZt50bUr"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB6U7ZWXAKGQELO4QECI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150804090224.4B5676C83963-RzmsueL7+k6AvxNu/8lEInnhMCiq3JZZ@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Timo Sigurdsson <public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Bqc0IY4JZZt50bUr
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Tue, Aug 04, 2015 at 11:02:24AM +0200, Timo Sigurdsson wrote:
> Hi Maxime,
> 
> Maxime Ripard schrieb am 03.08.2015 11:47:
> > What regulator provides the 3.3V regulator used in the rest of this DT
> > then (MMC, GMAC) ?
> 
> For GMAC, there is a reg_gmac_3v3 defined in sun7i-a20-bananapi.dts [1].
> MMC uses reg_vcc3v3 included from sunxi-common-regulators.dtsi. Am I
> missing something? Is this not sufficient?

Well, this 3.3v regulator doesn't appear out of nowhere. Most likely,
it's either one of the AXP output, or a regulator directly taking the
5v output of the DC plug.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--Bqc0IY4JZZt50bUr--
