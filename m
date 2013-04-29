From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] video: implement a simple framebuffer driver
Date: Mon, 29 Apr 2013 23:31:30 +0200
Message-ID: <1556968.7tR6KuEIWb@flatron>
References: <1365043183-28905-1-git-send-email-swarren@wwwdotorg.org>
 <2863648.BDvrAG5uPk@flatron> <1461633.kfcPFxva7x@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1461633.kfcPFxva7x@avalon>
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
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Clark <robclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 29 of April 2013 23:20:43 Laurent Pinchart wrote:
> Hi Tomasz,
> 
> On Monday 29 April 2013 23:15:13 Tomasz Figa wrote:
> > On Thursday 11 of April 2013 11:56:31 Laurent Pinchart wrote:
> > > On Monday 08 April 2013 17:16:37 Andrew Morton wrote:
> > > > On Wed,  3 Apr 2013 20:39:43 -0600 Stephen Warren wrote:
> > > > > A simple frame-buffer describes a raw memory region that may be
> > > > > rendered to, with the assumption that the display hardware has
> > > > > already been set up to scan out from that buffer.
> > > > > 
> > > > > This is useful in cases where a bootloader exists and has set up
> > > > > the
> > > > > display hardware, but a Linux driver doesn't yet exist for the
> > > > > display hardware.
> > > > > 
> > > > > ...
> > > > > 
> > > > > +config FB_SIMPLE
> > > > > +	bool "Simple framebuffer support"
> > > > > +	depends on (FB = y) && OF
> > > > 
> > > > It's sad that this simple little thing requires Open Firmware. 
> > > > Could
> > > > it be generalised in some way so that the small amount of setup
> > > > info
> > > > could be provided by other means (eg, module_param) or does the
> > > > dependency go deeper than that?
> > > 
> > > I second that request. I like the idea of a simple framebuffer
> > > driver if it helps deprecating fbdev in the long term, but I don't
> > > want it to offer an excuse not to implement a DRM/KMS driver. In
> > > particular adding DT bindings would force us to keep supporting the
> > > ABI for a (too) long time.
> > 
> > Well, there is also at least one legitimate use case for this driver.
> > 
> > I believe there exist embedded devices on which there is no need to
> > dynamically control the framebuffer. It needs one time initialization,
> > usually in bootloader, and then it is used as is, using constant
> > parameters as long as the system is running.
> > 
> > I doubt there is a need for any KMS (or any other control) driver for
> > such devices - dumb framebuffer driver would be everything needed in
> > such case.
> As we want to deprecate the fbdev API we would need to move to KMS at
> some point anyway, even if the device can't be controlled. I don't
> think writting such a KMS driver would be that difficult.

Good point. Stephen, would it be a problem to make this a KMS driver 
instead? Old fbdev API could be emulated on top of it, until it goes out 
of use, couldn't it?

Best regards,
Tomasz
