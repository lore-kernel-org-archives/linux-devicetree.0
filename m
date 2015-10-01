From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH 2/6] ARM: dts: sun7i: Enable USB DRC on Bananapi
Date: Thu, 1 Oct 2015 10:32:42 +0200
Message-ID: <20151001083242.GB7104@lukather>
References: <1442928966-6418-1-git-send-email-hdegoede@redhat.com>
 <1442928966-6418-2-git-send-email-hdegoede@redhat.com>
 <20150929080453.GN7104@lukather>
 <560A4B3D.4040007@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8JAmzYDSl0Sjbh5d"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBOW7WOYAKGQEOWQFG3Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <560A4B3D.4040007-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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

--8JAmzYDSl0Sjbh5d
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Tue, Sep 29, 2015 at 10:26:37AM +0200, Hans de Goede wrote:
> Hi,
> 
> On 29-09-15 10:04, Maxime Ripard wrote:
> >On Tue, Sep 22, 2015 at 03:36:01PM +0200, Hans de Goede wrote:
> >>Enable the otg/drc usb controller on the Bananapi.
> >>
> >>Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >
> >Applied all the other patches but this one.
> 
> Thanks, seems you did not push this to your git.kernel.org repo though ?

I think I did, but maybe not at the time you sent the mail.

> >Since we dropped the patch adding the regulators support on the
> >Bananapi until we figure out why the board crash, it doesn't compile
> >anymore.
> 
> How about me doing a v2 of the regulators patch which removes the
> 
> &cpu0 {
>         cpu-supply = <&reg_dcdc2>;
> };
> 
> So that we do not get cpu voltage scaling, then the regulator
> changes should be a NOP, everything should just keep the u-boot
> set voltages, and we can enable oth support.
> 
> And then when we've figured out a safe way to enable cpu voltage
> scaling we can do so with a follow up patch ?
> 
> Is that a plan ? If so say yes and I'll do a v2 of these patches :)

Yep, it sounds like a good plan :)

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--8JAmzYDSl0Sjbh5d--
