From: Tim Sander <tim-cVflAIDvGO/+u4ArqExSyQ@public.gmane.org>
Subject: 4.11-rc6 and OF_DYNAMIC
Date: Wed, 12 Apr 2017 11:54:24 +0200
Message-ID: <2824279.KnFs6MaoZt@dabox>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi

I have been testing the 4.11-rc6 kernel on Intel(ex Altera) Arm SOC Cyclone
with dynamic Firmware loading. As i didn't know how to trigger dynamic
loading from userspace i also applied the following patch:

OF: DT-Overlay configfs interface
https://github.com/raspberrypi/linux/commit/8f1079750ce2fce4c4c2b4f8759ea57c8fb167d3

Now i got the loading of the devicetree overlay working :-)... but only if i enable
OF_UNITTEST. I find this a little strange especially as it slows boot time.
I also tried adding:
	select OF_DYNAMIC
to my OF_CONFIGFS patch but this didn't help. Also patching away "if OF_UNITTEST" 
 config OF_DYNAMIC
-       bool "Support for dynamic device trees" if OF_UNITTEST
+       bool "Support for dynamic device trees"
didn't help?

Besides these nitpicks i am really happy to see this in mainline as it really makes working with 
dynamic fpga based hardware much cleaner!

Best regards
Tim
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
