From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 6/8] ARM: dts: sun9i: a80-optimus: Add
 AXP806 PMIC device node and regulators
Date: Thu, 15 Sep 2016 16:56:04 +0200
Message-ID: <20160915145604.GJ10128@lukather>
References: <20160827075544.26316-1-wens@csie.org>
 <20160827075544.26316-7-wens@csie.org>
 <CAGb2v65cQR9F1=0_9mM6guKrMhOX7TqMqfHJU5hJxUXtBZiYaw@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ucfHZChuBC0NsER/"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBBPN5K7AKGQECJSGPSY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAGb2v65cQR9F1=0_9mM6guKrMhOX7TqMqfHJU5hJxUXtBZiYaw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ucfHZChuBC0NsER/
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Thu, Sep 15, 2016 at 10:33:50PM +0800, Chen-Yu Tsai wrote:
> Hi Maxime,
> 
> On Sat, Aug 27, 2016 at 3:55 PM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> > The AXP806 PMIC is the secondary PMIC. It provides various supply
> > voltages for the SoC and other peripherals. The PMIC's interrupt
> > line is connected to NMI pin of the SoC.
> >
> > Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> 
> The driver patches have all been merged into the mfd tree. Could
> you queue up the dts patches?

I just did.

Thanks for the remainder,
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--ucfHZChuBC0NsER/--
