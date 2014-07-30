From: "Priebe, Sebastian" <Sebastian.Priebe-hnW+OuB6jW6zQB+pC5nmwQ@public.gmane.org>
Subject: driver using another driver
Date: Wed, 30 Jul 2014 14:45:51 +0000
Message-ID: <E70AF999396FDF4EAE40E195B84709611F84671F@SPMDEGHN001.CADCON.INTERN>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: de-DE
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

I am working on a project with an ARMv6 cpu and I am currently trying to port our board file to a device tree.
Our custom hardware has a CPLD with is used by multiple driver.
In the past we shared the CPLD driver resource (struct resource...) among the drivers platform data to be able to access the CPLD registers from all the drivers.
The CPLD driver allocated the resource, returned it to our platform code and our platform code passed it to the other drivers.
In other words the CPLD driver is used by the other driver.
How can I achieve the same with a device tree?

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
