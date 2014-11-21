From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 5/9] rc: sunxi-cir: Add support for the
 larger fifo found on sun5i and sun6i
Date: Fri, 21 Nov 2014 10:59:35 +0100
Message-ID: <20141121095934.GA4752@lukather>
References: <1416498928-1300-1-git-send-email-hdegoede@redhat.com>
 <1416498928-1300-6-git-send-email-hdegoede@redhat.com>
 <20141120142856.16b6562d@recife.lan>
 <20141121082620.GJ24143@lukather>
 <546EFAE1.9050506@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBJ42XSRQKGQED5NNHAA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <546EFAE1.9050506-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Fri, Nov 21, 2014 at 09:42:09AM +0100, Hans de Goede wrote:
> Hi,
> 
> On 11/21/2014 09:26 AM, Maxime Ripard wrote:
> > Hi Mauro,
> > 
> > On Thu, Nov 20, 2014 at 02:28:56PM -0200, Mauro Carvalho Chehab wrote:
> >> Em Thu, 20 Nov 2014 16:55:24 +0100
> >> Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> escreveu:
> >>
> >>> Add support for the larger fifo found on sun5i and sun6i, having a separate
> >>> compatible for the ir found on sun5i & sun6i also is useful if we ever want
> >>> to add ir transmit support, because the sun5i & sun6i version do not have
> >>> transmit support.
> >>>
> >>> Note this commits also adds checking for the end-of-packet interrupt flag
> >>> (which was already enabled), as the fifo-data-available interrupt flag only
> >>> gets set when the trigger-level is exceeded. So far we've been getting away
> >>> with not doing this because of the low trigger-level, but this is something
> >>> which we should have done since day one.
> >>>
> >>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >>
> >> As this is meant to be merged via some other tree:
> >>
> >> Acked-by: Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> > 
> > I think merging it through your tree would be just fine.
> > 
> > Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> 
> Heh, I was thinking it would be best if it went through Maxime's tree because
> it also has some deps on new clk stuff (well the dts have deps on that), but either
> way works for me.
> 
> Maxime if you want this go through Mauro's tree, I can send a pull-req to Mauro
> (I'm a linux-media sub-maintainer), so if that is the case let me know and I'll
> prepare a pull-req (after fixing the missing reset documentation in the bindings).

So much for not reading the cover letter... Sorry.

We're getting quite close to the end of the ARM merge window, and I
got a couple comments, Lee hasn't commented yet, so I'd say it's a bit
too late for this to come in.

If Mauro is happy with the current patches for him, it's completely
fine to merge it through his tree. The DTS can wait.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--x+6KMIRAuhnl3hBn--
