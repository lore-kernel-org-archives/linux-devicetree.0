Return-Path: <SRS0=miFn=HU=gmail.com=brandon.maier@kernel.org>
MIME-Version: 1.0
References: <20180422040132.1389-1-brandon.maier@gmail.com>
 <20180422040132.1389-2-brandon.maier@gmail.com> <20180427211355.lkuadz7elfz6prws@rob-hp-laptop>
 <CADwxmTn3fS50oAvqEj947RC5Hnq0q6666_CGvWU7KMmtOc=fvw@mail.gmail.com> <20180501131648.GA4135@rob-hp-laptop>
In-Reply-To: <20180501131648.GA4135@rob-hp-laptop>
From: Brandon Maier <brandon.maier@gmail.com>
Date: Tue, 01 May 2018 15:08:03 +0000
Message-ID: <CADwxmTmsbr1pjNARrPG-j+svDSBALQ2iQwf3O6nroBCukX++Zw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: net: gmii2rgmii: Clarify proper usage
Content-Type: text/plain; charset="UTF-8"
To: robh@kernel.org
Cc: mark.rutland@arm.com, michal.simek@xilinx.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, May 1, 2018 at 8:16 AM Rob Herring <robh@kernel.org> wrote:
...
> You don't need both properties. If the ethernet driver needs the phy,
> then it can decend into the child nodes to find it.

Ah, in the scenario I hit, the phy was on a separate mdio bus. So the
phy-handle was necessary. Is it common behavior for an Ethernet
controller to attach to the first phy on its own mdio bus? That wasn't
clear to me looking at the documentation, and is where I messed up
and attached the Ethernet to the gmiitorgmii phy.

  I could refactor the example to more closely resemble my scenario, e.g.

ethernet0 {
   mdio {
      phy: ethernet-phy@0 {
        ...
      }
      gmiitorgmii@8 {
         ...
       }
   }
}
ethernet1 {
    phy-handle = <&phy>;
}

But that would make the example too specific. So I'm inclined
to resubmit with just the added description, and drop the example changes.
