From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 04/13] rc: sunxi-cir: Add support for an
 optional reset controller
Date: Fri, 19 Dec 2014 19:17:08 +0100
Message-ID: <20141219181708.GQ4820@lukather>
References: <1418836704-15689-1-git-send-email-hdegoede@redhat.com>
 <1418836704-15689-5-git-send-email-hdegoede@redhat.com>
 <CAGb2v65BW7NABQXK877DkMNqDdBeuZ55wQHFkTexbWACFC4zFA@mail.gmail.com>
 <54929552.8090707@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NEaRsfQExFH3jWtg"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBON72KSAKGQEP67LXXI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54929552.8090707-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--NEaRsfQExFH3jWtg
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Thu, Dec 18, 2014 at 09:50:26AM +0100, Hans de Goede wrote:
> Hi,
> 
> On 18-12-14 03:48, Chen-Yu Tsai wrote:
> >Hi,
> >
> >On Thu, Dec 18, 2014 at 1:18 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> >>On sun6i the cir block is attached to the reset controller, add support
> >>for de-asserting the reset if a reset controller is specified in dt.
> >>
> >>Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >>Acked-by: Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> >>Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >>---
> >>  .../devicetree/bindings/media/sunxi-ir.txt         |  2 ++
> >>  drivers/media/rc/sunxi-cir.c                       | 25 ++++++++++++++++++++--
> >>  2 files changed, 25 insertions(+), 2 deletions(-)
> >>
> >>diff --git a/Documentation/devicetree/bindings/media/sunxi-ir.txt b/Documentation/devicetree/bindings/media/sunxi-ir.txt
> >>index 23dd5ad..6b70b9b 100644
> >>--- a/Documentation/devicetree/bindings/media/sunxi-ir.txt
> >>+++ b/Documentation/devicetree/bindings/media/sunxi-ir.txt
> >>@@ -10,6 +10,7 @@ Required properties:
> >>
> >>  Optional properties:
> >>  - linux,rc-map-name : Remote control map name.
> >>+- resets : phandle + reset specifier pair
> >
> >Should it be optional? Or should we use a sun6i compatible with
> >a mandatory reset phandle? I mean, the driver/hardware is not
> >going to work with the reset missing on sun6i.
> >
> >Seems we are doing it one way for some of our drivers, and
> >the other (optional) way for more generic ones, like USB.
> 
> I do not believe that we should add a new compatible just because
> the reset line of a block is hooked up differently. It is the
> exact same ip-block. Only now the reset is not controlled
> through the apb-gate, but controlled separately.

He has a point though. Your driver might very well probe nicely and
everything, but still wouldn't be functional at all because the reset
line wouldn't have been specified in the DT.

The easiest way to deal with that would be in the bindings doc to
update it with a compatible for the A31, and mentionning that the
reset property is mandatory there.

Note that the code itself might not change at all though. I'd just
like to avoid any potential breaking of the DT bindings themselves. If
we further want to refine the code, we can do that however we want.

I have a slight preference for a clean error if reset is missing, but
I won't get in the way just for that.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--NEaRsfQExFH3jWtg--
