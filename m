From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] spi: quad: fix the name of DT property
Date: Tue, 03 Sep 2013 10:53:11 -0600
Message-ID: <522613F7.908@wwwdotorg.org>
References: <1376216117-5864-1-git-send-email-wangyuhang2014@gmail.com>
 <1378028181-5409-1-git-send-email-wangyuhang2014@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1378028181-5409-1-git-send-email-wangyuhang2014@gmail.com>
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
Cc: devicetree@vger.kernel.org, tomasz.figa@gmail.com, linux-spi@vger.kernel.org, broonie@kernel.org, linux-mtd@lists.infradead.org, pekon@ti.com
List-Id: devicetree@vger.kernel.org

On 09/01/2013 03:36 AM, wangyuhang wrote:
> spi: quad: fix the name of DT property in patch
> 
> The previous property name spi-tx-nbits and spi-rx-nbits looks not
> human-readable. To make it consistent with other devices, using property
> name spi-tx-bus-width and spi-rx-bus-width instead of the previous one
> specify the number of data wires that spi controller will work in.
> Add the specification in spi-bus.txt.

> diff --git a/Documentation/devicetree/bindings/spi/spi-bus.txt b/Documentation/devicetree/bindings/spi/spi-bus.txt

>  - spi-3wire       - (optional) Empty property indicating device requires
>      		    3-wire mode.
> +- spi-tx-bus-width - (optional) The bus width(number of data wires) that
> +                      used for MOSI. Defaults to 1 if not present.
> +- spi-rx-bus-width - (optional) The bus width(number of data wires) that
> +                      used for MISO. Defaults to 1 if not present.

The binding,
Acked-by: Stephen Warren <swarren@nvidia.com>

I would have preferred my original wording rather than the unqualified
"MOSI"/"MISO", since the meaning of those terms depends on whether
you're looking at the host controller or the device, but I guess we can
assume that since this is documentation for the host controller binding,
the naming is in terms of the host controller's signals.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
