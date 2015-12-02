From: Li Yang <leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] dts/ls2080a: Update PCIe compatible
Date: Wed, 2 Dec 2015 14:18:08 -0600
Message-ID: <CADRPPNSG-QJ0rOgq-zp_zXa2M=4xg2fERszutPfRMtjDfsF+3w@mail.gmail.com>
References: <1448345075-6801-1-git-send-email-Mingkai.Hu@freescale.com>
	<20151124202203.GA32297@rob-hp-laptop>
	<BN3PR0301MB1249CD4A615CCD7308FB067184050@BN3PR0301MB1249.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BN3PR0301MB1249CD4A615CCD7308FB067184050-CEkquS/Gb81/o3LNDxhOqZwN6zqB+hSMnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hu Vincent <Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "Lian M.H." <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 24, 2015 at 11:01 PM, Hu Vincent <Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>
>
>> -----Original Message-----
>> From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
>> Sent: Wednesday, November 25, 2015 4:22 AM
>> To: Hu Mingkai-B21284
>> Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org;
>> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Li Yang-Leo-R58472; Lian Minghuan-B31939
>> Subject: Re: [PATCH] dts/ls2080a: Update PCIe compatible
>>
>> On Tue, Nov 24, 2015 at 02:04:35PM +0800, Mingkai Hu wrote:
>> > From: Minghuan Lian <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> >
>> > The patch adds LS2085a to PCIe compatible to fix the compatibility
>> > issue when using firmware with LS2085a compatible property.
>> >
>> > Signed-off-by: Minghuan Lian <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> > Signed-off-by: Mingkai Hu <Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> > ---
>> >  Documentation/devicetree/bindings/pci/layerscape-pci.txt |  1 +
>> >  arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi           | 12
>> ++++++++----
>> >  2 files changed, 9 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/Documentation/devicetree/bindings/pci/layerscape-pci.txt
>> > b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
>> > index e376785..4600007 100644
>> > --- a/Documentation/devicetree/bindings/pci/layerscape-pci.txt
>> > +++ b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
>> > @@ -15,6 +15,7 @@ Required properties:
>> >  - compatible: should contain the platform identifier such as:
>> >          "fsl,ls1021a-pcie", "snps,dw-pcie"
>> >          "fsl,ls2080a-pcie", "snps,dw-pcie"
>> > +        "fsl,ls2085a-pcie", "snps,dw-pcie"
>> >  - reg: base addresses and lengths of the PCIe controller
>> >  - interrupts: A list of interrupt outputs of the controller. Must
>> contain an
>> >    entry for each entry in the interrupt-names property.
>> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
>> > b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
>> > index e81cd48..3821bb1 100644
>> > --- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
>> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
>> > @@ -383,7 +383,8 @@
>> >             };
>> >
>> >             pcie@3400000 {
>> > -                   compatible = "fsl,ls2080a-pcie", "snps,dw-pcie";
>> > +                   compatible = "fsl,ls2080a-pcie", "fsl,ls2085a-pcie",
>> > +                                "snps,dw-pcie";
>>
>> This doesn't match the doc as to what are valid combinations. The order
>> here seems backwards too. ls2085a is older?
>>
>
> Yes, ls2085a was released earlier. You mean the older one comes first? Like:
>
> compatible = "fsl,ls2085a-pcie", "fsl,ls2080a-pcie",
>                  "snps,dw-pcie";

No.  The original order should be good.  We should put newer/more
specific compatible first and older/more generic compatible later.  I
think the issue is that the binding document.  We don't need to list
the combinations.  Just list all the possible compatible strings
specific to layerscape.  You can add a special note about "snps,
dw-pcie" separately.

Regards,
Leo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
