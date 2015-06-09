From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH 00/20] ARM: dts: Add USB and OTG related
 nodes and enable on various boards
Date: Tue, 9 Jun 2015 22:18:29 +0200
Message-ID: <20150609201829.GA8535@lukather>
References: <1433530943-12599-1-git-send-email-hdegoede@redhat.com>
 <20150608100358.GW23777@lukather>
 <CAOMqctRDEoPiJ95EVgs_ZRQVt=SzK9NPDJGmq3JTJF1kWscmqg@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB4UU3WVQKGQEQVHOKUQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOMqctRDEoPiJ95EVgs_ZRQVt=SzK9NPDJGmq3JTJF1kWscmqg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Mon, Jun 08, 2015 at 02:56:35PM +0200, Michal Suchanek wrote:
> Hello,
> 
> On 8 June 2015 at 12:03, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > Hi Hans,
> >
> > On Fri, Jun 05, 2015 at 09:02:03PM +0200, Hans de Goede wrote:
> >> Hi Maxime,
> >>
> >> Here is a patch-set with all the otg / sun8i-usb-host related dts patches
> >> I've accumulated.
> >>
> >> These are intended for 4.3, and go hand in hand with the outstanding
> >> musb-sunxi / phy-sun4i-usb patches, which I expect to be merged as is
> >> for 4.3 .
> >
> > I'm fine with these patches. Do you have a branch somewhere that I can
> > pull (without the one that you wanted me to drop, obviously)?
> 
> Are these before the conversion to DT label syntax or after (meaning
> that the conversion patches got pulled somewhere already)?

Yes. They've been in my tree for a few monthes now, and have been in
linux-next and arm-soc for quite some time too.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--x+6KMIRAuhnl3hBn--
