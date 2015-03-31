From: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH v2 1/6] phy: miphy365x: Use the generic phy type
 constants in dt-bindings/phy/phy.h
Date: Tue, 31 Mar 2015 09:01:54 +0100
Message-ID: <20150331080154.GA2029@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1427728632-10846-1-git-send-email-peter.griffin@linaro.org>
 <1427728632-10846-2-git-send-email-peter.griffin@linaro.org>
 <551A2D4D.1010601@ti.com>
 <20150331074027.GH9447@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150331074027.GH9447@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, balbi@ti.com, devicetree@vger.kernel.org, robherring2@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Lee,

On Tue, 31 Mar 2015, Lee Jones wrote:
> On Tue, 31 Mar 2015, Kishon Vijay Abraham I wrote:
> 
> > Hi Patrice, Maxime,
> > 
> > On Monday 30 March 2015 08:47 PM, Peter Griffin wrote:
> > >Now there are generic phy type constants declared in phy.h, migrate over to
> > >using them rather than defining our own. This change has been done as one
> > >atomic commit to be bisectable.
> > >
> > >Note: The values of the defines are the same, so there is no ABI breakage
> > >with this patch.
> > >
> > >Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > >Acked-by: Rob Herring <robh@kernel.org>
> > >Acked-by: Lee Jones <lee.jones@linaro.org>
> > 
> > Are you okay for this patch to go via PHY tree? It modifies arch/arm/boot/dts
> > /stih416.dtsi.
> 
> These files need to be changed simultaneously in order to prevent
> breakage during bisection and the like.

That is why it has been authored as one atomic commit. See commit message above.

regards,

Peter
