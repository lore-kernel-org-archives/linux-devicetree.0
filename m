From: Steve Longerbeam <steve_longerbeam@mentor.com>
Subject: Re: [PATCH v6 02/39] [media] dt-bindings: Add bindings for i.MX media
 driver
Date: Tue, 28 Mar 2017 17:35:52 -0700
Message-ID: <70bacfb5-aef1-76d1-37d2-23a524903d45@mentor.com>
References: <1490661656-10318-1-git-send-email-steve_longerbeam@mentor.com>
 <1490661656-10318-3-git-send-email-steve_longerbeam@mentor.com>
 <CAL_JsqJm_JjuVPcOBERCqsnjTDdNoKr9xRE9MXMO4ivxGath2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <CAL_JsqJm_JjuVPcOBERCqsnjTDdNoKr9xRE9MXMO4ivxGath2Q@mail.gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Rob Herring <robh+dt@kernel.org>, Steve Longerbeam <slongerbeam@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, =?UTF-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?= <andrew-ct.chen@mediatek.com>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Nick Dyer <nick@shmanahar.org>, Songjun Wu <songjun.wu@microchip.com>, Hans Verkuil <hverkuil@xs4all.nl>, Pavel Machek <pavel@ucw.cz>, Robert Jarzmik <robert.jarzmik@free.fr>, devel@driverdev.osuosl.org, markus.heiser@darmarit.de, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, shuah@kernel.org, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Benoit Parrot <bparrot@ti.com>, Simon
List-Id: devicetree@vger.kernel.org



On 03/28/2017 05:21 PM, Rob Herring wrote:
> On Mon, Mar 27, 2017 at 7:40 PM, Steve Longerbeam <slongerbeam@gmail.com> wrote:
>> Add bindings documentation for the i.MX media driver.
>>
>> <snip>
>> +
>> +mipi_csi2 node
>> +--------------
>> +
>> +This is the device node for the MIPI CSI-2 Receiver, required for MIPI
>> +CSI-2 sensors.
>> +
>> +Required properties:
>> +- compatible   : "fsl,imx6-mipi-csi2", "snps,dw-mipi-csi2";
>
> As I mentioned in v5, there's a DW CSI2 binding in progress. This
> needs to be based on that.

Hi Rob, I'm not sure what you are asking me to do.

I assume if there's another binding doc in progress, it means
someone is working on another Synopsys DW CSI-2 subdevice driver.

Unfortunately I don't have the time to contribute and switch to
this other subdevice, and do test/debug.

For now I would prefer if this patchset is merged as is, and
then contribute/switch to another CSI-2 subdev later. It is
also getting very difficult managing all these patches (39 as
of this version), and I'd prefer not to spam the lists with
such large patchsets for too much longer.


Steve
