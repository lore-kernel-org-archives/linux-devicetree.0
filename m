From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt-binding: remoteproc: Document generic properties
Date: Thu, 8 Sep 2016 11:50:32 -0500
Message-ID: <20160908165032.GA9526@rob-hp-laptop>
References: <1470850622-29816-1-git-send-email-bjorn.andersson@linaro.org>
 <20160812183448.GA32059@rob-hp-laptop>
 <20160812224223.GJ26240@tuxbot>
 <46d4d351-336c-6d4f-b1b0-243cf3c5d68b@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <46d4d351-336c-6d4f-b1b0-243cf3c5d68b-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Cc: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 02, 2016 at 04:45:45PM -0500, Suman Anna wrote:
> On 08/12/2016 05:42 PM, Bjorn Andersson wrote:
> > On Fri 12 Aug 11:34 PDT 2016, Rob Herring wrote:
> > 
> >> On Wed, Aug 10, 2016 at 10:37:02AM -0700, Bjorn Andersson wrote:
> >>> This documents the generic properties "rprocs" and "rproc-names", used
> >>> for consumer drivers to reference a remoteproc node.
> >>
> >> How do you intend to use this? I wonder if it would not be better to 
> >> expose a remote proc with existing bindings for a particular purpose 
> >> (e.g. clocks, resets, etc.) rather than a generic connection. The client 
> >> side would have to have specific knowledge as to what functions the 
> >> remote proc provides.
> >>
> > 
> > The remoteproc node represents the mechanism and resources needed to
> > control the life cycle a co-processor, e.g. loading, booting, shutting
> > gown a video encoder/decoder.
> > 
> > The proposed reference allows a separate thingie to assert control of
> > the life cycle of that co-processor.
> > 
> > 
> > I acknowledge that in some cases there is a fine line between what is
> > the life cycle management and what is the actual functionality
> > implemented by that remote processor. But as the remoteproc mechanism is
> > reusable between various use cases I think it makes sense to not describe
> > them as one unit.
> 
> What's the current state of this patch, not officially acked yet right?

Bjorn and I have discussed some, but probably needs more discussion. 
This binding alone is simple enough, but I want to understand better how 
it will be used and digesting all the QCom h/w is not simple.

> While we are at this, can we agree upon an alias stem name as well, we
> can stick to "rproc". Otherwise, I can submit an incremental patch on
> top of this along with the code that adds an API to retrieve it for
> client users.

Any alias for this will be NAKed. My position on aliases is well 
documented.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
