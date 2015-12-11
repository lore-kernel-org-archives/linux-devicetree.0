From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH 2/4] arm: dts: apq8064: add shared memory into dt
 reserved-memory
Date: Fri, 11 Dec 2015 13:25:55 -0600
Message-ID: <20151211192555.GD4022@Agamemnon.attlocal.net>
References: <1449858409-13296-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1449858707-13517-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1449858707-13517-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 11, 2015 at 06:31:47PM +0000, Srinivas Kandagatla wrote:
> This patch adds the shared memory in the Device tree reserved memory
> list so that kernel would not map it as normal memory.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Looks fine to me.
