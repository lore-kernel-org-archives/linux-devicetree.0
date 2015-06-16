From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 00/20] ARM: dts: Add USB and OTG related
 nodes and enable on various boards
Date: Tue, 16 Jun 2015 11:35:39 +0200
Message-ID: <20150616093539.GE11732@lukather>
References: <1433530943-12599-1-git-send-email-hdegoede@redhat.com>
 <20150608100358.GW23777@lukather>
 <55783B2C.3080207@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oXNgvKVxGWJ0RPMJ"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB5G576VQKGQE6MQTAJY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55783B2C.3080207-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--oXNgvKVxGWJ0RPMJ
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Wed, Jun 10, 2015 at 03:27:08PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 08-06-15 12:03, Maxime Ripard wrote:
> >Hi Hans,
> >
> >On Fri, Jun 05, 2015 at 09:02:03PM +0200, Hans de Goede wrote:
> >>Hi Maxime,
> >>
> >>Here is a patch-set with all the otg / sun8i-usb-host related dts patches
> >>I've accumulated.
> >>
> >>These are intended for 4.3, and go hand in hand with the outstanding
> >>musb-sunxi / phy-sun4i-usb patches, which I expect to be merged as is
> >>for 4.3 .
> >
> >I'm fine with these patches. Do you have a branch somewhere that I can
> >pull (without the one that you wanted me to drop, obviously)?
> 
> I've just created a branch with just these patches directly on top
> of sunxi/for-next for you:
> 
> https://github.com/jwrdegoede/linux-sunxi/commits/otg-dts-for-maxime

Queued for 4.3, thanks!

> 
> While preparing this branch I noticed that the dts for
> the ippo q8h a33 tablets is not yet merged:
> 
> http://www.spinics.net/lists/devicetree/msg82149.html
> 
> You suggested to use the DT quirks interface instead of creating
> a separate dts for each board variant, and in the end I agreed,
> and asked you to merge it renamed to a more generic name
> without the lcd1024x600 bit in there.
> 
> I can make it more generic and resend it myself. Do you want me
> to squash in the otg changes when I resend it, or shall I keep
> those separate ?

Sorry for being so late on that, let's discuss this in the other
thread.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--oXNgvKVxGWJ0RPMJ--
