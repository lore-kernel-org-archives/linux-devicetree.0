From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH 2/3] ARM: dts: axp152: Add a dtsi file
 for the axp152 pmic
Date: Thu, 9 Jul 2015 10:10:39 +0200
Message-ID: <20150709081039.GQ28632@lukather>
References: <1435088503-20776-1-git-send-email-hdegoede@redhat.com>
 <1435088503-20776-3-git-send-email-hdegoede@redhat.com>
 <20150625174027.GF2266@lukather>
 <558D0BC2.10004@redhat.com>
 <20150706085713.GE3269@lukather>
 <559A70B6.3010101@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b9dEYEwnDXkv9lSy"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBB637CWAKGQEW42V6IY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <559A70B6.3010101-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--b9dEYEwnDXkv9lSy
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Mon, Jul 06, 2015 at 02:12:38PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 06-07-15 10:57, Maxime Ripard wrote:
> >Hi,
> >
> >On Fri, Jun 26, 2015 at 10:22:26AM +0200, Hans de Goede wrote:
> >>Hi,
> >>
> >>On 25-06-15 19:40, Maxime Ripard wrote:
> >>>Hi,
> >>>
> >>>On Tue, Jun 23, 2015 at 09:41:42PM +0200, Hans de Goede wrote:
> >>>>From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>>>
> >>>>Add a dtsi file for the axp152 pmic, this mirrors the way things are
> >>>>handled for the axp202 pmic.
> >>>>
> >>>>Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >>>>---
> >>>>  arch/arm/boot/dts/axp152.dtsi | 49 +++++++++++++++++++++++++++++++++++++++++++
> >>>>  1 file changed, 49 insertions(+)
> >>>>  create mode 100644 arch/arm/boot/dts/axp152.dtsi
> >>>
> >>>Unfortunately, Mark expressed clearly that he didn't want such files.
> >>
> >>That is not how I remember the discussion, he said that he did not consider
> >>them useful, we explained why we do consider them useful for the sunxi
> >>case and then things went quiet.
> >>
> >>And we do already have an axp209.dtsi, and I find having that useful
> >>for enabling the regulators on axp209 using boards.
> >
> >Hmmm, reading this discussion again, it indeed looks like I
> >misremembered what he was saying.
> >
> >>Ultimately it is your call, but I really think we should be consistent
> >>and add an axp152.dtsi to mirror how we do things with the axp209.
> >
> >Was there any other comments on this serie (and are you going to send
> >a v2?) or should I apply this patch?
> 
> There were some comments on the actual mfd bits of this series, and
> I will send a v2 for that sometime this week. The dts patches however
> are good to go, so please apply this one.

Applied 2 and 3 then. Thanks!

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--b9dEYEwnDXkv9lSy--
