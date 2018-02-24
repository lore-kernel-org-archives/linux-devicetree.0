From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH] dt-bindings: iio: adc: stm32-dfsdm: fix types, add
 missing pinctrl
Date: Sat, 24 Feb 2018 13:11:37 +0000
Message-ID: <20180224131137.1b2a79f3@archlinux>
References: <1519384260-23875-1-git-send-email-fabrice.gasnier@st.com>
 <7e40cdfc-8d9f-ccfb-f3fd-8d639a87d5b0@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <7e40cdfc-8d9f-ccfb-f3fd-8d639a87d5b0@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, benjamin.gaignard@linaro.org, lars@metafoo.de, alexandre.torgue@st.com, linux-iio@vger.kernel.org, pmeerw@pmeerw.net, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de, Fabrice Gasnier <fabrice.gasnier@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, 23 Feb 2018 14:47:36 +0100
Arnaud Pouliquen <arnaud.pouliquen@st.com> wrote:

> Hello,
> 
> Acked-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

I'm feeling conservative today so will be wanting a devicetree
maintainer ack for this one..

Jonathan

> 
> Regards,
> Arnaud
> 
> On 02/23/2018 12:11 PM, Fabrice Gasnier wrote:
> > - Add missing pinctrl description. Support is made optional as dfsdm
> >   may use internal sources (e.g. via registers)
> > - Fix typo in IIO STM32 DFSDM filter "MANCH_F" description.
> > Basically, this should be "falling edge = logic 0", not "1" that applies
> > to "MANCH_R".
> > BTW, make the description complete by describing both rising/falling
> > edges as described in reference manuals.
> > 
> > Fixes: 6c82f947fc97 ("IIO: add DT bindings for stm32 DFSDM filter")
> > 
> > Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> > ---
> >  Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.txt | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.txt b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.txt
> > index 911492da..ed7520d 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.txt
> > +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.txt
> > @@ -32,6 +32,10 @@ Optional properties:
> >  		  to "clock" property. Frequency must be a multiple of the rcc
> >  		  clock frequency. If not, SPI CLKOUT frequency will not be
> >  		  accurate.
> > +- pinctrl-names:	Set to "default".
> > +- pinctrl-0:		List of phandles pointing to pin configuration
> > +			nodes to set pins in mode of operation for dfsdm
> > +			on external pin.
> >  
> >  Contents of a STM32 DFSDM child nodes:
> >  --------------------------------------
> > @@ -68,8 +72,8 @@ Optional properties:
> >  - st,adc-channel-types:	Single-ended channel input type.
> >  			- "SPI_R": SPI with data on rising edge (default)
> >  			- "SPI_F": SPI with data on falling edge
> > -			- "MANCH_R": manchester codec, rising edge = logic 0
> > -			- "MANCH_F": manchester codec, falling edge = logic 1
> > +			- "MANCH_R": manchester codec, rising edge = logic 0, falling edge = logic 1
> > +			- "MANCH_F": manchester codec, rising edge = logic 1, falling edge = logic 0
> >  - st,adc-channel-clk-src: Conversion clock source.
> >  			  - "CLKIN": external SPI clock (CLKIN x)
> >  			  - "CLKOUT": internal SPI clock (CLKOUT) (default)
> >   
