From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] brcmfmac: Add brcm,nvram_file_name dt property
Date: Thu, 30 Jun 2016 21:08:36 -0500
Message-ID: <20160701020836.GA1722@rob-hp-laptop>
References: <1467209074-15634-1-git-send-email-hdegoede@redhat.com>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJIP47K7MERBJ5B265QKGQES2EZ4PY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1467209074-15634-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "John W . Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 29, 2016 at 04:04:31PM +0200, Hans de Goede wrote:
> Add a brcm,nvram_file_name dt property to allow overruling the default
> nvram filename for sdio devices. The idea is that we can specify a
> board specific nvram file, e.g. brcmfmac43362-ap6210.txt for boards
> with an ap6210 wifi sdio module and ship this in linux-firmware, so
> that wifi will work out of the box, without requiring users to find
> and then manually install the right nvram file for their board.

What about putting its contents directly into DT? It's just text 
key/value pairs so it would match up well.

Also, I have to wonder how all the non-SDIO based cards don't need this 
file.
  
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt          | 2 ++
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c               | 2 ++
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c             | 6 ++++++
>  include/linux/platform_data/brcmfmac.h                              | 2 ++
>  4 files changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt b/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
> index 5dbf169..2ba13a6 100644
> --- a/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
> +++ b/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
> @@ -11,6 +11,7 @@ Required properties:
>  Optional properties:
>   - brcm,drive-strength : drive strength used for SDIO pins on device in mA
>  	(default = 6).
> + - brcm,nvram_file_name : name of the nvram file to load

The need for firmware file names has come up several times though 
nothing merged to yet. There has been at least some level of agreement 
to use "firmware-name" here. 

>   - interrupt-parent : the phandle for the interrupt controller to which the
>  	device interrupts are connected.
>   - interrupts : specifies attributes for the out-of-band interrupt (host-wake).
> @@ -34,6 +35,7 @@ mmc3: mmc@01c12000 {
>  	brcmf: bcrmf@1 {
>  		reg = <1>;
>  		compatible = "brcm,bcm4329-fmac";
> +		brcm,nvram_file_name = "brcm/brcmfmac43362-ap6210.txt";
>  		interrupt-parent = <&pio>;
>  		interrupts = <10 8>; /* PH10 / EINT10 */
>  		interrupt-names = "host-wake";
