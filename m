From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 12/12] ARM: dts: sun6i: hummingbird:
 Enable the onboard WiFi module
Date: Wed, 11 Mar 2015 09:52:25 +0100
Message-ID: <20150311085225.GK5085@lukather>
References: <1425988764-23618-1-git-send-email-wens@csie.org>
 <1425988764-23618-14-git-send-email-wens@csie.org>
 <20150310213218.GH5085@lukather>
 <CAGb2v66zJcBBpLZFjNyugjRzt8SppQ0VbFD+pMqVYdK4EKg-fQ@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+/c+wG9PuVDVAlsu"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB4MFQCUAKGQE5KDJQEA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v66zJcBBpLZFjNyugjRzt8SppQ0VbFD+pMqVYdK4EKg-fQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--+/c+wG9PuVDVAlsu
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Wed, Mar 11, 2015 at 11:11:49AM +0800, Chen-Yu Tsai wrote:
> On Wed, Mar 11, 2015 at 5:32 AM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > On Tue, Mar 10, 2015 at 07:59:24PM +0800, Chen-Yu Tsai wrote:
> >> The Hummingbird A31 has an AMPAK AP6210 WiFi+Bluetooth module. The
> >> WiFi part is a BCM43362 IC connected to MMC1 in the A31 SoC via SDIO.
> >> The IC also takes a power enable signal via GPIO. This is supported
> >> with the new power sequencing bindings.
> >>
> >> The WiFi module supports out-of-band interrupt signaling via GPIO,
> >> but this is buggy and not enabled yet.
> >>
> >> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> >
> > There's two almost identical patches 12/12. Which one am I suppose to
> > apply?
> 
> This one is the right one. I forgot to clear the patches after changing
> the description. The "buggy" part in the description is probably not
> needed. Hans explained that the SD resets have nothing to do with
> interrupt handling.

Just to be clear, you want the last sentence to be:

The WiFi module supports out-of-band interrupt signaling via GPIO, but
this is not enabled yet.

Right?

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--+/c+wG9PuVDVAlsu--
