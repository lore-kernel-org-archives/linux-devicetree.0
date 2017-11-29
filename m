From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 3/4] RFC: net: dsa: Add bindings for Realtek SMI DSAs
Date: Thu, 30 Nov 2017 00:36:54 +0100
Message-ID: <20171129233654.GA7483@lunn.ch>
References: <20171105231909.5599-1-linus.walleij@linaro.org>
 <20171105231909.5599-4-linus.walleij@linaro.org>
 <20171105234831.GA24822@lunn.ch>
 <CACRpkdbzqnbF49yN-SAqLkhufk=R2C=jpdLo-QWmL0zR_+Vj=w@mail.gmail.com>
 <20171129155627.GD24881@lunn.ch>
 <CACRpkdZVXgFMiHpyUqw7ONYDcq6Htn3rTMRaBJkzd6T3WtX36A@mail.gmail.com>
 <20171129215659.GC1706@lunn.ch>
 <CACRpkdbUig-wb9_CnyF7DM4JsHCv4iruKx92wNXDdZtbrr2HoA@mail.gmail.com>
 <f9bfa1e1-7f05-1e2b-6663-09d4d3bf6a12@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <f9bfa1e1-7f05-1e2b-6663-09d4d3bf6a12-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antti =?iso-8859-1?Q?Sepp=E4l=E4?= <a.seppala-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Roman Yeryomin <roman-9zmcapQ0v8Q@public.gmane.org>, Colin Leitner <colin.leitner-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> While Andrew's suggestion to use of_mdiobus_register() even for the
> built-in DSA created slave_mii_bus makes sense, I would rather recommend
> you instantiate your own bus (ala mv88e6xxx), such that your DT will
> likely look like:

Hi Florian

I could still look like this, if the built in slave_mii_bus looked for
the mdio node.

Something like:

diff --git a/net/dsa/dsa2.c b/net/dsa/dsa2.c
index 44e3fb7dec8c..6b64c09413bf 100644
--- a/net/dsa/dsa2.c
+++ b/net/dsa/dsa2.c
@@ -312,6 +312,7 @@ static void dsa_port_teardown(struct dsa_port *dp)
 
 static int dsa_switch_setup(struct dsa_switch *ds)
 {
+       struct device_node *node;
        int err;
 
        /* Initialize ds->phys_mii_mask before registering the slave MDIO bus
@@ -347,7 +348,11 @@ static int dsa_switch_setup(struct dsa_switch *ds)
 
                dsa_slave_mii_bus_init(ds);
 
-               err = mdiobus_register(ds->slave_mii_bus);
+               if (ds->dev->of_node &&
+                   node = of_get_child_by_name(pdev->dev.of_node, "mdio"))
+                       err = of_mdiobus_register(ds->slave_mii_bus, node);
+               else
+                       err = mdiobus_register(ds->slave_mii_bus);
                if (err < 0)
                        return err;
        }

	Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
