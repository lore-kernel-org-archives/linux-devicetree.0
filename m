From: Chris Ruehl <chris.ruehl-CR359r9tUDPXPF5Rlphj1Q@public.gmane.org>
Subject: IMX27: How to do 22k pull-up with the pinctrl ?
Date: Mon, 11 Nov 2013 18:45:30 +0800
Message-ID: <5280B54A.1050503@gtsys.com.hk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

while I port the static code to the DT I step into the problem to
set the PSCR for the sdhc2 ports to 22k pull-up
I look for something like described in
     pinctrl/fsl,imx-pinctrl.txt

the fsl,imx27-pinctrl only say 0/1 dis/enable pull up but not the strength.


pinctrl_sdhc2_1: sdhc2-1 {
                         fsl,pins = <
                                 MX27_PAD_SD2_D0__SD2_D0  0x1
                                 MX27_PAD_SD2_D1__SD2_D1  0x1
                                 MX27_PAD_SD2_D2__SD2_D2  0x1
                                 MX27_PAD_SD2_D3__SD2_D3  0x1
                                 MX27_PAD_SD2_CLK__SD2_CLK  0x1
                                 MX27_PAD_SD2_CMD__SD2_CMD  0x1
                         >;
                 };

its setup in board specific c-file

/* 22k pull-up for sd2 pins  */
         reg = __raw_readw(MX27_IO_ADDRESS(MX27_SYSCTRL_BASE_ADDR + MX27_SYS_PSCR));
         reg &= ~0xfff0;
         reg |= 0xfff0;
         __raw_writew(reg, MX27_IO_ADDRESS(MX27_SYSCTRL_BASE_ADDR + MX27_SYS_PSCR));


Any successions?

Regards
Chris
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
