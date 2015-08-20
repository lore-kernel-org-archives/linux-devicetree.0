From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/6] ARM: dts: sun7i: Enable USB DRC on
 pcDuino 3
Date: Thu, 20 Aug 2015 08:45:45 +0200
Message-ID: <20150820064545.GM30520@lukather>
References: <1439563477-12295-1-git-send-email-hdegoede@redhat.com>
 <1439563477-12295-5-git-send-email-hdegoede@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EOHJn1TVIJfeVXv2"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBGXP2WXAKGQEY2PSDYQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1439563477-12295-5-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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

--EOHJn1TVIJfeVXv2
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Fri, Aug 14, 2015 at 04:44:35PM +0200, Hans de Goede wrote:
> From: Jelle van der Waa <jelle-oJJ1AqDjjO4@public.gmane.org>
> 
> Enable the otg/drc usb controller on the pcDuino 3.
> 
> Note this board has the otg-vbus connected directly to the 5v-dcc of
> the board, so there is no vbus0 regulator, nor vbus0-det.

Can it do OTG then? If VBUS is tied to the 5v, there's no way for the
board to shut it down when acting as peripheral, right?

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--EOHJn1TVIJfeVXv2--
