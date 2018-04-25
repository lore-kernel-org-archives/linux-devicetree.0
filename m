From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 4/5] ARM: dts: imx6sx-sabreauto: add fec support
Date: Wed, 25 Apr 2018 10:46:48 -0300
Message-ID: <CAOMZO5AS=aH8p1+tmgJ4ooeqExNqOALh7vbPAsQdqdky8CkXyQ@mail.gmail.com>
References: <1524455219-6736-1-git-send-email-Anson.Huang@nxp.com>
 <1524455219-6736-4-git-send-email-Anson.Huang@nxp.com> <CAOMZO5CDAQtw7Q6NgSzKP4ogaqRaGSE0A+st1iqZ=cQsK49moQ@mail.gmail.com>
 <AM3PR04MB131566E1C8033D256686F192F5880@AM3PR04MB1315.eurprd04.prod.outlook.com>
 <CAOMZO5Dm=MFRoh=y54Qf2RrncWfQPTUJ2ZNfvYnUD=idp8RPNA@mail.gmail.com>
 <AM3PR04MB1315ED599A20F67BB9FEFEE1F58F0@AM3PR04MB1315.eurprd04.prod.outlook.com>
 <AM3PR04MB1315B04BE46755E3EB82E04CF58F0@AM3PR04MB1315.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM3PR04MB1315B04BE46755E3EB82E04CF58F0@AM3PR04MB1315.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dl-linux-imx <linux-imx@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Anson,

On Wed, Apr 25, 2018 at 2:36 AM, Anson Huang <anson.huang@nxp.com> wrote:

> Sorry, I made a mistake here, the MAX7320 IO0 is for adjusting FEC1's voltage,

In this case you need to pass the 'phy-supply' property inside the fec
node and add a regulator that is controlled via MAX7320 IO0 pin.
