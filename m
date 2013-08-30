From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V2 2/2] spi: dual and quad support(device tree)
Date: Fri, 30 Aug 2013 15:26:44 -0600
Message-ID: <52210E14.8020006@wwwdotorg.org>
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
Cc: devicetree@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, linux-spi@vger.kernel.org, broonie@kernel.org, linux-mtd@lists.infradead.org, pekon@ti.com, sourav.poddar@ti.com
List-Id: devicetree@vger.kernel.org

On 08/26/2013 06:50 PM, wangyuhang wrote:
> Add spi-tmax-nbits and spi-rmax-nbits for spi slave node.
> Modify the related dt document(spi-bus.txt)
>  spi-tmax-nbits:Max number of bits slave will use for MOSI(writting)
>  spi-rmax-nbits:Max number of bits slave will use for MISO(reading)
> Support for spi-tx/rmax-nbits in SPI framework has been picked[1].
> [1]: http://comments.gmane.org/gmane.linux.kernel.spi.devel/14420
> Commit Id:f477b7fb13df2b843997559ff34e87d054ba6538

> diff --git a/Documentation/devicetree/bindings/spi/spi-bus.txt b/Documentation/devicetree/bindings/spi/spi-bus.txt

> +- spi-tmax-nbits  - (optional) Max number of bits slave will use for
> +    		    MOSI(writting)
> +- spi-rmax-nbits  - (optional) Max number of bits slave will use for
> +    		    MISO(reading)

I would suggest the property names

spi-tx-num-wires, spi-rx-num-wires

or:

spi-tx-bus-width, spi-rx-bus-width (this option from Tomasz Figa on IRC)

Those name alone self-document their purpose much more clearly to me.

I would also change the descriptions a bit, resulting in the following
overall:

==========
- spi-tx-num-wires  - (optional) The number of data wires that
                      transfer data from the SPI controller to the
                      SPI device. Defaults to 1 if not present.
- spi-rx-num-wires  - (optional) The number of data wires that
                      transfer data from the SPI device to the
                      SPI controller. Defaults to 1 if not present.
==========

> +So if for example the slave has 4 wires for writting and 2 wires for reading,
> +and the spi-tx/rx-nbits property should be set as follows:
> +
> +spi-tmax-nbits = <4>;
> +spi-rmax-nbits = <2>;
> +
> +Now the value that spi-tmax-nbits and spi-rmax-nbits can receive is only
> +1(single), 2(dual) and 4(quad). If you don't set spi-tmax-nbits or spi-rmax-nbits,
> +spi_device mode will be set in single(1 wire) as default. Another point, if
> +property:spi-3wire is set, spi-t/rmax-nbits is forbidden to set to <2 or 4>,
> +otherwise, an errro will return.

I think most of that explanation can be removed if you use the text I
wrote above.

I'm not sure you should ban spi-3wire if those properties are specified;
can't all those properties be present together, if the num-wires are set
to 1? Actually, isn't spi-3write the default; what does that property mean?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
