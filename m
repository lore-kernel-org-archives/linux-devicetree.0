From: "Chaiken, Alison" <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v3 5/6] ARM: dts: imx6dl: add pinctrls for WEIM NOR
Date: Fri, 24 May 2013 17:51:42 +0000
Message-ID: <60BA5429A0E1584BA3633194F6F993B5025754D1@NA-MBX-03.mgc.mentorg.com>
References: <1369389564-13181-1-git-send-email-b32955@freescale.com>,
 <1369389564-13181-6-git-send-email-b32955@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1369389564-13181-6-git-send-email-b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "shc_work-JGs/UdohzUI@public.gmane.org" <shc_work-JGs/UdohzUI@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Huang Shijie, sorry for not catching this earlier, but based on my reading of Table 4-1 of Rev. 1 of IMX6DQRM, I would use the following:

  pinctrl_weim_nor_1: weim_norgrp-2 {
                                               fsl,pins = <

[ . . . ]
                                                       /* data */
                                                       MX6DL_PAD_EIM_D16__EIM_DATA16 0x1b0b0
                                                       MX6DL_PAD_EIM_D17__EIM_DATA17 0x1b0b0
                                                       MX6DL_PAD_EIM_D18__EIM_DATA18 0x1b0b0
                                                       MX6DL_PAD_EIM_D19__EIM_DATA19 0x1b0b0
                                                       MX6DL_PAD_EIM_D20__EIM_DATA20 0x1b0b0
                                                       MX6DL_PAD_EIM_D21__EIM_DATA21 0x1b0b0
                                                       MX6DL_PAD_EIM_D22__EIM_DATA22 0x1b0b0
                                                       MX6DL_PAD_EIM_D23__EIM_DATA23 0x1b0b0
                                                       MX6DL_PAD_EIM_D24__EIM_DATA24 0x1b0b0
                                                       MX6DL_PAD_EIM_D25__EIM_DATA25 0x1b0b0
                                                       MX6DL_PAD_EIM_D26__EIM_DATA26 0x1b0b0
                                                       MX6DL_PAD_EIM_D27__EIM_DATA27 0x1b0b0
                                                       MX6DL_PAD_EIM_D28__EIM_DATA28 0x1b0b0
                                                       MX6DL_PAD_EIM_D29__EIM_DATA29 0x1b0b0
                                                       MX6DL_PAD_EIM_D30__EIM_DATA30 0x1b0b0
                                                       MX6DL_PAD_EIM_D31__EIM_DATA31 0x1b0b0

[ .  .  . ]

                                               >;
                                       }; 

In your patch, the address lines are set to 0xb0b1, which is correct, as hysteresis is disabled and SRE is fast for those lines.     However, for data lines, hysteresis is enabled and SRE is slow, so the 0x1b0b0 setting is more appropriate.   

-- 
Alison Chaiken
Mentor Embedded Software Division
alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org
