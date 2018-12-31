From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [PATCH v2 5/5] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Mon, 31 Dec 2018 09:42:55 +0000
Message-ID: <BYAPR07MB4709D1D286EAD3A794987E51DDB20@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1545577992-4013-6-git-send-email-pawell@cadence.com>
 <201812240317.VglTVDie%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201812240317.VglTVDie%fengguang.wu@intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: "kbuild-all@01.org" <kbuild-all@01.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alan Douglas <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <pete>
List-Id: devicetree@vger.kernel.org

Hi

I can't recreate these issue on my environment. I use  gcc (Ubuntu 7.3.0-27=
ubuntu1~18.04) 7.3.0.  Maybe there are some differenct between these two co=
mpilers.=20

Do you have any idea how I should change this fragment of code:
		sprintf(str, "%02x %02x %02x %02x %02x %02x %02x %02x",
			bRequestType, bRequest,
			cpu_to_le16(wValue) & 0xff,
			cpu_to_le16(wValue) >> 8,
			cpu_to_le16(wIndex) & 0xff,
			cpu_to_le16(wIndex) >> 8,
			cpu_to_le16(wLength) & 0xff,
			cpu_to_le16(wLength) >> 8);

to remove "restricted __le16 degrades to integer" warnings ?

Maybe I should cast all to u8. Then this code will look like:
		sprintf(str, "%02x %02x %02x %02x %02x %02x %02x %02x",
			bRequestType, bRequest,
			(u8)(cpu_to_le16(wValue) & 0xff),
			(u8)(cpu_to_le16(wValue) >> 8),
			(u8)(cpu_to_le16(wIndex) & 0xff),
			(u8)(cpu_to_le16(wIndex) >> 8),
			(u8)(cpu_to_le16(wLength) & 0xff),
			(u8)(cpu_to_le16(wLength) >> 8));

Should it Fix these warnings ?

Cheers,
Pawel

