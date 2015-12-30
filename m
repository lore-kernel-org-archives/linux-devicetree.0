From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] powerpc: fsl: update fman dt binding for PCS PHY
Date: Wed, 30 Dec 2015 09:14:23 -0600
Message-ID: <CAL_JsqLaFj2uC8dZRhvAi=fdr=JySd4+zp62z3FosePOp7Dqjw@mail.gmail.com>
References: <1451274454-26091-1-git-send-email-shh.xie@gmail.com>
 <20151229183436.GB12450@rob-hp-laptop> <VI1PR04MB1664E34FC9467506BEC5D815E8FD0@VI1PR04MB1664.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <VI1PR04MB1664E34FC9467506BEC5D815E8FD0-mr6QIVyDiCHTAO9RNConP89NdZoXdze2vxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shaohui Xie <shaohui.xie-3arQi8VN3Tc@public.gmane.org>
Cc: "shh.xie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <shh.xie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Igal Liberman <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Shaohui Xie <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 29, 2015 at 9:41 PM, Shaohui Xie <shaohui.xie-3arQi8VN3Tc@public.gmane.org> wrote:
>> Subject: Re: [PATCH] powerpc: fsl: update fman dt binding for PCS PHY
>>
>> On Mon, Dec 28, 2015 at 11:47:34AM +0800, shh.xie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>> > From: Shaohui Xie <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> >
>> > PCS PHY can support backplane (1000BASE-KX and 10GBASE-KR), this needs
>> > to change corresponding serdes lane settings, so a reference is needed
>> > for serdes lane. This patch describes properties needed for PCS PHY to
>> > support backplane.
>> >
>> > Signed-off-by: Shaohui Xie <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> > ---
>> > based on: http://patchwork.ozlabs.org/patch/560936/
>> >
>> >  Documentation/devicetree/bindings/powerpc/fsl/fman.txt | 14
>> > ++++++++++++++
>> >  1 file changed, 14 insertions(+)
>> >
>> > diff --git a/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
>> > b/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
>> > index 55c2c03..b38e727 100644
>> > --- a/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
>> > +++ b/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
>> > @@ -432,6 +432,16 @@ example of how to define a PHY (Internal PHY has no
>> interrupt line).
>> >  - For "fsl,fman-mdio" compatible internal mdio bus, the PHY is TBI PHY.
>> >  - For "fsl,fman-memac-mdio" compatible internal mdio bus, the PHY is PCS PHY,
>> >    PCS PHY addr must be '0'.
>> > +  PCS PHY can support backplane (1000BASE-KX and 10GBASE-KR), this
>> > + needs to  change the corresponding serdes lane settings.
>> > +
>> > +  PCS PHY node properties required for backplane:
>> > +
>> > +  - compatible: must be "ethernet-phy-ieee802.3-c45".
>> > +  - phy-mode: string, operation mode of the PHY interface; must be "1000base-
>> kx"
>> > +    for 1000BASE-KX, or "10gbase-kr" for 10GBASE-KR.
>>
>> Seems like these should be in common ethernet phy binding.
> [S.H] 'compatible' and 'phy-mode' are standard properties already in common Ethernet
> phy binding, I can update 'phy-mode' with "1000base-kx" and "10gbase-kr", how
> about I still list the two properties here for the requirement of PCS PHY to support
> backplane?

Yes. The common binding should list all possible values and this
binding should list allowed values.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
