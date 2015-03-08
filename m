From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: sun7i: dt: Add new MK808C device
Date: Sun, 8 Mar 2015 18:47:21 +0100
Message-ID: <20150308174721.GL5085@lukather>
References: <1425131004-8551-1-git-send-email-codekipper@gmail.com>
 <20150303071342.GB4713@lukather>
 <CAEKpxB=-vtjMckh3ZHoy0mezE9U1EtKzmttdXRD5ZNztZvB_ag@mail.gmail.com>
 <20150304203400.GR4911@lukather>
 <CAEKpxBnRyhD8Xiu7uTomM=z4Xm4CH8WVTYjZH73yDgYzwMqn5w@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gwtGiOGliFx8mAnm"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBIEY6KTQKGQES2DXR7A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAEKpxBnRyhD8Xiu7uTomM=z4Xm4CH8WVTYjZH73yDgYzwMqn5w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--gwtGiOGliFx8mAnm
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Sat, Mar 07, 2015 at 09:41:54AM +0100, Code Kipper wrote:
> > Don't your device has any brand on the case or the PCB?
> 
> There is nothing on the PCB to reference a manufacturer, the actual packaging
> and case are from the earlier MK808B and mention A9. There was only a
> small sticker on the side to show that the contents was a MK808C.
> I guess 'unknown' isn't a valid vendor name,

Not really.

I really don't know what's the policy to apply in such a case when we
have a device that has no identified vendor.

We need to give a vendor name, because the compatible is used to tell
two devices apart, in the case where we would have to apply quirks for
a particular devices.

And if we have two devices (say a Marvlell and an Allwinner one), with
the same name, and without any vendor, we're screwed.

Maybe falling back to the SoC vendor, in our case, would make sense?

Arnd? Rob? Mark? An opinion on this?

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--gwtGiOGliFx8mAnm--
