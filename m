From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] dt: Document a compatible entry for MDIO ethernet Phys
Date: Wed, 8 Jan 2014 12:37:03 -0600
Message-ID: <CAL_JsqLpWSXd44ErAs=+xYS8ESaBSY6EJEneZFYqtbpfyM4iPQ@mail.gmail.com>
References: <20131210193947.GU5429@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20131210193947.GU5429@obsidianresearch.com>
Sender: linux-doc-owner@vger.kernel.org
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 10, 2013 at 1:39 PM, Jason Gunthorpe
<jgunthorpe@obsidianresearch.com> wrote:
> This describes a compatible entry of the form:
>   ethernet-phy-idAAAA,BBBB
> Which is modelled after the PCI structured compatible entry
> (pciVVVV,DDDD.SSSS.ssss.RR)
>
> If present the OF core will be able to use this information to
> directly create the correct phy without auto probing the bus.
>
> Signed-off-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
> ---
>  Documentation/devicetree/bindings/net/phy.txt | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> Patch to parse this compatible string to follow if this binding is
> acceptable.

One minor comment below, otherwise:

Acked-by: Rob Herring <robh@kernel.org>

> Please see
>
> http://www.spinics.net/lists/devicetree/msg13175.html
>
> For discussion and a conceptual parsing patch.
>
> diff --git a/Documentation/devicetree/bindings/net/phy.txt b/Documentation/devicetree/bindings/net/phy.txt
> index 7cd18fb..d70b535 100644
> --- a/Documentation/devicetree/bindings/net/phy.txt
> +++ b/Documentation/devicetree/bindings/net/phy.txt
> @@ -23,10 +23,18 @@ Optional Properties:
>    assume clause 22. The compatible list may also contain other
>    elements.
>
> +  If the phy's identifier is known then the list may contain an entry
> +  of the form: "ethernet-phy-idAAAA,BBBB" where

I think this should be a period rather than a comma as we are not
separating a vendor ID from product ID.

Rob
