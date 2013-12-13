From: Peter Chen <hzpeterchen@gmail.com>
Subject: Re: [PATCH v6 01/15] usb: doc: phy-mxs: Add more compatible strings
Date: Fri, 13 Dec 2013 15:24:07 +0800
Message-ID: <CAL411-rt=_O5qaO_=AHps-LgrNyGwLdFSoCHk2POEn_p-Sn5qg@mail.gmail.com>
References: <1386897825-6130-1-git-send-email-peter.chen@freescale.com>
 <1386897825-6130-2-git-send-email-peter.chen@freescale.com> <20131213081545.0185d3cb@ipc1.ka-ro>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20131213081545.0185d3cb@ipc1.ka-ro>
Sender: linux-doc-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Lothar_Wa=DFmann?= <LW@karo-electronics.de>
Cc: Peter Chen <peter.chen@freescale.com>, =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>, devicetree@vger.kernel.org, m.grzeschik@pengutronix.de, frank.li@freescale.com, linux-doc@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, rob.herring@calxeda.com, "balbi@ti.com" <balbi@ti.com>, kernel@pengutronix.de, grant.likely@linaro.org, Shawn Guo <shawn.guo@linaro.org>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 13, 2013 at 3:15 PM, Lothar Wa=DFmann <LW@karo-electronics.=
de> wrote:
> Hi,
>
> Peter Chen wrote:
>> Add "fsl,imx6q-usbphy" for imx6dq and imx6dl, add
>> "fsl,imx6sl-usbphy" for imx6sl.
>>
>> Signed-off-by: Peter Chen <peter.chen@freescale.com>
>> ---
>>  Documentation/devicetree/bindings/usb/mxs-phy.txt |    3 ++-
>>  1 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/mxs-phy.txt b/Doc=
umentation/devicetree/bindings/usb/mxs-phy.txt
>> index 5835b27..d850e55 100644
>> --- a/Documentation/devicetree/bindings/usb/mxs-phy.txt
>> +++ b/Documentation/devicetree/bindings/usb/mxs-phy.txt
>> @@ -1,7 +1,8 @@
>>  * Freescale MXS USB Phy Device
>>
>>  Required properties:
>> -- compatible: Should be "fsl,imx23-usbphy"
>> +- compatible: "fsl,imx23-usbphy" for imx23 and imx28, "fsl,imx6q-us=
bphy"
>> +for imx6dq and imx6dl, "fsl,imx6sl-usbphy" for imx6sl
>>
> indentation?
>

How many characters? 2 or 8?

BR,
Peter Chen
