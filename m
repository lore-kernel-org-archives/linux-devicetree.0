From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 00/13] musb: Add support for the
 Allwinner sunxi musb controller
Date: Mon, 23 Mar 2015 09:49:16 -0700
Message-ID: <20150323164916.GA15676@lukather>
References: <1426878682-14521-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBSUWYGUAKGQEFFADLKI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1426878682-14521-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi Hans,

On Fri, Mar 20, 2015 at 08:11:09PM +0100, Hans de Goede wrote:
> Hi All,
> 
> Here is v2 of my patch-set to add support for the musb variant found on
> Allwinner sunxi SoCs.
> 
> Changes since the original posting:
> -Removed the sunxi specific phy functions, instead the id / vbus gpio polling
>  has been moved to the phy-sun4i-usb driver and their status is exported
>  through extcon for the sunxi-musb glue
> -Stop using syscon, instead Maxime Ripard's sunxi SRAM controller driver is now
>  used
> 
> This should address all review remarks against v1 of this patch-set, so
> hopefully we can start merging this upstream.
> 
> The "musb: Add support for the Allwinner sunxi musb" commit relies on
> Maxime's SRAM controller patches, so those need to get merged first,
> but the phy-sun4i-usb and musb preparation patches can be merged already
> (assuming there are no objections).
> 
> And then once the SRAM controller patches are in next we can also merge
> the "musb: Add support for the Allwinner sunxi musb" commit and the dts
> changes.

All the DT bits look fine to me. I'll wait for Felipe and Kishon
comments before merging those.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--nFreZHaLTZJo0R7j--
