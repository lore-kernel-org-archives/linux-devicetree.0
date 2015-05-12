From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] mailbox: arm-mhu: update the binding document
Date: Tue, 12 May 2015 15:27:00 +0100
Message-ID: <55520DB4.6060903@arm.com>
References: <1430131945-20628-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430131945-20628-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jassi,

On 27/04/15 11:52, Sudeep Holla wrote:
> The initial version of the binding document pushed along with the driver
> is not clear/explicit about couple of the required properties namely:
> clocks and clock-names, though the AMBA primecell binding used by the
> arm-mhu specifies them clearly. Without these property the driver will
> not even get probed, so it is mandatory to have them in DT.
>
> This patch adds the above mentioned required properties to the binding.
> It also adds the optional interrupt-names property which is good to have
> along with some minor updates to replace references to the driver with
> the hardware IP.
>

Can you review this ? It will be good to get this before v4.1 gets
released, otherwise the binding will remain incomplete in v4.1 ?

Regards,
Sudeep

> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> ---
>   .../devicetree/bindings/mailbox/arm-mhu.txt        | 29 ++++++++++++++--------
>   1 file changed, 19 insertions(+), 10 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
> index 4971f03f0b33..68146c9a0332 100644
> --- a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
> +++ b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
> @@ -1,14 +1,15 @@
> -ARM MHU Mailbox Driver
> -======================
> +ARM Message Handling Unit(MHU)
> +==============================
>
> -The ARM's Message-Handling-Unit (MHU) is a mailbox controller that has
> +The ARM's Message Handling Unit (MHU) is a mailbox controller that has
>   3 independent channels/links to communicate with remote processor(s).
> - MHU links are hardwired on a platform. A link raises interrupt for any
> -received data. However, there is no specified way of knowing if the sent
> -data has been read by the remote. This driver assumes the sender polls
> -STAT register and the remote clears it after having read the data.
> -The last channel is specified to be a 'Secure' resource, hence can't be
> -used by Linux running NS.
> +MHU links are hardwired on a platform. A link raises interrupt for any
> +received data. The platform/firmware must clear the STAT register after
> +having receiving the data and sender can poll on the same if the platform
> +lacks interrupt mechanism for sending data to remote processor.
> +
> +Out of 3 channels, the last channel is 'Secure', hence must not be used
> +by OS or any software running in non-secure state.
>
>   Mailbox Device Node:
>   ====================
> @@ -20,7 +21,15 @@ used by Linux running NS.
>   			address and length)
>   - #mbox-cells		Shall be 1 - the index of the channel needed.
>   - interrupts:		Contains the interrupt information corresponding to
> -			each of the 3 links of MHU.
> +			each of the MHU links.
> +- clocks		phandle to clock for apb pclk as specified in the
> +			primecell binding
> +- clock-names		Shall be "apb_pclk"
> +
> +Optional properties:
> +--------------------
> +- interrupt-names	contains names of the interrupt in the order in which
> +			they were specified in the interrupts property
>
>   Example:
>   --------
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
