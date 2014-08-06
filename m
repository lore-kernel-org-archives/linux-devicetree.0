From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] of/irq: lookup 'interrupts-extended' property first
Date: Wed, 6 Aug 2014 13:15:00 -0700
Message-ID: <20140806201500.GP3711@ld-irv-0074>
References: <1407355347-30286-1-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1407355347-30286-1-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 06, 2014 at 01:02:27PM -0700, Florian Fainelli wrote:
> In case the Device Tree blob passed by the boot agent supplies both an
> 'interrupts-extended' and an 'interrupts' property in order to allow for
> older kernels to be usable, prefer the new-style 'interrupts-extended'
> property which conveys a lot more information.
> 
> This allows us to have bootloaders willingly maintaining backwards
> compatibility with older kernels without entirely deprecating the
> 'interrupts' property.
> 
> Update the bindings documentation to describe a situation where both the
> 'interrupts-extended' and the 'interrupts' property are present, and
> which one takes precedence over the other.
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Might we add this?

Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # 3.13+

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
