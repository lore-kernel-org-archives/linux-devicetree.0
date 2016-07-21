From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 2/2] [media] atmel-isc: DT binding for Image Sensor
 Controller driver
Date: Thu, 21 Jul 2016 17:03:30 -0500
Message-ID: <20160721220330.GA17291@rob-hp-laptop>
References: <1469088900-23935-1-git-send-email-songjun.wu@microchip.com>
 <1469088900-23935-3-git-send-email-songjun.wu@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1469088900-23935-3-git-send-email-songjun.wu@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Songjun Wu <songjun.wu@microchip.com>
Cc: nicolas.ferre@atmel.com, laurent.pinchart@ideasonboard.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 21, 2016 at 04:14:58PM +0800, Songjun Wu wrote:
> DT binding documentation for ISC driver.
> 
> Signed-off-by: Songjun Wu <songjun.wu@microchip.com>
> ---
> 
> Changes in v6:
> - Add "iscck" and "gck" to clock-names.
> 
> Changes in v5:
> - Add clock-output-names.
> 
> Changes in v4:
> - Remove the isc clock nodes.
> 
> Changes in v3:
> - Remove the 'atmel,sensor-preferred'.
> - Modify the isc clock node according to the Rob's remarks.
> 
> Changes in v2:
> - Remove the unit address of the endpoint.
> - Add the unit address to the clock node.
> - Avoid using underscores in node names.
> - Drop the "0x" in the unit address of the i2c node.
> - Modify the description of 'atmel,sensor-preferred'.
> - Add the description for the ISC internal clock.
> 
>  .../devicetree/bindings/media/atmel-isc.txt        | 65 ++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/atmel-isc.txt

Acked-by: Rob Herring <robh@kernel.org>
