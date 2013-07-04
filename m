From: Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Thu, 4 Jul 2013 10:08:29 +0100
Message-ID: <20130704090829.GQ13924@flint.arm.linux.org.uk>
References: <CAMLZHHREVEdRuHaD0imRu4pUv15ZyWYF2J9WCBEw-frxBry-Lw@mail.gmail.com>
 <20130702204255.2044c01b@armhf>
 <20130702191923.GD13924@flint.arm.linux.org.uk> <51D330AC.5060903@gmail.com>
 <CAMLZHHTbkfxmzrSrAU586Ywxptk=4Njzb0_puWxhfBcmBB0BWQ@mail.gmail.com>
 <51D348F5.2080205@gmail.com>
 <00ae01ce77cb$524d57f0$f6e807d0$%dae@samsung.com>
 <20130703090242.GM516@pengutronix.de>
 <20130703095248.GG13924@flint.arm.linux.org.uk>
 <20130704083307.GH10414@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130704083307.GH10414-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: 'Jean-Francois Moine' <moinejf-GANU6spQydw@public.gmane.org>, 'Daniel Drake' <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Sebastian Hesselbarth' <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 04, 2013 at 10:33:07AM +0200, Sascha Hauer wrote:
> A componentized device never completes and it doesn't have to. A
> componentized device can start once there is a path from an input
> (crtc, i2s unit) to an output (connector, speaker).

Sorry for the incomplete reply.

If you read all the messages in this thread, then you will realise that
DRM does not support an incremental startup approach.  It needs to know
everything at the point of "load".

> Without supernode you can just start once you have everything between
> the crtc and lvds nodes. If later a hdmi device joins in then you can
> either notify the users (provided the DRM/KMS API supports it) or just
> ignore it until the DRM device gets reopened.

It's not a case that you can ignore it until the "DRM device gets reopened"
because the DRM device never shuts down.  You'd have to ignore it until
you tear down what you have already registered into DRM, causing all
the display hardware to be shutdown, and then re-"load" DRM.

To make this work, you would have to modify not only DRM to allow that,
but also the framebuffer layer too.  Are you volunteering? :)

I don't think that Sebastian nor myself have either the motivation nor
the time available to go down that route of majorly rewriting kernel
subsystems.

Not only that but I believe it to be an unsafe approach as I've already
outlined.

-- 
Russell King
