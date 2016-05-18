From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] uio: introduce devicetree bindings for
 uio_dmem_genirq
Date: Wed, 18 May 2016 12:01:05 -0500
Message-ID: <20160518170105.GA4897@rob-hp-laptop>
References: <1463476940-26791-1-git-send-email-viktorin@rehivetech.com>
 <1463476940-26791-4-git-send-email-viktorin@rehivetech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1463476940-26791-4-git-send-email-viktorin-MQpMGdXoZmMqDJ6do+/SaQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Viktorin <viktorin-MQpMGdXoZmMqDJ6do+/SaQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "Hans J. Koch" <hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 17, 2016 at 11:22:19AM +0200, Jan Viktorin wrote:
> Signed-off-by: Jan Viktorin <viktorin-MQpMGdXoZmMqDJ6do+/SaQ@public.gmane.org>
> ---
>  .../devicetree/bindings/uio/uio_dmem_genirq.txt          | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/uio/uio_dmem_genirq.txt

DT describes h/w. UIO is not a h/w block, so this does not belong in DT. 
A UIO vs. kernel driver is purely a kernel decision which shouldn't 
require a DT change.

The properties should be part of match data for a compatible string that 
needs them set. Or if they can be defined in a way that is actually a 
property of the h/w, then it would be acceptible. You'd still need to 
define compatible strings that the properties apply to.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
