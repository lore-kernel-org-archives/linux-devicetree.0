From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2] ARM: dts: r9a06g032: Correct UART and add all other
 UARTs
Date: Fri, 14 Sep 2018 15:36:01 +0200
Message-ID: <20180914133600.nhbgbmxiafc65abw@verge.net.au>
References: <20180910160254.3882-1-phil.edworthy@renesas.com>
 <20180912092035.lhzlebd6rh72yjgj@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180912092035.lhzlebd6rh72yjgj@verge.net.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 12, 2018 at 11:20:39AM +0200, Simon Horman wrote:
> On Mon, Sep 10, 2018 at 05:02:54PM +0100, Phil Edworthy wrote:
> > - UART0 was missing the bus clock ("apb_pclk").
> > - Now that the relevant rzn1 bindings have been added, replace the Synopsys
> >   compat string with the rzn1 strings.
> 
> Perhaps: Use recently accepted r9a06g032 and rzn1 compat strings.
> 
> > - Add all the other UARTs.
> > 
> > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> 
> The above notwithstanding this looks good to me but I will wait to see if
> there are other reviews before applying.
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks again, I have applied this for v4.20 with the changelog
update above.
