From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH V2 2/2] spi: dual and quad support(device tree)
Date: Fri, 30 Aug 2013 23:30:46 +0200
Message-ID: <1589764.vkg6UQTo21@flatron>
References: <1377564603-4030-1-git-send-email-wangyuhang2014@gmail.com>
 <1377564603-4030-2-git-send-email-wangyuhang2014@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1377564603-4030-2-git-send-email-wangyuhang2014@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: wangyuhang <wangyuhang2014@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ian.campbell@citrix.com, pawel.moll@arm.com, swarren@wwwdotorg.org, rob.herring@calxeda.com, linux-spi@vger.kernel.org, broonie@kernel.org, linux-mtd@lists.infradead.org, pekon@ti.com, galak@codeaurora.org, sourav.poddar@ti.com
List-Id: devicetree@vger.kernel.org

Hi,

[Ccing DT binding maintainers]

On Tuesday 27 of August 2013 08:50:03 wangyuhang wrote:
> Add spi-tmax-nbits and spi-rmax-nbits for spi slave node.
> Modify the related dt document(spi-bus.txt)
>  spi-tmax-nbits:Max number of bits slave will use for MOSI(writting)
>  spi-rmax-nbits:Max number of bits slave will use for MISO(reading)
> Support for spi-tx/rmax-nbits in SPI framework has been picked[1].
> [1]: http://comments.gmane.org/gmane.linux.kernel.spi.devel/14420
> Commit Id:f477b7fb13df2b843997559ff34e87d054ba6538
> 
> Signed-off-by: wangyuhang <wangyuhang2014@gmail.com>
> ---
>  Documentation/devicetree/bindings/spi/spi-bus.txt |   16
> ++++++++++++++++ 1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-bus.txt
> b/Documentation/devicetree/bindings/spi/spi-bus.txt index
> 296015e..211336c 100644
> --- a/Documentation/devicetree/bindings/spi/spi-bus.txt
> +++ b/Documentation/devicetree/bindings/spi/spi-bus.txt
> @@ -55,6 +55,22 @@ contain the following properties.
>      		chip select active high
>  - spi-3wire       - (optional) Empty property indicating device
> requires 3-wire mode.
> +- spi-tmax-nbits  - (optional) Max number of bits slave will use for
> +    		    MOSI(writting)
> +- spi-rmax-nbits  - (optional) Max number of bits slave will use for
> +    		    MISO(reading)

May I ask for more human-readable names, please?

If we look around, there are already devices using bus-width property, so 
for consistency we could use tx-bus-width and rx-bus-width here or even a 
single bus-width property taking two cells, first tx and second rx?

Let's hear others' opinion on this as well.

Also the properties should be telling information about hardware, so 
probably in this case the meaning would be the number of wires that are 
physically wired on the board.

> +

One or two sentences about what this dual/quad thing is about would be 
nice here, e.g.

	Some SPI controllers and devices support Dual and/or Quad SPI
	mode, which is [...]. It allows [...], etc.

> +So if for example the slave has 4 wires for writting and 2 wires for
> reading, +and the spi-tx/rx-nbits property should be set as follows:
> +
> +spi-tmax-nbits = <4>;
> +spi-rmax-nbits = <2>;
> +
> +Now the value that spi-tmax-nbits and spi-rmax-nbits can receive is
> only +1(single), 2(dual) and 4(quad). If you don't set spi-tmax-nbits
> or spi-rmax-nbits, +spi_device mode will be set in single(1 wire) as
> default. Another point, if +property:spi-3wire is set, spi-t/rmax-nbits
> is forbidden to set to <2 or 4>, +otherwise, an errro will return.

typo: errro

Also an error or "returning an error" is an OS specific term. This 
statement should rather be something along

	Dual/Quad mode is not allowed when 3-wire mode is used.

Best regards,
Tomasz


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
