MIME-Version: 1.0
Date: Tue, 11 Jun 2019 15:55:26 -0600
References: <1559296800-5610-1-git-send-email-biju.das@bp.renesas.com>
	<1559296800-5610-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1559296800-5610-2-git-send-email-biju.das@bp.renesas.com>
Message-ID: <CAL_JsqLvmxAt1ahaS3XAoqwR2F_eAosce-jhF74_bZuefdYybA@mail.gmail.com>
Subject: Re: [PATCH v7 1/7] dt-bindings: usb: hd3ss3220 device tree binding document
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Felipe Balbi <balbi@kernel.org>, Linux USB List <linux-usb@vger.kernel.org>, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, May 31, 2019 at 4:07 AM Biju Das <biju.das@bp.renesas.com> wrote:
>
> Add device tree binding document for TI HD3SS3220 Type-C DRP port
> controller driver.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> v6-->V7
>    * Removed Rob's reviewed by tag, since there is a rework
>    * Incorporated Sergie and Shimoda-San's review comment
>      (https://patchwork.kernel.org/patch/10944629/)
> V5-->V6
>   * No change.
> V4-->V5
>   * No Change.
> V3-->V4
>   * No Change.
> V2-->V3
>   * Added Rob's Reviewed by tag.
> V1-->V2
>   * Added connector node.
>   * updated the example with connector node.
> ---
>  .../devicetree/bindings/usb/ti,hd3ss3220.txt       | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt

Reviewed-by: Rob Herring <robh@kernel.org>
