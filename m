From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v1 2/2] DT: eFuse: Add binding document for IMG Pistachio
 eFuse Controller
Date: Mon, 17 Nov 2014 11:13:30 -0800
Message-ID: <CAL1qeaF47Xwq5eS17D_rS4QBP12eJ3F0N-RNx+_o0kr-H1ropw@mail.gmail.com>
References: <1416237576-21542-1-git-send-email-arul.ramasamy@imgtec.com>
	<1416237576-21542-3-git-send-email-arul.ramasamy@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416237576-21542-3-git-send-email-arul.ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arul Ramasamy <arul.ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Naidu Tellapati <naidu.tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Jude Abraham <jude.abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 17, 2014 at 7:19 AM,  <arul.ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
> From: Arul Ramasamy <Arul.Ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
>
> Add binding document for IMG eFuse Controller present on Pistachio SOC.
>
> Signed-off-by: Arul Ramasamy <Arul.Ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Jude Abraham <Jude.Abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/soc/pistachio/img-efuse.txt    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/pistachio/img-efuse.txt
>
> diff --git a/Documentation/devicetree/bindings/soc/pistachio/img-efuse.txt b/Documentation/devicetree/bindings/soc/pistachio/img-efuse.txt
> new file mode 100644
> index 0000000..8643a21
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/pistachio/img-efuse.txt
> @@ -0,0 +1,18 @@
> +* IMG Pistachio eFuse controller
> +
> +Required properties:
> +- compatible: Must be "img,pistachio-efuse".
> +- reg: Must contain the base address and length of the eFuse registers.
> +- clocks: Must contain an entry for each entry in clock-names.
> +  See ../clock/clock-bindings.txt for details.
> +- clock-names: Must include the following entries:
> +  - efuse: External oscillator clock

How is the external oscillator related to efuse?  Also, perhaps it
should be called "osc" since it's not an efuse-specific clock.

> +  - sys: eFuse system interface clock

I don't see a system interface gate clock for efuse in the TRM...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
