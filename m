From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [PATCH v14 08/13] ARM: dts: imx7: Add video mux,
 csi and mipi_csi and connections
Date: Tue, 12 Mar 2019 15:35:33 +0000
Message-ID: <m3tvg8ds1m.fsf@linaro.org>
References: <20190206151328.21629-1-rui.silva@linaro.org>
 <20190206151328.21629-9-rui.silva@linaro.org>
 <20190310214102.GA7578@pendragon.ideasonboard.com>
 <m3y35kdw7v.fsf@linaro.org>
 <20190312141046.GB4845@pendragon.ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-reply-to: <20190312141046.GB4845@pendragon.ideasonboard.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, sakari.ailus@linux.intel.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil@xs4all.nl>, Philipp Zabel <p.zabel@pengutronix.de>, Steve Longerbeam <slongerbeam@gmail.com>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Laurent,
On Tue 12 Mar 2019 at 14:10, Laurent Pinchart wrote:
> Hi Rui,
>
> On Tue, Mar 12, 2019 at 02:05:24PM +0000, Rui Miguel Silva 
> wrote:
>> On Sun 10 Mar 2019 at 21:41, Laurent Pinchart wrote:
>> > Hi Rui,
>> >
>> > Thank you for the patch.
>> 
>> Where have you been for the latest 14 versions? :)
>
> Elsewhere I suppose :-)

eheh.

>
>> This is already merged, but... follow up patches can address 
>> your
>> issues bellow.
>
> I saw the driver and DT bindings patches merged in the media 
> tree for
> v5.2, where have the DT patches been merged ?

Good question, now that you talk I do not think they were merged.

>
>> > On Wed, Feb 06, 2019 at 03:13:23PM +0000, Rui Miguel Silva 
>> > wrote:
>> >> This patch adds the device tree nodes for csi, video 
>> >> multiplexer and mipi-csi besides the graph connecting the 
>> >> necessary
>> >> endpoints to make the media capture entities to work in imx7 
>> >> Warp
>> >> board.
>> >> 
>> >> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
>> >> ---
>> >>  arch/arm/boot/dts/imx7s-warp.dts | 51 
>> >>  ++++++++++++++++++++++++++++++++
>> >>  arch/arm/boot/dts/imx7s.dtsi     | 27 +++++++++++++++++
>> >
>> > I would have split this in two patches to make backporting 
>> > easier, but it's not a big deal.
>> >
>> > Please see below for a few additional comments.
>> >
>> >>  2 files changed, 78 insertions(+)
>> >> 
>> >> diff --git a/arch/arm/boot/dts/imx7s-warp.dts 
>> >> b/arch/arm/boot/dts/imx7s-warp.dts
>> >> index 23431faecaf4..358bcae7ebaf 100644
>> >> --- a/arch/arm/boot/dts/imx7s-warp.dts
>> >> +++ b/arch/arm/boot/dts/imx7s-warp.dts
>> >> @@ -277,6 +277,57 @@
>> >>  	status = "okay";
>> >>  };
>> >>  
>> >> +&gpr {
>> >> +	csi_mux {
>> >> +		compatible = "video-mux";
>> >> +		mux-controls = <&mux 0>;
>> >> +		#address-cells = <1>;
>> >> +		#size-cells = <0>;
>> >> +
>> >> +		port@1 {
>> >> +			reg = <1>;
>> >> +
>> >> +			csi_mux_from_mipi_vc0: endpoint {
>> >> +				remote-endpoint = 
>> >> <&mipi_vc0_to_csi_mux>;
>> >> +			};
>> >> +		};
>> >> +
>> >> +		port@2 {
>> >> +			reg = <2>;
>> >> +
>> >> +			csi_mux_to_csi: endpoint {
>> >> +				remote-endpoint = 
>> >> <&csi_from_csi_mux>;
>> >> +			};
>> >> +		};
>> >> +	};
>> >> +};
>> >> +
>> >> +&csi {
>> >> +	status = "okay";
>> >> +
>> >> +	port {
>> >> +		csi_from_csi_mux: endpoint {
>> >> +			remote-endpoint = <&csi_mux_to_csi>;
>> >> +		};
>> >> +	};
>> >> +};
>> >
>> > Shouldn't these two nodes, as well as port@1 of the mipi_csi 
>> > node, be moved to imx7d.dtsi ?
>> 
>> Yeah, I guess you are right here.
>> 
>> >
>> >> +
>> >> +&mipi_csi {
>> >> +	clock-frequency = <166000000>;
>> >> +	status = "okay";
>> >> +	#address-cells = <1>;
>> >> +	#size-cells = <0>;
>> >> +	fsl,csis-hs-settle = <3>;
>> >
>> > Shouldn't this be an endpoint property ? Different sensors 
>> > connected
>> > through different endpoints could have different timing
>> > requirements.
>> 
>> Hum... I see you point, even tho the phy hs-settle is a common
>> control. 
>
> I suppose we don't need to care about DT backward compatibility 
> if we
> make changes in the bindings for v5.2 ? Would you fix this, or 
> do you
> want a patch ?

I will try to take a look at this until end of week.

---
Cheers,
	Rui
