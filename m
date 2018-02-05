From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 01/15] firmware: qcom: scm: Add ipq4019 soc compatible
Date: Mon, 5 Feb 2018 00:07:27 -0600
Message-ID: <20180205022530.xf64gqeijicewdla@rob-hp-laptop>
References: <1517202689-14212-1-git-send-email-sricharan@codeaurora.org>
 <1517202689-14212-2-git-send-email-sricharan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1517202689-14212-2-git-send-email-sricharan@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sricharan R <sricharan@codeaurora.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, linux@armlinux.org.uk, bjorn.andersson@linaro.org, david.brown@linaro.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, linux-soc@vger.kernel.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 29, 2018 at 10:41:15AM +0530, Sricharan R wrote:
> Add the compatible for ipq4019.
> This does not need clocks to do scm calls.
> 
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.txt | 3 ++-
>  drivers/firmware/qcom_scm.c                             | 3 +++
>  2 files changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
