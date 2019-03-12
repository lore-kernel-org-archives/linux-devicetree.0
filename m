From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 06/12] media: dt-bindings: add bindings for i.MX7
 media driver
Date: Tue, 12 Mar 2019 17:10:53 +0200
Message-ID: <20190312151053.GD4845@pendragon.ideasonboard.com>
References: <20180517125033.18050-1-rui.silva@linaro.org>
 <20180517125033.18050-7-rui.silva@linaro.org>
 <20180518065824.csio2fgwsxo2g2ow@valkosipuli.retiisi.org.uk>
 <m3tvr5xt9t.fsf@linaro.org>
 <20190310214834.GB7578@pendragon.ideasonboard.com>
 <m3wol4dw55.fsf@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <m3wol4dw55.fsf@linaro.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, sakari.ailus@linux.intel.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ryan Harkin <ryan.harkin@linaro.org>, Rob Herring <robh+dt@kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>, Philipp Zabel <p.zabel@pengutronix.de>, Steve Longerbeam <slongerbeam@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, mchehab@kernel.org, Shawn Guo <shawnguo@kernel.org>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rui,

On Tue, Mar 12, 2019 at 02:07:02PM +0000, Rui Miguel Silva wrote:
> On Sun 10 Mar 2019 at 21:48, Laurent Pinchart wrote:
> > On Fri, May 18, 2018 at 09:27:58AM +0100, Rui Miguel Silva wrote:
> >> On Fri 18 May 2018 at 06:58, Sakari Ailus wrote:
> >>> On Thu, May 17, 2018 at 01:50:27PM +0100, Rui Miguel Silva wrote:
> >>>> Add bindings documentation for i.MX7 media drivers.
> >>>> 
> >>>> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> >>>> ---
> >>>>  .../devicetree/bindings/media/imx7.txt        | 145 ++++++++++++++++++
> >>>>  1 file changed, 145 insertions(+)
> >>>>  create mode 100644 
> >>>>  Documentation/devicetree/bindings/media/imx7.txt
> >>>> 1
> >>>> diff --git 
> >>>> a/Documentation/devicetree/bindings/media/imx7.txt 
> >>>> b/Documentation/devicetree/bindings/media/imx7.txt
> >>>> new file mode 100644
> >>>> index 000000000000..161cff8e6442
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/media/imx7.txt
> >>>> @@ -0,0 +1,145 @@
> >>>> +Freescale i.MX7 Media Video Device
> >>>> +==================================
> >>>> +
> >>>> +Video Media Controller node
> >>>> +---------------------------
> >>>
> >>> Note that DT bindings document the hardware, they are as such 
> >>> not Linux dependent.
> >> 
> >> This was removed in this series, however I removed it in the wrong
> >> patch, If you see patch 11/12 you will see this being removed. I
> >> will fix this in v5. Thanks for notice it.
> >> 
> >>>> +
> >>>> +This is the media controller node for video capture  support. It is a
> >>>> +virtual device that lists the camera serial interface nodes that the
> >>>> +media device will control.
> >>>
> >>> Ditto.
> >>>
> >>>> +
> >>>> +Required properties:
> >>>> +- compatible : "fsl,imx7-capture-subsystem";
> >>>> +- ports      : Should contain a list of phandles pointing to camera
> >>>> +		sensor interface port of CSI
> >>>> +
> >>>> +example:
> >>>> +
> >>>> +capture-subsystem {
> >>>
> >>> What's the purpose of this node, if you only refer to another 
> >>> device? This one rather does not look like a real device at 
> >>> all.
> >>>
> >>>> +	compatible = "fsl,imx7-capture-subsystem";
> >>>> +	ports = <&csi>;
> >>>> +};
> >>>> +
> >>>> +
> >>>> +mipi_csi2 node
> >>>> +--------------
> >>>> +
> >>>> +This is the device node for the MIPI CSI-2 receiver core in i.MX7 SoC. It is
> >>>> +compatible with previous version of Samsung D-phy.
> >>>> +
> >>>> +Required properties:
> >>>> +
> >>>> +- compatible    : "fsl,imx7-mipi-csi2";
> >>>> +- reg           : base address and length of the register set for the device;
> >>>> +- interrupts    : should contain MIPI CSIS interrupt;
> >>>> +- clocks        : list of clock specifiers, see
> >>>> + 
> >>>> Documentation/devicetree/bindings/clock/clock-bindings.txt for details;
> >>>> +- clock-names   : must contain "pclk", "wrap" and "phy" entries, matching
> >>>> +                  entries in the clock property;
> >>>> +- power-domains : a phandle to the power domain, see
> >>>> + 
> >>>> Documentation/devicetree/bindings/power/power_domain.txt for details.
> >>>> +- reset-names   : should include following entry "mrst";
> >>>> +- resets        : a list of phandle, should contain reset entry of
> >>>> +                  reset-names;
> >>>> +- phy-supply    : from the generic phy bindings, a phandle to a regulator that
> >>>> +	          provides power to MIPI CSIS core;
> >>>> +- bus-width     : maximum number of data lanes supported (SoC specific);
> >>>> +
> >>>> +Optional properties:
> >>>> +
> >>>> +- clock-frequency : The IP's main (system bus) clock frequency in Hz, default
> >>>> +		    value when this property is not specified is 166 MHz;
> >>>> +
> >>>> +port node
> >>>> +---------
> >>>> +
> >>>> +- reg		  : (required) can take the values 0 or 1, where 0 is the
> >>>> +                     related sink port and port 1 should be the source one;
> >>>> +
> >>>> +endpoint node
> >>>> +-------------
> >>>> +
> >>>> +- data-lanes    : (required) an array specifying active physical MIPI-CSI2
> >>>> +		    data input lanes and their mapping to logical lanes; the
> >>>> +		    array's content is unused, only its length is meaningful;
> >>>> +
> >>>> +- fsl,csis-hs-settle : (optional) differential receiver (HS-RX) settle time;
> >>>
> >>> Could you calculate this, as other drivers do? It probably 
> >>> changes> depending on the device runtime configuration.
> >> 
> >> The only reference to possible values to this parameter is given by
> >> table in [0], can you point me out the formula for imx7 in the
> >> documentation?
> >> 
> >> [0] https://community.nxp.com/thread/463777
> >
> > Can't you use the values from that table ? :-) You can get the 
> > link speed by querying the connected subdev and reading its
> > V4L2_CID_PIXEL_RATE control.
> 
> Yeah, I good point to add support for others subdev's. I will try
> to add your comments in a follow up series.

Just for my information (no commitment), do you know the timeframe for
that ?

-- 
Regards,

Laurent Pinchart
