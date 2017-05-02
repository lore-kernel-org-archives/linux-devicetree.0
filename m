From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH RFC] Documentation/devicetree: Add specification for FSI busses
Date: Tue, 2 May 2017 15:49:21 +0930
Message-ID: <CACPK8Xf2regdT4Y-TW4nOc1qYwDcH=zYPRqdjTqL9yvZH49bRA@mail.gmail.com>
References: <1493704508-27119-1-git-send-email-jk@ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493704508-27119-1-git-send-email-jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, OpenBMC Maillist <openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 2, 2017 at 3:25 PM, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org> wrote:
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

Looks good to me Jeremy. One small question on the description, but
please add Acked-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org> to future
revisions.

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
> +engines within those slaves. However, we have a facility to match devicetree
> +nodes to probed engines. This allows for fsi engines to expose non-probeable
> +busses, which are then exposed by the device tree. For example, a FSI engine

A nit: Can we can expose any device as part of the engine, not just a bus?

> +that is an I2C master - the I2C bus can be described by the device tree under
> +the engine's device tree node.

Cheers,

Joel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
