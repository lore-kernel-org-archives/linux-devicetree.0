From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 14/30] dt-bindings: update the Allwinner
 GPADC device tree binding for H3 & A83T
Date: Tue, 11 Sep 2018 11:12:32 +0200
Message-ID: <20180911091232.2ozypemfam5kayef@flea>
References: <20180830154518.29507-1-embed3d@gmail.com>
 <20180830154518.29507-15-embed3d@gmail.com>
 <20180831084854.q2uh63pw5vprqlzt@flea>
 <20180910194424.GA21461@bogus>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ttcwp2nzxxraldfm"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBDEO33OAKGQE44S74GY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180910194424.GA21461@bogus>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, quentin.schulz-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnaud.pouliquen-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ttcwp2nzxxraldfm
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, Sep 10, 2018 at 02:44:24PM -0500, Rob Herring wrote:
> On Fri, Aug 31, 2018 at 10:48:54AM +0200, Maxime Ripard wrote:
> > On Thu, Aug 30, 2018 at 05:45:02PM +0200, Philipp Rossak wrote:
> > > Allwinner H3 features a thermal sensor like the one in A33, but has its
> > > register re-arranged, the clock divider moved to CCU (originally the
> > > clock divider is in ADC) and added a pair of bus clock and reset.
> > > 
> > > Allwinner A83T features a thermal sensor similar to the H3, the ths clock,
> > > the bus clock and the reset was removed from the CCU. The THS in A83T
> > > has a clock that is directly connected and runs with 24 MHz.
> > > 
> > > Update the binding document to cover H3 and A83T.
> > > 
> > > Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > 
> > You probably want to have a look at:
> > https://www.spinics.net/lists/arm-kernel/msg670167.html
> 
> Well, which is it? An ADC or thermal sensor?

It's both actually. This IP used to be called GPADC, and had a thermal
sensor + some ADC channels. The design evolved across several
generations of SoCs to drop the ADC channels and be used only to have
thermal sensors.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--ttcwp2nzxxraldfm--
