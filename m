From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 03/39] [media] dt/bindings: Add bindings for OV5640
Date: Mon, 3 Apr 2017 09:15:32 -0500
Message-ID: <20170403141532.g6lpmyh2xdlc6gjz@rob-hp-laptop>
References: <1490661656-10318-1-git-send-email-steve_longerbeam@mentor.com>
 <1490661656-10318-4-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1490661656-10318-4-git-send-email-steve_longerbeam@mentor.com>
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
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, sakari.ailus@linux.intel.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, pavel@ucw.cz, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, linux@armlinux.org.uk, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, Steve Longerbeam <steve_longerbeam@mentor.com>, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, p.zabel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, Mar 27, 2017 at 05:40:20PM -0700, Steve Longerbeam wrote:
> Add device tree binding documentation for the OV5640 camera sensor.
> 
> Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
> ---
>  .../devicetree/bindings/media/i2c/ov5640.txt       | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5640.txt

I already acked this. Please add acks when posting new versions.

Rob
