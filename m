From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH V8 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash Controller driver.
Date: Thu, 27 Aug 2015 20:12:51 +0200
Message-ID: <201508272012.51185.marex@denx.de>
References: <1440148851-14621-1-git-send-email-marex@denx.de> <55DF4C82.3070708@st.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55DF4C82.3070708-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vikas <vikas.manocha-qxv4g6HH51o@public.gmane.org>
Cc: "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday, August 27, 2015 at 07:44:34 PM, vikas wrote:
> Hi,
> 
> On 08/21/2015 02:20 AM, Marek Vasut wrote:
> > From: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > 
> > Add binding document for the Cadence QSPI controller.
> > 
> > Signed-off-by: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> > Cc: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> > Cc: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > Cc: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > Cc: Vikas MANOCHA <vikas.manocha-qxv4g6HH51o@public.gmane.org>
> > Cc: Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > ---
> > 
> >  .../devicetree/bindings/mtd/cadence-quadspi.txt    | 56
> >  ++++++++++++++++++++++ 1 file changed, 56 insertions(+)
> >  create mode 100644
> >  Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> > 
> > V2: Add cdns prefix to driver-specific bindings.
> > V3: Use existing property "is-decoded-cs" instead of creating a
> > 
> >     duplicate, "ext-decoder". Timing parameters are in nanoseconds,
> >     not master reference clocks. Remove bus-num completely.
> > 
> > V4: Add new properties fifo-width and trigger-address
> > V7: - Prefix all of the Cadence-specific properties with cdns prefix,
> > 
> >       those are in particular "cdns,is-decoded-cs", "cdns,fifo-depth",
> >       "cdns,fifo-width", "cdns,trigger-address".
> >     
> >     - Drop bogus properties which were not used and were incorrect.
> > 
> > V8: Align lines to 80 chars.
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> > b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt new file
> > mode 100644
> > index 0000000..f248056
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> > @@ -0,0 +1,56 @@
> > +* Cadence Quad SPI controller
> > +
> > +Required properties:
> > +- compatible : Should be "cdns,qspi-nor".
> > +- reg : Contains two entries, each of which is a tuple consisting of a
> > +	physical address and length. The first entry is the address and
> > +	length of the controller register set. The second entry is the
> > +	address and length of the QSPI Controller data area.
> 
> still hooked up with  "Controller data area", it is ambiguous.
> Use something which is more clear: Nor Flash memory mapped address.

I have to disagree, I will call it whatever it is called in the datasheet
and it is called "controller data area".

> > +- interrupts : Unit interrupt specifier for the controller interrupt.
> > +- clocks : phandle to the Quad SPI clock.
> > +- cdns,fifo-depth : Size of the data FIFO in words.
> > +- cdns,fifo-width : Bus width of the data FIFO in bytes.
> > +- cdns,trigger-address : 32-bit indirect AHB trigger address.
> > +
> 
> > +Optional properties:
> again, is it optional ? can the driver be used without these properties ?

Why wouldn't it be possible to use the driver with no SPI NOR attached to
it? It's a cornercase, but still a valid one.

> > +- cdns,is-decoded-cs : Flag to indicate whether decoder is used or not.
> 
> again, add info what the decoder is for ?

This is something Graham has to clarify. Based on the code (I'm sure you did
check the code), it's a 4:16 demuxer.

> > +
> > +Optional subnodes:
> > +Subnodes of the Cadence Quad SPI controller are spi slave nodes with
> > additional +custom properties:
> > +- cdns,read-delay : Delay for read capture logic, in clock cycles
> > +- cdns,tshsl-ns : Delay in nanoseconds for the length that the master
> > +                  mode chip select outputs are de-asserted between
> > +		  transactions.
> > +- cdns,tsd2d-ns : Delay in nanoseconds between one chip select being
> > +                  de-activated and the activation of another.
> > +- cdns,tchsh-ns : Delay in nanoseconds between last bit of current
> > +                  transaction and deasserting the device chip select
> > +		  (qspi_n_ss_out).
> > +- cdns,tslch-ns : Delay in nanoseconds between setting qspi_n_ss_out low
> > +                  and first bit transfer.
> > +
> > +Example:
> > +
> > +	qspi: spi@ff705000 {
> > +		compatible = "cdns,qspi-nor";
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		reg = <0xff705000 0x1000>,
> > +		      <0xffa00000 0x1000>;
> > +		interrupts = <0 151 4>;
> > +		clocks = <&qspi_clk>;
> > +		cdns,is-decoded-cs;
> 
> flag value ?

Sorry, I don't quite understand the question. If you mean why there is no
value, it's because this is a boolean OF node, which just does't need to
have a value ; it's either present or not.

Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
