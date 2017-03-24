From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3, 4/4] dt-bindings: mtd: Add Octal SPI support to
 Cadence QSPI.
Date: Fri, 24 Mar 2017 10:56:04 -0500
Message-ID: <20170324155604.2qwk3x3tz7bk5son@rob-hp-laptop>
References: <1490008935-28900-1-git-send-email-jartur@cadence.com>
 <1490009254-4284-1-git-send-email-jartur@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1490009254-4284-1-git-send-email-jartur@cadence.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Artur Jedrysek <jartur@cadence.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 20, 2017 at 11:27:34AM +0000, Artur Jedrysek wrote:
> This patch updates Cadence QSPI Device Tree documentation to include
> information about new compatible used to indicate, whether or not
> Octal SPI transfers are supported by the device.
> 
> Signed-off-by: Artur Jedrysek <jartur@cadence.com>
> ---
> Changelog:
> v2: Use new compatible, instead of boolean property, to indicate
> Octal SPI support.
> ---
> v3: Changes according to comments.
> ---
>  Documentation/devicetree/bindings/mtd/cadence-quadspi.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
