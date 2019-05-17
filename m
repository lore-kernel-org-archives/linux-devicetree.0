From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: stm32: Document Avenger96
 devicetree binding
Date: Fri, 17 May 2019 09:24:40 +0530
Message-ID: <20190517035440.GA12863@Mani-XPS-13-9360>
References: <20190506100534.24145-1-manivannan.sadhasivam@linaro.org>
 <20190506100534.24145-2-manivannan.sadhasivam@linaro.org>
 <20190513180246.GA8487@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190513180246.GA8487@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, loic.pallardy@st.com
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Mon, May 13, 2019 at 01:02:46PM -0500, Rob Herring wrote:
> On Mon, May 06, 2019 at 03:35:32PM +0530, Manivannan Sadhasivam wrote:
> > Document devicetree binding for Avenger96 board.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/arm/stm32/stm32.txt | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.txt b/Documentation/devicetree/bindings/arm/stm32/stm32.txt
> > index 6808ed9ddfd5..eba363a4b514 100644
> > --- a/Documentation/devicetree/bindings/arm/stm32/stm32.txt
> > +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.txt
> > @@ -8,3 +8,9 @@ using one of the following compatible strings:
> >    st,stm32f746
> >    st,stm32h743
> >    st,stm32mp157
> > +
> > +Boards:
> > +
> > +Root node property compatible must contain one of below depending on board:
> > +
> > + - Avenger96: "arrow,stm32mp157a-avenger96"
> 
> With which SoC compatible?
> 

I referred some other platform bindings (non YAML) and they don't
mention the SoC compatible with boards. Shall I just put it like below?

Avenger96: "arrow,stm32mp157a-avenger96", "st,stm32mp157"

Thanks,
Mani

Thanks,
Mani

> > -- 
> > 2.17.1
> > 
