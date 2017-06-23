From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] Revert "NFC: trf7970a: Handle extra byte in response
 to Type 5 RMB commands"
Date: Fri, 23 Jun 2017 13:34:11 -0500
Message-ID: <20170623183411.tkwc2iuw7bmymkds@rob-hp-laptop>
References: <20170615174617.1817-1-mgreer@animalcreek.com>
 <20170615174617.1817-4-mgreer@animalcreek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170615174617.1817-4-mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 15, 2017 at 10:46:17AM -0700, Mark Greer wrote:
> This reverts commit ab714817d7e891608d31f6996b1e4c43cf2bf342.
> 
> The original commit was designed to handle a bug in the trf7970a NFC
> controller where an extra byte was returned in Read Multiple Blocks (RMB)
> command responses.  However, it has become less clear whether it is a bug
> in the trf7970a or in the tag.  In addition, it was assumed that the extra
> byte was always returned but it turns out that is not always the case. The
> result is that a byte of good data is trimmed off when the extra byte is
> not present ultimately causing the neard deamon to fail the read.
> 
> Since the trf7970a driver does not have the context to know when to trim
> the byte or not, remove the code from the trf7970a driver all together
> (and move it up to the neard daemon).  This has the added benefit of
> simplifying the kernel driver and putting the extra complexity into
> userspace.
> 
> CC: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> CC: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
> ---
>  .../devicetree/bindings/net/nfc/trf7970a.txt       |  4 ----
>  drivers/nfc/trf7970a.c                             | 25 ++++------------------
>  2 files changed, 4 insertions(+), 25 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
