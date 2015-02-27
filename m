From: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 4/6] ARM: DT: STi: STiH407: Add dwc3 usb3 DT node.
Date: Fri, 27 Feb 2015 10:43:53 +0000
Message-ID: <20150227104353.GB9094@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1424871377-1795-1-git-send-email-peter.griffin@linaro.org>
 <1424871377-1795-5-git-send-email-peter.griffin@linaro.org>
 <20150225151229.GE5132@x1>
 <20150225152201.GA14329@griffinp-ThinkPad-X1-Carbon-2nd>
 <20150225155005.GE6688@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150225155005.GE6688@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, kishon@ti.com, balbi@ti.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Lee,

On Wed, 25 Feb 2015, Lee Jones wrote:

> > > > +			reset-names	= "powerdown",
> > > > +					  "softreset";
> > > 
> > > Nit: What's the purpose of having these on separate lines?
> > 
> > The only reason was to stay aligned with the example in
> > Documentation/devicetree/bindings/usb/dwc3-st.txt.
> 
> But didn't you author that too? :)

Yep

> 
> I would change them both.  No need to force a line wrap if it's not required.

Ok, I'll remove it from both in v2, whilst adding the acks.

regards,

Peter.