>Thank you for the patch! Perhaps something to improve:
>
>
>
>[auto build test WARNING on usb/usb-testing]
>
>[also build test WARNING on v4.20-rc7 next-20181221]
>
>[if your patch is applied to the wrong git tree, please drop us a note to =
help improve the system]
>
>
>
>url:    https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_=
0day-2Dci_linux_commits_Pawel-2DLaszczak_Introduced-
>2Dnew-2DCadence-2DUSBSS-2DDRD-2DDriver_20181223-2D231813&d=3DDwIBAg&c=3DaU=
q983L2pue2FqKFoP6PGHMJQyoJ7kl3s3GZ-
>_haXqY&r=3De1OgxfvkL0qo9XO6fX1gscva-w03uSYC1nIyxl89-rI&m=3DJS8MUBEUPN46-me=
57xUY-
>7hoBbSrlgd2SCB9ahNjK4s&s=3DbhpHqRyEtMdMbWdGoBqQ9Pz9wq7pRA7-OohrGik3BpM&e=
=3D
>
>base:   https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
>3A__git.kernel.org_pub_scm_linux_kernel_git_gregkh_usb.git&d=3DDwIBAg&c=3D=
aUq983L2pue2FqKFoP6PGHMJQyoJ7kl3s3GZ-
>_haXqY&r=3De1OgxfvkL0qo9XO6fX1gscva-w03uSYC1nIyxl89-rI&m=3DJS8MUBEUPN46-me=
57xUY-
>7hoBbSrlgd2SCB9ahNjK4s&s=3DVf__lGpV27zdf1egowm9p8YBJjz9aMmgbi8nW_Z_DLk&e=
=3D usb-testing
>
>config: x86_64-allmodconfig (attached as .config)
>
>compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
>
>reproduce:
>
>        # save the attached .config to linux build tree
>
>        make ARCH=3Dx86_64
>
>
>
>All warnings (new ones prefixed by >>):
>
>
>
>>> drivers/usb/common/debug.c:253:25: warning: restricted __le16 degrades =
to integer
>
>   drivers/usb/common/debug.c:254:25: warning: restricted __le16 degrades =
to integer
>
>   drivers/usb/common/debug.c:255:25: warning: restricted __le16 degrades =
to integer
>
>   drivers/usb/common/debug.c:256:25: warning: restricted __le16 degrades =
to integer
>
>   drivers/usb/common/debug.c:257:25: warning: restricted __le16 degrades =
to integer
>
>   drivers/usb/common/debug.c:258:25: warning: restricted __le16 degrades =
to integer
>
>
>
>vim +253 drivers/usb/common/debug.c
>
>
>
>cefb8b21 Pawel Laszczak 2018-12-23  205
>
>cefb8b21 Pawel Laszczak 2018-12-23  206  /**
>
>cefb8b21 Pawel Laszczak 2018-12-23  207   * usb_decode_ctrl - returns a st=
ring representation of ctrl request
>
>cefb8b21 Pawel Laszczak 2018-12-23  208   */
>
>cefb8b21 Pawel Laszczak 2018-12-23  209  const char *usb_decode_ctrl(char =
*str, __u8 bRequestType, __u8 bRequest,
>
>cefb8b21 Pawel Laszczak 2018-12-23  210  			    __u16 wValue,  __u16 wInde=
x, __u16 wLength)
>
>cefb8b21 Pawel Laszczak 2018-12-23  211  {
>
>cefb8b21 Pawel Laszczak 2018-12-23  212  	switch (bRequest) {
>
>cefb8b21 Pawel Laszczak 2018-12-23  213  	case USB_REQ_GET_STATUS:
>
>cefb8b21 Pawel Laszczak 2018-12-23  214  		usb_decode_get_status(bRequestT=
ype, wIndex, wLength, str);
>
>cefb8b21 Pawel Laszczak 2018-12-23  215  		break;
>
>cefb8b21 Pawel Laszczak 2018-12-23  216  	case USB_REQ_CLEAR_FEATURE:
>
>cefb8b21 Pawel Laszczak 2018-12-23  217  	case USB_REQ_SET_FEATURE:
>
>cefb8b21 Pawel Laszczak 2018-12-23  218  		usb_decode_set_clear_feature(bR=
equestType, bRequest, wValue,
>
>cefb8b21 Pawel Laszczak 2018-12-23  219  					     wIndex, str);
>
>cefb8b21 Pawel Laszczak 2018-12-23  220  		break;
>
>cefb8b21 Pawel Laszczak 2018-12-23  221  	case USB_REQ_SET_ADDRESS:
>
>cefb8b21 Pawel Laszczak 2018-12-23  222  		usb_decode_set_address(wValue, =
str);
>
>cefb8b21 Pawel Laszczak 2018-12-23  223  		break;
>
>cefb8b21 Pawel Laszczak 2018-12-23  224  	case USB_REQ_GET_DESCRIPTOR:
>
>cefb8b21 Pawel Laszczak 2018-12-23  225  	case USB_REQ_SET_DESCRIPTOR:
>
>cefb8b21 Pawel Laszczak 2018-12-23  226  		usb_decode_get_set_descriptor(b=
RequestType, bRequest, wValue,
>
>cefb8b21 Pawel Laszczak 2018-12-23  227  					      wIndex, wLength, str);
>
>cefb8b21 Pawel Laszczak 2018-12-23  228  		break;
>
>cefb8b21 Pawel Laszczak 2018-12-23  229  	case USB_REQ_GET_CONFIGURATION:
>
>cefb8b21 Pawel Laszczak 2018-12-23  230  		usb_decode_get_configuration(wL=
ength, str);
>
>cefb8b21 Pawel Laszczak 2018-12-23  231  		break;
>
>cefb8b21 Pawel Laszczak 2018-12-23  232  	case USB_REQ_SET_CONFIGURATION:
>
>cefb8b21 Pawel Laszczak 2018-12-23  233  		usb_decode_set_configuration(wV=
alue, str);
>
>cefb8b21 Pawel Laszczak 2018-12-23  234  		break;
>
>cefb8b21 Pawel Laszczak 2018-12-23  235  	case USB_REQ_GET_INTERFACE:
>
>cefb8b21 Pawel Laszczak 2018-12-23  236  		usb_decode_get_intf(wIndex, wLe=
ngth, str);
>
>cefb8b21 Pawel Laszczak 2018-12-23  237  		break;
>
>cefb8b21 Pawel Laszczak 2018-12-23  238  	case USB_REQ_SET_INTERFACE:
>
>cefb8b21 Pawel Laszczak 2018-12-23  239  		usb_decode_set_intf(wValue, wIn=
dex, str);
>
>cefb8b21 Pawel Laszczak 2018-12-23  240  		break;
>
>cefb8b21 Pawel Laszczak 2018-12-23  241  	case USB_REQ_SYNCH_FRAME:
>
>cefb8b21 Pawel Laszczak 2018-12-23  242  		usb_decode_synch_frame(wIndex, =
wLength, str);
>
>cefb8b21 Pawel Laszczak 2018-12-23  243  		break;
>
>cefb8b21 Pawel Laszczak 2018-12-23  244  	case USB_REQ_SET_SEL:
>
>cefb8b21 Pawel Laszczak 2018-12-23  245  		usb_decode_set_sel(wLength, str=
);
>
>cefb8b21 Pawel Laszczak 2018-12-23  246  		break;
>
>cefb8b21 Pawel Laszczak 2018-12-23  247  	case USB_REQ_SET_ISOCH_DELAY:
>
>cefb8b21 Pawel Laszczak 2018-12-23  248  		usb_decode_set_isoch_delay(wVal=
ue, str);
>
>cefb8b21 Pawel Laszczak 2018-12-23  249  		break;
>
>cefb8b21 Pawel Laszczak 2018-12-23  250  	default:
>
>cefb8b21 Pawel Laszczak 2018-12-23  251  		sprintf(str, "%02x %02x %02x %0=
2x %02x %02x %02x %02x",
>
>cefb8b21 Pawel Laszczak 2018-12-23  252  			bRequestType, bRequest,
>
>cefb8b21 Pawel Laszczak 2018-12-23 @253  			cpu_to_le16(wValue) & 0xff,
>
>cefb8b21 Pawel Laszczak 2018-12-23  254  			cpu_to_le16(wValue) >> 8,
>
>cefb8b21 Pawel Laszczak 2018-12-23  255  			cpu_to_le16(wIndex) & 0xff,
>
>cefb8b21 Pawel Laszczak 2018-12-23  256  			cpu_to_le16(wIndex) >> 8,
>
>cefb8b21 Pawel Laszczak 2018-12-23  257  			cpu_to_le16(wLength) & 0xff,
>
>cefb8b21 Pawel Laszczak 2018-12-23  258  			cpu_to_le16(wLength) >> 8);
>
>cefb8b21 Pawel Laszczak 2018-12-23  259  	}
>
>cefb8b21 Pawel Laszczak 2018-12-23  260
>
>cefb8b21 Pawel Laszczak 2018-12-23  261  	return str;
>
>cefb8b21 Pawel Laszczak 2018-12-23  262  }
>
>cefb8b21 Pawel Laszczak 2018-12-23  263  EXPORT_SYMBOL_GPL(usb_decode_ctrl=
);
>
>cefb8b21 Pawel Laszczak 2018-12-23  264
>
>
>
>:::::: The code at line 253 was first introduced by commit
>
>:::::: cefb8b2176410ef0aacc22411a64f8a157612f14 usb:common Separated decod=
ing functions from dwc3 driver.
>
>
>
>:::::: TO: Pawel Laszczak <pawell@cadence.com>
>
>:::::: CC: 0day robot <lkp@intel.com>
>
>
>
>---
>
>0-DAY kernel test infrastructure                Open Source Technology Cen=
ter
>
>https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.01.org_piperm=
ail_kbuild-
>2Dall&d=3DDwIBAg&c=3DaUq983L2pue2FqKFoP6PGHMJQyoJ7kl3s3GZ-_haXqY&r=3De1Ogx=
fvkL0qo9XO6fX1gscva-w03uSYC1nIyxl89-
>rI&m=3DJS8MUBEUPN46-me57xUY-7hoBbSrlgd2SCB9ahNjK4s&s=3D7vN3rhLkFNcUQ6jriRP=
_jESizA-Wm6VxtiGb8qhTKqU&e=3D                   Intel
>Corporation
