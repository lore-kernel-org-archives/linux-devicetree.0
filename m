From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 1/3] ARM: STi: Add DT defines for co-processor reset
 lines
Date: Tue, 12 Jan 2016 14:41:39 +0100
Message-ID: <1452606099.4292.20.camel@pengutronix.de>
References: <1445856969-19424-1-git-send-email-lee.jones@linaro.org>
	 <20160112133437.GH27358@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160112133437.GH27358@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, maxime.coquelin@st.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Lee,

Am Dienstag, den 12.01.2016, 13:34 +0000 schrieb Lee Jones:
> On Mon, 26 Oct 2015, Lee Jones wrote:
> 
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  include/dt-bindings/reset-controller/stih407-resets.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/include/dt-bindings/reset-controller/stih407-resets.h b/include/dt-bindings/reset-controller/stih407-resets.h
> > index 02d4328..4ab3a1c 100644
> > --- a/include/dt-bindings/reset-controller/stih407-resets.h
> > +++ b/include/dt-bindings/reset-controller/stih407-resets.h
> > @@ -52,6 +52,10 @@
> >  #define STIH407_KEYSCAN_SOFTRESET	26
> >  #define STIH407_USB2_PORT0_SOFTRESET	27
> >  #define STIH407_USB2_PORT1_SOFTRESET	28
> > +#define STIH407_ST231_AUD_SOFTRESET	29
> > +#define STIH407_ST231_DMU_SOFTRESET	30
> > +#define STIH407_ST231_GP0_SOFTRESET	31
> > +#define STIH407_ST231_GP1_SOFTRESET	32
> >  
> >  /* Picophy reset defines */
> >  #define STIH407_PICOPHY0_RESET		0
> 
> Has anyone seen this patch?

c9bfec0032fb, sorry I missed 4.4.

regards
Philipp
