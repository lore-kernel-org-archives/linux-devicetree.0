From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v2 3/4] ARM: dts: qcom: Add APQ8084 Global Clock Controller DT node
Date: Mon, 2 Jun 2014 15:41:24 -0500
Message-ID: <DDE79254-2F56-47AC-A689-5A0E8E131126@codeaurora.org>
References: <1401551134-28485-1-git-send-email-gdjakov@mm-sol.com> <1401551134-28485-4-git-send-email-gdjakov@mm-sol.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.2\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1401551134-28485-4-git-send-email-gdjakov@mm-sol.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Georgi Djakov <gdjakov@mm-sol.com>
Cc: Mike Turquette <mturquette@linaro.org>, linux@arm.linux.org.uk, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, sboyd@codeaurora.org, rdunlap@infradead.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On May 31, 2014, at 10:45 AM, Georgi Djakov <gdjakov@mm-sol.com> wrote:

> This patch adds the necessary node to probe the global clock
> controller on APQ8084 platforms.
>=20
> Signed-off-by: Georgi Djakov <gdjakov@mm-sol.com>
> ---
> arch/arm/boot/dts/qcom-apq8084.dtsi |   10 ++++++++++
> 1 file changed, 10 insertions(+)

Can you split the 2 DT patches into their own patchset since they will =
go via the qcom/arm-soc tree and not Mike=92s clk tree.

thanks

- k

--=20
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, host=
ed by The Linux Foundation
