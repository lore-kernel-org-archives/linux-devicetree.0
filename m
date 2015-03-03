From: Maxime Coquelin <maxime.coquelin@st.com>
Subject: Re: [PATCH v2 4/8] mmc: sdhci-st: Add st_mmcss_cconfig function to
 configure mmcss glue registers.
Date: Tue, 3 Mar 2015 11:53:19 +0100
Message-ID: <54F5929F.80503@st.com>
References: <1424956227-18258-1-git-send-email-peter.griffin@linaro.org> <1424956227-18258-5-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1424956227-18258-5-git-send-email-peter.griffin@linaro.org>
Sender: linux-mmc-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, patrice.chotard@st.com, srinivas.kandagatla@gmail.com, chris@printf.net, ulf.hansson@linaro.org
Cc: lee.jones@linaro.org, devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, peppe.cavallaro@st.com
List-Id: devicetree@vger.kernel.org


On 02/26/2015 02:10 PM, Peter Griffin wrote:
> STiH407 family SoC's have glue registers in the flashSS subsystem which
> are used to configure the Arasan HC. This patch configures these glue
> registers according to what has been specified in the DT.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> ---
>   drivers/mmc/host/sdhci-st.c | 88 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 88 insertions(+)
>

Acked-by: Maxime Coquelin <maxime.coquelin@st.com>

Thanks,
Maxime
