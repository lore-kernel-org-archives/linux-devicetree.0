From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Question about "unit address format error" of DTC
Date: Thu, 9 Nov 2017 21:14:16 +0900
Message-ID: <CAK7LNARujG8J_z62bc+PQOz34rf-Bo=+M54kvtokZxnktn2Y+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob, David,


I am just curious about a DTC warning.


For example,

soc {
    compatible = "simple-bus";
    #address-cells = <1>;
    #size-cells = <1>;
    ranges;

    foo@11111111 {
         compatible = "foo";
         reg = <0x54006800 0x40>;
    };
};

This emits the following warning.

Warning (simple_bus_reg): Node /soc/foo@11111111 simple-bus unit
address format error, expected "54006800"


But, if I replace "simple-bus" with "simple-mfd",
DTC is completely happy.

Why is this check limited to simple bus / PCI bus?

For other cases, is mismatching @<address>  allowed?



-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
