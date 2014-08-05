From: "Priebe, Sebastian" <Sebastian.Priebe-hnW+OuB6jW6zQB+pC5nmwQ@public.gmane.org>
Subject: where to add imx-udc-mx27 in device tree
Date: Tue, 5 Aug 2014 12:06:52 +0000
Message-ID: <E70AF999396FDF4EAE40E195B84709611F847DDE@SPMDEGHN001.CADCON.INTERN>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: de-DE
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

I am trying to add an USB gadget to my device tree and I am using modules for my gadgets (serial and mass-storage).
&usbotg {
        pinctrl-names = "default";
        pinctrl-0 = <&pinctrl_usbotg>;
        dr_mode = "peripheral";
        phy_type = "utmi_wide";
        status = "okay";
};

Modprobe returns with -ENODEV, because no UDC can be found.
Where do I need to add the UDC in the device tree (imx-udc-mx27)?
I couldn't find any documentation or examples.

Greetings
Sebastian Priebe



==========================================
CADCON
Ingenieurgesellschaft mbH & Co. KG
Geschaeftsfuehrer: Robert Bauer, Andreas Gundel
Sitz der Gesellschaft: D-86368 Gersthofen
Registergericht: Amtsgericht Augsburg HRA 14521
==========================================


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
