From: Paul Brook <paul-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
Subject: Re: [Qemu-devel] [RFC] Machine description as data
Date: Tue, 17 Feb 2009 17:44:34 +0000
Message-ID: <200902171744.34951.paul@codesourcery.com>
References: <87iqnh6kyv.fsf@pike.pond.sub.org>
	<87iqnawd2r.fsf@pike.pond.sub.org>
	<20090217032909.GA29225@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090217032909.GA29225-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Markus Armbruster <armbru-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > The machines I care for come with many optional and configurable parts.
> > We select the basic machine type with command line option -M, and
> > configure the rest with more command line options.  I figure we want to
> > keep supporting these options, at least for a while.
> >
> > I believe the best way to deal with that is start with a basic tree
> > selected by -M, then modify it according to the other options.  So,
> > there's a fair amount of configuration tree mutation.
>
> Yeah, you're probably right.  Although, in some cases the amount of
> complex tree mutation can be cut down by thinking about things in the
> right order.  For example if you have a bunch of optional devices,
> rather than adding them one by one (with all the required properties)
> to the skeleton tree, you can instead have the skeleton tree be the
> all-bells-and-whistles variant then delete the subtrees that aren't
> present.  libfdt even has a function to replace subtrees with nops
> instead of eliding them, which means the offsets of other nodes won't
> change.

I'm not so sure this is a vital feature. The current commandline options only 
provide the absolute bare minimum mutation for a basic PC machine, and don't 
even do that particularly well. I'm inclined to say we should punt 
significant machine config modification/generation to an external tool.

Paul
