From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] auxdisplay: ht16k33: Keyscan function should be optional
Date: Thu, 17 Aug 2017 17:06:55 -0500
Message-ID: <20170817220655.firyevyxtt74wm3x@rob-hp-laptop>
References: <20170816102849.25686-1-robin@protonic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170816102849.25686-1-robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin van der Gracht <robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Miguel Ojeda Sandonis <miguel.ojeda.sandonis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 16, 2017 at 12:28:49PM +0200, Robin van der Gracht wrote:
> keyscan should be optional to support simple LED matrix displays (output only).
> 
> Reported-by: Michael Kaplan <M.KAPLAN-fExfdxwen0w@public.gmane.org>
> Signed-off-by: Robin van der Gracht <robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
> ---
> 
>  Documentation/devicetree/bindings/display/ht16k33.txt | 15 +++++++++------
>  drivers/auxdisplay/ht16k33.c                          | 14 ++++++--------
>  2 files changed, 15 insertions(+), 14 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
