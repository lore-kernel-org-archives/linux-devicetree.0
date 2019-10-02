From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH v2 1/2] venus: use on-chip interconnect API
Date: Wed, 2 Oct 2019 11:20:18 +0300
Message-ID: <c1e242ee-f7ec-de35-d5ae-9964473d473e@linaro.org>
References: <20190912082948.22836-1-stanimir.varbanov@linaro.org>
 <20190912082948.22836-2-stanimir.varbanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190912082948.22836-2-stanimir.varbanov@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: Vikash Garodia <vgarodia@codeaurora.org>, Andy Gross <agross@kernel.org>, Linux PM list <linux-pm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Stan,

On 9/12/19 01:29, Stanimir Varbanov wrote:
> This aims to add a requests for bandwidth scaling depending
> on the resolution and framerate (macroblocks per second). The
> exact value of the requested bandwidth is get from a
> pre-calculated tables for encoder and decoder.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

Acked-by: Georgi Djakov <georgi.djakov@linaro.org>

Thanks,
Georgi
