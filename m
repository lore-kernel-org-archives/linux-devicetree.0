From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC usb-next v5 1/3] dt-bindings: usb: add the documentation for
 USB root-hub
Date: Fri, 20 Oct 2017 00:10:11 +0200
Message-ID: <CAK8P3a1cdob4trLG80xos1Zh1oXWLMExFTyS2EFsq0g+YULKpw@mail.gmail.com>
References: <20171008211713.18696-1-martin.blumenstingl@googlemail.com>
 <20171008211713.18696-2-martin.blumenstingl@googlemail.com>
 <CAK8P3a2607YnNRRmAJJyTNJTTJmJvx-ZJm3QNAq84noPLy+F+A@mail.gmail.com>
 <CAFBinCCc+Fj6wwGk+OLNQTHEYU8xBPe7OGHVSQ82kMew3xUsww@mail.gmail.com>
 <CAK8P3a2C+8w5_8uZF2qHvq7Cp=AH6DDx5Y=mGJFCCz2pTLvPPg@mail.gmail.com>
 <CAFBinCC7disratgMmmaSJMfywb-bPF32L-1BarSsX6zTChHEJg@mail.gmail.com>
 <CAK8P3a31GLjQDUUdyTeaAX_fELV5_UkNQfbj+ssHrGa7Ek2NcA@mail.gmail.com>
 <CAFBinCCmk3bSa4-OY7Mu0sPEhVv6=dQbSO94P=YMqk_hc+53Pg@mail.gmail.com>
 <CAK8P3a0hFF-gMa4UWMXh-28=scF-8cnzPv-Sa11PzyvgMYAkQw@mail.gmail.com> <CAFBinCAtsxu2gFXABhq5r0_DMJwsLGkLYjgWaEXMg=CVEjiv7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFBinCAtsxu2gFXABhq5r0_DMJwsLGkLYjgWaEXMg=CVEjiv7w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:ARM/Amlogic Meson SoC support" <linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 19, 2017 at 11:25 PM, Martin Blumenstingl
<martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>> Does dwc2 also use separate nodes for the roothub? From your
>> description it sounds like it would not be affected by your patch.
> currently it doesn't use separate notes for the roothub - however,
> with this patch it could (although I haven't explicitly tested this)

Ok.

>> Since you used a dtb that already listed an endpoint device below
>> an xhci, that would answer my earlier question of whether it worked
>> before your patch series, and you tested that it still works with your
>> patches applied and the roothub node added in the dtb.  Now we
>> just need to make sure we don't break existing dtb files that don't
>> have the roothub node but do have endpoint device nodes.
> the endpoint you're seeing is the root-hub - you can see the full .dts here: [0]
>
> maybe my patch description or documentation is not clear - could you
> please explain what makes you think that specifying the root-hub
> didn't work before (so I can update the comments where needed)?
> to sum up what this series does: find the node with reg = <0>; (= the
> root-hub) and get all PHY instances from the child-nodes
> this should not change any existing behavior except if someone had a
> node with reg = <0>; below any USB controller node (which was
> undocumented behavior before my patches)

Maybe I misunderstand what the actual change to the hierarchy
is. Quoting from your example for the new code

+       &usb1 {
+               #address-cells = <1>;
+               #size-cells = <0>;
+
+               roothub@0 {
+                       compatible = "usb1d6b,3", "usb1d6b,2";
+                       #address-cells = <1>;
+                       #size-cells = <0>;
+                       reg = <0>;
+
+                       port@1 {
+                               reg = <1>;
+                               phys = <&usb2_phy1>, <&usb3_phy1>;
+                               phy-names = "usb2-phy", "usb3-phy";
+                       };

The way I understand it, an endpoing device would now be
located in

 &usb1/roothub@0/port@1/hub@2/device@1

where previously it was in

 &usb1/port@1/hub@2/device@1

Is that correct?

I don't see any code that can deal with both cases and still
assign the correct of_node pointer to the device device@1 in
the end (maybe it's there and you just need to point me
to the right patch).

The reason why we have to be careful here is that the
Linux device hierarchy is not just derived from DT here, but
it gets created from the physical devices under &usb1
and the 'struct device' hierarchy has to match the DT hierarchy
exactly.

      Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
