From: Andy Gross <agross@codeaurora.org>
Subject: Re: [PATCH 1/6] soc: qcom: gsbi: Add support for ADM CRCI muxing
Date: Wed, 28 Jan 2015 11:27:27 -0600
Message-ID: <20150128172727.GB17315@qualcomm.com>
References: <1422396644-21714-1-git-send-email-agross@codeaurora.org>
 <1422396644-21714-2-git-send-email-agross@codeaurora.org>
 <54C8A66E.3070306@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <54C8A66E.3070306@mm-sol.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Kumar Gala <galak@codeaurora.org>, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 28, 2015 at 11:05:50AM +0200, Stanimir Varbanov wrote:
> <snip>
> 
> > diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> > index 7bd2c94..32f20be 100644
> > --- a/drivers/soc/qcom/Kconfig
> > +++ b/drivers/soc/qcom/Kconfig
> > @@ -4,6 +4,7 @@
> >  config QCOM_GSBI
> >          tristate "QCOM General Serial Bus Interface"
> >          depends on ARCH_QCOM
> > +	select MFD_SYSCON
> 
> Wrong indentation? In fact the original Kconfig entry has spaces instead
> of tabs, could you prepare a cleanup patch for this.

yeah I'll switch to spaces since the Kconfig is using spaces.

> >          help
> >            Say y here to enable GSBI support.  The GSBI provides control
> >            functions for connecting the underlying serial UART, SPI, and I2C

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
