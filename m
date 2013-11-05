From: Chris Ruehl <chris.ruehl-CR359r9tUDPXPF5Rlphj1Q@public.gmane.org>
Subject: I2C add ov2640 ?
Date: Tue, 05 Nov 2013 09:19:01 +0800
Message-ID: <52784785.1040406@gtsys.com.hk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

we continuing moving our board (imx27) to the devicetree implementation,
and find nothing howto deal with the ov2640 connect via i2c(0x30) and CSI 
interface to the Freescale SoC.

Here is what I did:

&i2c1 {
         status = "okay";
         clock-frequency = <400000>;

         cmos@30 {
                 compatible = "omni,ov2640";
                 reg = <0x30>;
         };
};



but when I boot the kernel, ov2640 complains about missing platform data.

-- 
Regards
Chris
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
