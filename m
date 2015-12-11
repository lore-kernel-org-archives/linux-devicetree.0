From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH 1/4] ARM: dts: qcom: apq8064-ifc6410 Use hardware flow
 control for GSBI6
Date: Fri, 11 Dec 2015 13:24:53 -0600
Message-ID: <20151211192453.GB4022@Agamemnon.attlocal.net>
References: <1449858409-13296-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1449858598-13429-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1449858598-13429-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 11, 2015 at 06:29:58PM +0000, Srinivas Kandagatla wrote:
> From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
> 
> GSBI6 UART module is connected to BT chip, which uses
> hardware flow control lines. Enable them on SoC side.
> 
> Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>

Looks fine to me. Thanks for the patch.
