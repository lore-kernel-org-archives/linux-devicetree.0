From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: net: add TI CC2560 Bluetooth chip
Date: Fri, 15 Dec 2017 17:05:58 -0600
Message-ID: <20171215230558.7vngwc66y2smvdrq@rob-hp-laptop>
References: <1513124971-23717-1-git-send-email-david@lechnology.com>
 <1513124971-23717-2-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1513124971-23717-2-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>, Johan Hedberg <johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 12, 2017 at 06:29:30PM -0600, David Lechner wrote:
> This adds a compatible string for the Texas Instruments CC2560 Bluetooth
> chip to the existing TI WiLink shared transport bindings. These chips are
> similar enough that the same bindings work for both. The file is renamed
> to ti-bluetooth.txt to make it more generic.
> 
> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
> ---
>  .../bindings/net/{ti,wilink-st.txt => ti-bluetooth.txt}     | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>  rename Documentation/devicetree/bindings/net/{ti,wilink-st.txt => ti-bluetooth.txt} (78%)

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
