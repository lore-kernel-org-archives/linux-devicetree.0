From: "Li.Xiubo@freescale.com" <Li.Xiubo@freescale.com>
Subject: RE: [PATCH 2/4] ARM: dts: Enable SAI ALSA SoC DAI device for Vybrid
 VF610 TOWER board.
Date: Wed, 19 Feb 2014 07:25:43 +0000
Message-ID: <ea66b1869211439f96598b54e24e282a@BY2PR03MB505.namprd03.prod.outlook.com>
References: <1392788323-6092-1-git-send-email-Li.Xiubo@freescale.com>
 <1392788323-6092-3-git-send-email-Li.Xiubo@freescale.com>
 <20140219070630.GE3010@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140219070630.GE3010@S2101-09.ap.freescale.net>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "galak@codeaurora.org" <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


> > @@ -127,9 +127,27 @@
> >  				VF610_PAD_PTB5__UART1_RX		0x21a1
> >  			>;
> >  		};
> > +
> > +		pinctrl_sai2: sai2grp {
> 
> To sort it alphabetically, the entry should be added before
> pinctrl_uart1.
> 
> > +		      fsl,pins = <
> > +			      VF610_PAD_PTA16__SAI2_TX_BCLK   0x02ed
> > +			      VF610_PAD_PTA18__SAI2_TX_DATA   0x02ee
> > +			      VF610_PAD_PTA19__SAI2_TX_SYNC   0x02ed
> > +			      VF610_PAD_PTA21__SAI2_RX_BCLK   0x02ed
> > +			      VF610_PAD_PTA22__SAI2_RX_DATA   0x02ed
> > +			      VF610_PAD_PTA23__SAI2_RX_SYNC   0x02ed
> > +			      VF610_PAD_PTB18__EXT_AUDIO_MCLK 0x02ed
> 
> Use tabs instead of spaces.
> 
> Shawn
> 

Yes, I'll fix these two issues above.

Thanks,

--
Best Regards,
Xiubo
