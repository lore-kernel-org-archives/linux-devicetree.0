From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3] ARM: dts: Add support for Liebherr's BK4 device (vf610 based)
Date: Thu, 6 Dec 2018 11:11:02 -0200
Message-ID: <CAOMZO5CUfN7uLf7bsw6Xg4+TNrRYodw11Ekg5ypqyXU6q-UFtg@mail.gmail.com>
References: <20180921152726.31742-1-lukma@denx.de> <20181009105028.17971-1-lukma@denx.de>
 <CAOMZO5BN5KJ+s6F9CJXQPX=Ta0Ow0PaV_AmFHYSDNr78jLjziQ@mail.gmail.com>
 <20181206092255.2359f7e6@jawa> <CAOMZO5CE2ei-Pu-85zpYHTg-MamMT3DahLxBHNFjX4uLEi1XWg@mail.gmail.com>
 <20181206140840.53d49cd6@jawa>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181206140840.53d49cd6@jawa>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Majewski <lukma@denx.de>
Cc: Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>, Stefan Agner <stefan@agner.ch>, Fabio Estevam <fabio.estevam@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Lukasz,

On Thu, Dec 6, 2018 at 11:08 AM Lukasz Majewski <lukma@denx.de> wrote:

> I will check this latter this week...

Reading the spi dt-binding it states that the spi slave node is optional.

If I remove it like this, then the warning is gone:

--- a/arch/arm/boot/dts/vf610-bk4.dts
+++ b/arch/arm/boot/dts/vf610-bk4.dts
@@ -109,12 +109,6 @@
        bus-num = <3>;
        status = "okay";
        spi-slave;
-
-       slave@0 {
-               compatible = "lwn,bk4";
-               spi-max-frequency = <30000000>;
-               reg = <0>;
-       };
 };

 &edma0 {

Does spi slave still work without it?
