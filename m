From: Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 3/6] dt/bindings: add bindings for optee
Date: Thu, 19 Nov 2015 10:18:11 +0100
Message-ID: <20151119091810.GA15974@ermac>
References: <1446106888-8983-1-git-send-email-jens.wiklander@linaro.org>
 <1446106888-8983-4-git-send-email-jens.wiklander@linaro.org>
 <20151116170109.GA20076@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151116170109.GA20076@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, jean-michel.delorme-qxv4g6HH51o@public.gmane.org, emmanuel.michel-qxv4g6HH51o@public.gmane.org, javier-5MUHepqpBA1BDgjK7y7TUQ@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 16, 2015 at 11:01:10AM -0600, Rob Herring wrote:
> On Thu, Oct 29, 2015 at 09:21:25AM +0100, Jens Wiklander wrote:
> > Introduces optee prefix and adds bindings for ARM TrustZone based OP-TEE
> > implementation.
> > 
> > Signed-off-by: Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  .../bindings/arm/firmware/optee,optee-tz.txt       | 29 ++++++++++++++++++++++
> >  .../devicetree/bindings/vendor-prefixes.txt        |  1 +
> >  2 files changed, 30 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/firmware/optee,optee-tz.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/firmware/optee,optee-tz.txt b/Documentation/devicetree/bindings/arm/firmware/optee,optee-tz.txt
> > new file mode 100644
> > index 0000000..0a8ed0d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/firmware/optee,optee-tz.txt
> > @@ -0,0 +1,29 @@
> > +OP-TEE Device Tree Bindings
> > +
> > +OP-TEE is a piece of software using hardware features to provide a Trusted
> > +Execution Environment. The security can be provided with ARM TrustZone, but
> > +also by virtualization or a separate chip. As there's no single OP-TEE
> > +vendor we're using "optee" as the first part of compatible property,
> > +indicating the OP-TEE protocol is used when communicating with the secure
> > +world.
> > +
> > +* OP-TEE based on ARM TrustZone required properties:
> > +
> > +- compatible     : should contain "optee,optee-tz"
> 
> I would leave off optee as a vendor. Different implementations by 
> vendors should then add their vendor prefix as they all have the chance 
> to screw-up something. I suppose we could do "linaro" as the reference 
> implementation.

OK, I'll use "linaro" then.

> 
> > +
> > +- method         : The method of calling the OP-TEE Trusted OS. Permitted
> > +                   values are:
> > +
> > +                   "smc" : SMC #0, with the register assignments specified
> > +		           in drivers/tee/optee/optee_smc.h
> > +
> > +                   "hvc" : HVC #0, with the register assignments specified
> > +		           in drivers/tee/optee/optee_smc.h
> 
> The use here would be a guest VM calling thru to hypervisor and then 
> hypervisor calling optee?

Yes, the hypervisor needs to be involved (translating IPA to PA etc)
when invoking secure world.

> 
> > +
> > +
> > +
> > +Example:
> > +	optee {
> 
> This should go under a /firmware node similar to 
> Documentation/devicetree/bindings/arm/firmware/tlm,trusted-foundations.txt.

I tried that and discovered that a
compatible = "simple-bus";
is needed for the firmware node for optee to get probed. Is it OK to write
the example as:

firmware {
        compatible = "simple-bus";

        optee {
...

Thanks,
Jens
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
