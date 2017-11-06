From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 02/20] dt-bindings: arm: add support for ARM System
 Control and Management Interface(SCMI) protocol
Date: Mon, 6 Nov 2017 16:18:22 -0600
Message-ID: <20171106221822.b6ejvckapvprfsmh@rob-hp-laptop>
References: <1509720477-18936-1-git-send-email-sudeep.holla@arm.com>
 <1509720477-18936-3-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1509720477-18936-3-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: ALKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Ryan Harkin <Ryan.Harkin-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 03, 2017 at 02:47:39PM +0000, Sudeep Holla wrote:
> This patch adds devicetree binding for System Control and Management
> Interface (SCMI) Message Protocol used between the Application Cores(AP)
> and the System Control Processor(SCP). The MHU peripheral provides a
> mechanism for inter-processor communication between SCP's M3 processor
> and AP.
> 
> SCP offers control and management of the core/cluster power states,
> various power domain DVFS including the core/cluster, certain system
> clocks configuration, thermal sensors and many others.
> 
> SCMI protocol is developed as better replacement to the existing SCPI
> which is not flexible and easily extensible.
> 
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/arm,scmi.txt | 179 +++++++++++++++++++++
>  MAINTAINERS                                        |   4 +-
>  2 files changed, 181 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/arm,scmi.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
