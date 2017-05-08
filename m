From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RFC] Documentation/devicetree: Add specification for FSI
 busses
Date: Mon, 8 May 2017 09:42:36 -0500
Message-ID: <20170508144236.r5ezra467hyzebtv@rob-hp-laptop>
References: <1493704508-27119-1-git-send-email-jk@ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1493704508-27119-1-git-send-email-jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 02, 2017 at 01:55:08PM +0800, Jeremy Kerr wrote:
> This change introduces a proposed layout for describing FSI busses in
> the device tree. While the bus is probe-able, we'd still like a method
> of describing subordinate (eg i2c) busses that are behind FSI devices.
> 
> The FSI core will be responsible for matching probed slaves & engines to
> their device tree nodes, so the FSI device drivers' probe() functions
> will be passed a struct device with the appropriate of_node populated
> where a matching DT node is found.
> 
> RFC at this stage, so I'd welcome any feedback.
> 
> Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/fsi/fsi.txt | 144 ++++++++++++++++++++++++++
>  1 file changed, 144 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fsi/fsi.txt
> 
> diff --git a/Documentation/devicetree/bindings/fsi/fsi.txt b/Documentation/devicetree/bindings/fsi/fsi.txt
> new file mode 100644
> index 0000000..b5e85c7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fsi/fsi.txt
> @@ -0,0 +1,144 @@
> +FSI bus & engine generic device tree bindings
> +=============================================
> +
> +The FSI bus is probe-able, so Linux is able to enumerate FSI slaves, and

s/Linux/the OS/

Otherwise, looks good to me.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
