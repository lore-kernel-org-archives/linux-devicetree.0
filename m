From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: sun5i: Add sun5i-q8-common.dtsi
Date: Fri, 18 Sep 2015 21:53:00 +0200
Message-ID: <20150918195300.GX4684@lukather>
References: <1441464953-26351-1-git-send-email-hdegoede@redhat.com>
 <1441464953-26351-2-git-send-email-hdegoede@redhat.com>
 <20150908143320.GB31584@lukather>
 <55EF529B.80401@redhat.com>
 <20150909140156.GC9885@lukather>
 <55F19C43.2000601@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UQUSR6hGnEXrhNQw"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBHOX6GXQKGQENROI6JY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55F19C43.2000601-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--UQUSR6hGnEXrhNQw
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Thu, Sep 10, 2015 at 05:05:39PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 09-09-15 16:01, Maxime Ripard wrote:
> >On Tue, Sep 08, 2015 at 11:26:51PM +0200, Hans de Goede wrote:
> >>Hi,
> >>
> >>On 09/08/2015 04:33 PM, Maxime Ripard wrote:
> >>>On Sat, Sep 05, 2015 at 04:55:52PM +0200, Hans de Goede wrote:
> >>>>This is the sun5i / a13 version of sun8i-q8-common.dtsi for use in dts
> >>>>files for a13 q8 based tablets. Compared to sun8i this uses uart1 for the
> >>>>serial console, and PG0 for card-detect for mmc0.
> >>>>
> >>>>This also adds pmic and otg support, which both use the same config on
> >>>>all known q8 a13 devices. This is not present in sun5i-q8-common.dtsi
> >>>>because pmic / otg support for sun8i has not yet been merged.
> >>>>
> >>>>Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >>>
> >>>Are we going to have any user but the one you posted in the patch 3
> >>>planned?
> >>
> >>Depends on what I can get my hands on / what is in the post atm.
> >>
> >>One difference in fex files of different 18 variants is how the usb wifi is
> >>powered, either via a gpio or via ldo3. Also there are differences in which
> >>accelerometer is used, so eventually I expect there to be several users
> >>of this dtsi.
> >
> >But no difference in the SoC used (A13 vs A10s)?
> >
> >I'm not sure having 18 DTs for a single board name is going to be
> >really helpful.
> 
> Sorry I meant to write q8 not 18 :)
> 
> >It would be something to be supported by some quirks
> >mechanism, instead of having to require the user to pick the right one.
> 
> Agreed, which is why I added a generic sun5i-a13-q8-tablet.dts, which
> can then later be extended with quirks and such to get all the different
> variants supported. Which I guess means that the contents of
> sun5i-q8-common.dtsi can be folded into sun5i-a13-q8-tablet.dts, otoh
> we may have some special cases which do require a separate dts and
> having sun5i-q8-common.dtsi follows the same scheme as used for the
> a23 / a33 tablets. In the future we should probably also add
> sun8i-a23-q8-tablet.dts and sun8i-a33-q8-tablet.dts files and make
> the existing ones just empty files with a single #include for
> compatibility.
> 
> If possible I would like to at least have you queue up the default
> sun5i-a13-q8-tablet.dts so that we've a dts file for a13 based tablets
> which at least gets the basics going.
> 
> Either in its current form, or with it and sun5i-q8-common.dtsi
> squashed together. If you want a squashed version let me know and
> I'll do a resend.
> 
> Are you coming to ELCE ? I think the both of us should go to:
> 
> http://lceeu2015.sched.org/event/999c45c7fe78824a88269f35539c7e5c#.VfGcCLPYqlM
> 
> (Device Tree NG BoF) and try to hash out a solution for this there,
> the quirks / variants stuff sounds good, but I wonder how far along
> that is ?

I will be to the technical showcase, but we can always discuss with
Pantelis a bit later :)

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--UQUSR6hGnEXrhNQw--
