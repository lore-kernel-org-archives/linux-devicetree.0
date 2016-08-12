From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt-binding: remoteproc: Document generic properties
Date: Fri, 12 Aug 2016 15:42:23 -0700
Message-ID: <20160812224223.GJ26240@tuxbot>
References: <1470850622-29816-1-git-send-email-bjorn.andersson@linaro.org>
 <20160812183448.GA32059@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160812183448.GA32059@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri 12 Aug 11:34 PDT 2016, Rob Herring wrote:

> On Wed, Aug 10, 2016 at 10:37:02AM -0700, Bjorn Andersson wrote:
> > This documents the generic properties "rprocs" and "rproc-names", used
> > for consumer drivers to reference a remoteproc node.
> 
> How do you intend to use this? I wonder if it would not be better to 
> expose a remote proc with existing bindings for a particular purpose 
> (e.g. clocks, resets, etc.) rather than a generic connection. The client 
> side would have to have specific knowledge as to what functions the 
> remote proc provides.
> 

The remoteproc node represents the mechanism and resources needed to
control the life cycle a co-processor, e.g. loading, booting, shutting
gown a video encoder/decoder.

The proposed reference allows a separate thingie to assert control of
the life cycle of that co-processor.


I acknowledge that in some cases there is a fine line between what is
the life cycle management and what is the actual functionality
implemented by that remote processor. But as the remoteproc mechanism is
reusable between various use cases I think it makes sense to not describe
them as one unit.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
