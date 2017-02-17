From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v4 07/36] ARM: dts: imx6-sabresd: add OV5642 and OV5640
 camera sensors
Date: Thu, 16 Feb 2017 22:51:47 -0200
Message-ID: <CAOMZO5AHJ2jSWvF1iZKhYyDAMmpg99R4-gz4ZyDZAcB4b3d0ag@mail.gmail.com>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
 <1487211578-11360-8-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1487211578-11360-8-git-send-email-steve_longerbeam@mentor.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Steve Longerbeam <slongerbeam@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, sakari.ailus@linux.intel.com, nick@shmanahar.org, songjun.wu@microchip.com, Hans Verkuil <hverkuil@xs4all.nl>, Steve Longerbeam <steve_longerbeam@mentor.com>, Pavel Machek <pavel@ucw.cz>, Robert Jarzmik <robert.jarzmik@free.fr>, devel@driverdev.osuosl.org, markus.heiser@darmarit.de, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, shuah@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-media <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, mchehab@kernel.org, bparrot@ti.com, "robh+dt@kernel.org" <robh+dt@kernel.org>, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.inf
List-Id: devicetree@vger.kernel.org

Hi Steve,

On Thu, Feb 16, 2017 at 12:19 AM, Steve Longerbeam
<slongerbeam@gmail.com> wrote:
> Enables the OV5642 parallel-bus sensor, and the OV5640 MIPI CSI-2 sensor.
>
> The OV5642 connects to the parallel-bus mux input port on ipu1_csi0_mux.
>
> The OV5640 connects to the input port on the MIPI CSI-2 receiver on
> mipi_csi.
>
> Until the OV5652 sensor module compatible with the SabreSD becomes
> available for testing, the ov5642 node is currently disabled.

You missed your Signed-off-by.
