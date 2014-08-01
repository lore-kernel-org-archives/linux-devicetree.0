From: "Priebe, Sebastian" <Sebastian.Priebe-hnW+OuB6jW6zQB+pC5nmwQ@public.gmane.org>
Subject: core command line parameters with dt
Date: Fri, 1 Aug 2014 13:55:42 +0000
Message-ID: <E70AF999396FDF4EAE40E195B84709611F8471EA@SPMDEGHN001.CADCON.INTERN>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: de-DE
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

I want to use kernel command line parameters within my machine file.
If I use the __setup macro I get the following build error:
error: __setup_str_model_bt causes a section type conflict with myboard_dt_board_compat

static const char *myboard_dt_board_compat[] __initconst = {
        "vendor,model",
        NULL
};

How can I use command line parameters with device trees?

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
