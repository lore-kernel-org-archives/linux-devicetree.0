From: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 1/6] phy: miphy365x: Use the generic phy type constants
 in dt-bindings/phy/phy.h
Date: Fri, 27 Feb 2015 10:41:21 +0000
Message-ID: <20150227104121.GA9094@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1424871377-1795-1-git-send-email-peter.griffin@linaro.org>
 <1424871377-1795-2-git-send-email-peter.griffin@linaro.org>
 <CAL_JsqJN2ya-iDDdt63z4u=N73sMz6_N=mqQpTyf7SY7NjrAmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJN2ya-iDDdt63z4u=N73sMz6_N=mqQpTyf7SY7NjrAmA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, patrice.chotard@st.com, Kishon Vijay Abraham I <kishon@ti.com>, Felipe Balbi <balbi@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Wed, 25 Feb 2015, Rob Herring wrote:

> On Wed, Feb 25, 2015 at 7:36 AM, Peter Griffin <peter.griffin@linaro.org> wrote:
> > Now there are generic phy type constants declared in phy.h, migrate over to
> > using them rather than defining our own. This change has been done as one
> > atomic commit to be bisectable.
> 
> You should note that the values of the defines are not changed. If
> they did, that would be an ABI breakage.

Yes your right, I was intending to explicity mention that, and then didn't.
In V2 I will update the commit message, along with adding the Ack's.

regards,

Peter.
