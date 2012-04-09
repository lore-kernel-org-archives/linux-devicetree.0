From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/7] of: add clock providers
Date: Tue, 10 Apr 2012 07:42:47 +0800
Message-ID: <20120409234241.GE18692@S2101-09.ap.freescale.net>
References: <1331680947-29861-1-git-send-email-robherring2@gmail.com>
 <1331680947-29861-3-git-send-email-robherring2@gmail.com>
 <20120409115549.GB18692@S2101-09.ap.freescale.net>
 <4F82E9A3.1030606@gmail.com>
 <20120409141347.GC18692@S2101-09.ap.freescale.net>
 <4F82F386.7080303@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F82F386.7080303-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 09, 2012 at 09:34:46AM -0500, Rob Herring wrote:
> On 04/09/2012 09:13 AM, Shawn Guo wrote:
...
> >
> > 	uart_serial_clk: uart-baud {
> > 		compatible = "fsl,imx6q-clock";
> > 		#clock-cells = <0>;
> > 		/* clocks = <&ipg_per_clk>; */
> > 		clocks = <???>;
> 
> This is a provider node not a consumer, so you don't have a clocks
> property.

To me, any clock except root is not only a provider but also a consumer.
If "clocks" property is required for a consumer ...

> You could, but then you need the parent clock defined in the DT.
> 
..., then we need to define the entire clock tree in the DT.

> The compatible property here looks too generic. In the CCM code, how do
> you match it to the uart baud clock? You shouldn't be using the name.
> 
The code was copied from my early implementation which gets the entire
clock tree and every clock (reg, bits, shift) represented in DT, and I
do not need to map it to CCM code at all.

> You need to first decide if you are going to define each clock in the DT

That was my preference, but it brings too many clock nodes into DT.

> or just the whole CCM as a node.
> You can't really do something in the
> middle or be evolving it over time. You could perhaps make the PLLs be
> separate nodes and inputs to the CCM. As they really are separate h/w
> blocks.

I do not understand this part.

-- 
Regards,
Shawn
