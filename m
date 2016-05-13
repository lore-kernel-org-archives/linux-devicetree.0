From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Patch v5 3/8] firmware: qcom: scm: Use atomic SCM for cold boot
Date: Fri, 13 May 2016 16:37:14 -0700
Message-ID: <20160513233714.GG1256@tuxbot>
References: <1463111221-6963-1-git-send-email-andy.gross@linaro.org>
 <1463111221-6963-4-git-send-email-andy.gross@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1463111221-6963-4-git-send-email-andy.gross@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, jilai wang <jilaiw@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Thu 12 May 20:46 PDT 2016, Andy Gross wrote:

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
