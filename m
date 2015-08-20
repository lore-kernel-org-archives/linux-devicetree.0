From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH 4/6] ARM: dts: sun7i: Enable USB DRC on
 pcDuino 3
Date: Thu, 20 Aug 2015 17:03:58 +0200
Message-ID: <20150820150358.GZ30520@lukather>
References: <1439563477-12295-1-git-send-email-hdegoede@redhat.com>
 <1439563477-12295-5-git-send-email-hdegoede@redhat.com>
 <20150820064545.GM30520@lukather>
 <55D58381.7040801@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R9baxdNnpTjJ7oIU"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBZ6Y26XAKGQE665EYDA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55D58381.7040801-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Jelle van der Waa <jelle-oJJ1AqDjjO4@public.gmane.org>, Ralph Willekes <benadski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--R9baxdNnpTjJ7oIU
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Thu, Aug 20, 2015 at 09:36:33AM +0200, Hans de Goede wrote:
> Hi,
> 
> On 08/20/2015 08:45 AM, Maxime Ripard wrote:
> >On Fri, Aug 14, 2015 at 04:44:35PM +0200, Hans de Goede wrote:
> >>From: Jelle van der Waa <jelle-oJJ1AqDjjO4@public.gmane.org>
> >>
> >>Enable the otg/drc usb controller on the pcDuino 3.
> >>
> >>Note this board has the otg-vbus connected directly to the 5v-dcc of
> >>the board, so there is no vbus0 regulator, nor vbus0-det.
> >
> >Can it do OTG then?
> 
> Yes.
> 
> >If VBUS is tied to the 5v, there's no way for the
> >board to shut it down when acting as peripheral, right?
> 
> Correct, the idea is to power it over otg when using it
> as a peripheral, or at least power it from a usb port of
> the machine for which it is a peripheral. Note that the
> original cubieboard (both A10 and A20 versions) have the
> same issue.

Hmmm, I see. I'll queue your patch then.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--R9baxdNnpTjJ7oIU--
