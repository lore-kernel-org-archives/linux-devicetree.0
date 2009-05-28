From: Jon Smirl <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Thu, 28 May 2009 09:33:28 -0400
Message-ID: <9e4733910905280633u15546189q37a4b4080158249c@mail.gmail.com>
References: <ed82fe3e0905270739k38018c87ka11f62c5977e45fb@mail.gmail.com>
	<fa686aa40905270839m375bbdacqb1acb1be0a2d2da0@mail.gmail.com>
	<20090527162000.GM6805@pengutronix.de>
	<fa686aa40905271335o1165419hda2334bef42aa3f@mail.gmail.com>
	<20090527234801.GP6805@pengutronix.de>
	<4A1DD3A0.3010501@freescale.com>
	<20090528000707.GR6805@pengutronix.de>
	<fa686aa40905272029n32aa5f1ds86d07f0de4894815@mail.gmail.com>
	<20090528095126.99DB4832E416@gemini.denx.de>
	<20090528101339.GV6805@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090528101339.GV6805-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Robert Schwebel <r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org, rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, May 28, 2009 at 6:13 AM, Robert Schwebel
<r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> On Thu, May 28, 2009 at 11:51:26AM +0200, Wolfgang Denk wrote:
>> True. From a commercial point of view this is a huge =A0problem =A0casued
>> by the device tree - custumers who used to oder a BSP from commercial
>> service providers (like Robert or me :-) now often find that all they
>> need =A0to =A0do is to tweak the device tree to get their system running.
>> Lost business. D*mn... =A0[Maybe this explains Robert's reluctance?]
>
> Wolfgang, you know me long enough to realize that this argument is
> *crap*.
>
> Talking about business cases, it has turned out to be extremely
> difficult to explain customers that the effort for the actual
> functionality is only a little percentage of the work necessary to do
> the oftree stuff right. The functionality has often worked after a few
> hours, and until all oftrees have been solved, it often takes weeks.
>
> In result, this has already led to customers concluding that
>
> - mainline is not worth the effort

And as an indirect customer of yours (via Phytec) I am spending a
bunch of time submitting code you wrote to mainline. By not submitting
code to mainline you prevent me from getting to security patches that
have been made to later kernels. "port and forget" is evil should be
banned.

> - linux is overkill and one should better use cortex-bare-metal
>
> However, that is only our personal observation.
>
> rsc
> --
> Pengutronix e.K. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |
> Industrial Linux Solutions =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | http://www.p=
engutronix.de/ =A0|
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0 =A0=
 =A0|
> Amtsgericht Hildesheim, HRA 2686 =A0 =A0 =A0 =A0 =A0 | Fax: =A0 +49-5121-=
206917-5555 |
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>



-- =

Jon Smirl
jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
