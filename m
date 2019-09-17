From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: net: dwmac: fix 'mac-mode' type
Date: Tue, 17 Sep 2019 08:53:14 -0500
Message-ID: <CAL_JsqJ8fE4xH0DdtextdJ-+DftC2jDGg6GHbDJ+viCnhO2faw@mail.gmail.com>
References: <20190917103052.13456-1-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190917103052.13456-1-alexandru.ardelean@analog.com>
Sender: netdev-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Miller <davem@davemloft.net>, Giuseppe CAVALLARO <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 17, 2019 at 2:31 AM Alexandru Ardelean
<alexandru.ardelean@analog.com> wrote:
>
> The 'mac-mode' property is similar to 'phy-mode' and 'phy-connection-type',
> which are enums of mode strings.
>
> The 'dwmac' driver supports almost all modes declared in the 'phy-mode'
> enum (except for 1 or 2). But in general, there may be a case where
> 'mac-mode' becomes more generic and is moved as part of phylib or netdev.
>
> In any case, the 'mac-mode' field should be made an enum, and it also makes
> sense to just reference the 'phy-connection-type' from
> 'ethernet-controller.yaml'. That will also make it more future-proof for new
> modes.
>
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
