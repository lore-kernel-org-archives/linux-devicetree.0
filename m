From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/5] uio: dt-bindings: Add binding for "st,stm32f100"
Date: Fri, 13 Oct 2017 15:33:36 -0500
Message-ID: <20171013203336.tuacljvb4jrwcosi@rob-hp-laptop>
References: <20171009224655.6173-1-chris.packham@alliedtelesis.co.nz>
 <20171009224655.6173-3-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171009224655.6173-3-chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 10, 2017 at 11:46:52AM +1300, Chris Packham wrote:
> The stm32f100 is a general purpose micro controller. Document a binding
> that allows a user-space driver to be implemented for these devices.

It may be general purpose, but how it is hooked up to the host is not 
and probably could be done in a variety of ways. I'd expect that to be 
described in a binding doc (that's not a suggestion to add it to this 
doc as I'm fundamentally against any binding with "UIO" in it).

Also, while the processor itself is general purpose, typically its 
function on a given board would not be except maybe on dev boards. It's 
that function (a combination of the uC and its firmware) which we want 
to describe to the host OS. There's already examples of uC used as PMICs 
or system controllers.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
