From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: sun7i: dt: Add new MK808C device
Date: Mon, 9 Mar 2015 15:50:44 +0100
Message-ID: <20150309145044.GS5085@lukather>
References: <1425131004-8551-1-git-send-email-codekipper@gmail.com>
 <CAEKpxBnRyhD8Xiu7uTomM=z4Xm4CH8WVTYjZH73yDgYzwMqn5w@mail.gmail.com>
 <20150308174721.GL5085@lukather>
 <9483321.y7yrfWRaG5@wuerfel>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PkEWctFf+8E2rcii"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBVPJ62TQKGQEKWIW5OY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9483321.y7yrfWRaG5@wuerfel>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--PkEWctFf+8E2rcii
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sun, Mar 08, 2015 at 10:18:30PM +0100, Arnd Bergmann wrote:
> On Sunday 08 March 2015 18:47:21 Maxime Ripard wrote:
> > 
> > Not enough information to check signature validity.	Show Details
> > Hi,
> > 
> > On Sat, Mar 07, 2015 at 09:41:54AM +0100, Code Kipper wrote:
> > > > Don't your device has any brand on the case or the PCB?
> > > 
> > > There is nothing on the PCB to reference a manufacturer, the actual packaging
> > > and case are from the earlier MK808B and mention A9. There was only a
> > > small sticker on the side to show that the contents was a MK808C.
> > > I guess 'unknown' isn't a valid vendor name,
> > 
> > Not really.
> > 
> > I really don't know what's the policy to apply in such a case when we
> > have a device that has no identified vendor.
> > 
> > We need to give a vendor name, because the compatible is used to tell
> > two devices apart, in the case where we would have to apply quirks for
> > a particular devices.
> > 
> > And if we have two devices (say a Marvlell and an Allwinner one), with
> > the same name, and without any vendor, we're screwed.
> > 
> > Maybe falling back to the SoC vendor, in our case, would make sense?
> > 
> > Arnd? Rob? Mark? An opinion on this?
> > 
> 
> I don't really have a good idea. In this case the SoC vendor might
> not be the worst choice, because it's likely to be very close to
> some reference design they actually did.
> 
> Another possibility would be to use a string that refers to the
> organization that does the upstream kernel support, but that's
> harder for individuals that do not work for a company that wants
> its name used that way.

Yeah, I don't really think that would be applicable for individuals,
and would understand if people wouldn't like to follow such policy
(I'm not even sure I would).

At least, the SoC vendor name would be consistent, without being very
touchy.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--PkEWctFf+8E2rcii--
