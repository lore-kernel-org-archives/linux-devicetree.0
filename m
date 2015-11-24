From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun8i-h3-orangepi-plus: Enable
 USB host controllers
Date: Tue, 24 Nov 2015 08:44:48 +0100
Message-ID: <20151124074448.GI32142@lukather>
References: <1447616777-24660-1-git-send-email-hdegoede@redhat.com>
 <1447616777-24660-5-git-send-email-hdegoede@redhat.com>
 <CAGb2v669Cu6+G=P8yH-g5KbOsWTHBgnYUYf2fGt+jKXbqVAKfQ@mail.gmail.com>
 <56498FA8.3050908@redhat.com>
 <564B51D7.7090500@gmail.com>
 <564F3077.7020104@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pfhjpIY4DSX7ckaW"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBCNS2CZAKGQEHR3O66Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <564F3077.7020104-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--pfhjpIY4DSX7ckaW
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi, 

On Fri, Nov 20, 2015 at 03:38:47PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 17-11-15 17:12, Jens Kuske wrote:
> >Enable the 2 USB host controllers used on the Orange Pi Plus
> >and add the necessary regulators.
> >
> >Signed-off-by: Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
> >Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >Signed-off-by: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >---
> >
> >Hi Hans,
> >
> >with these regulators USB works on the Orange Pi Plus too.
> >I don't know if adding the regulators in the dts is okay, since most
> >regulators are defined in the sunxi-common-regulators.dtsi, but
> >we use different pins.
> 
> Thanks, I've added this to my sunxi-wip branch for now.
> 
> Regards,
> 
> Hans
> 
> p.s.
> 
> Any progress on getting the "core" H3 kernel support upstream ?
> 
> Given Arnd's remarks about how we should not hard-code the
> indices in the clk driver + the very KISS nature of the
> change to 1 parent-clk per gate setup I still believe
> that that one is best.
> 
> Maxime ? Chen-Yu ? It would be really good to be able to
> move forward with this, how do you want to proceed ?

Yeah, sorry, Chen-Yu and I were busy because of $LIFE the past weeks,
we're getting back to speed.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--pfhjpIY4DSX7ckaW--
