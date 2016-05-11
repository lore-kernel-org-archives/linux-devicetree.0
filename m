From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Patch v4 3/8] firmware: qcom: scm: Use atomic SCM for cold boot
Date: Wed, 11 May 2016 12:56:03 -0700
Message-ID: <20160511195603.GW1256@tuxbot>
References: <1462976158-26016-1-git-send-email-andy.gross@linaro.org>
 <1462976158-26016-4-git-send-email-andy.gross@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1462976158-26016-4-git-send-email-andy.gross@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, jilai wang <jilaiw@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Wed 11 May 07:15 PDT 2016, Andy Gross wrote:

> This patch changes the cold_set_boot_addr function to use atomic SCM
> calls.  cold_set_boot_addr required adding qcom_scm_call_atomic2 to
> support the two arguments going to the smc call.  Using atomic removes
> the need for memory allocation and instead places all arguments in
> registers.
> 
> Signed-off-by: Andy Gross <andy.gross@linaro.org>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
