From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: omap: Add omap-usb2 dt data
Date: Thu, 10 Jan 2013 10:35:01 -0800
Message-ID: <20130110183501.GX14149@atomide.com>
References: <1348050772-27819-1-git-send-email-kishon@ti.com>
 <1348050772-27819-3-git-send-email-kishon@ti.com>
 <50EE8A89.4010801@ti.com> <50EE921D.8020601@ti.com>
 <50EE9517.3030703@ti.com> <20130110124551.GU28920@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130110124551.GU28920-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
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
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, kishon <kishon-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

* Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> [130110 04:49]:
> On Thu, Jan 10, 2013 at 03:46:55PM +0530, kishon wrote:
> > On Thursday 10 January 2013 03:34 PM, Benoit Cousson wrote:
> > >
> > >Rob and I did not agree to use that temp hack in the case of DT, so you
> > >were supposed to repost with a proper driver for the SCM part that
> > >control the USB.
> > 
> > Ok. Missed that. Will work on that.
> 
> Didn't Tony say we should access SCM directly since it's a one time
> thing ?
> 
> Tony ?

The SCM parts should be a separate driver that eventually will be
a child of the minimal SCM core driver. The reason why it should be
separate is because the SCM registers are in a different block as
pointed out by Paul.

There's a good chance that we'll be able to eventually handle the USB
SCM registers directly via pinctrl-single.c using pinconf-bits + generic
pinconf binding. That is pending the changes from Haojian to implement
generic pinconf for pinctrl-single.c.

As the USB SCM registers can get quite complex, I suggest creating a
minimal driver to handle that, and then eventually that driver might
just use the generic pinconf API for setting the SCM registers for
things like bias voltage, pulls and comparators.

Regards,

Tony
