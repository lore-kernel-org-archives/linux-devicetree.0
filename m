From: Maxime Coquelin <maxime.coquelin@st.com>
Subject: Re: [PATCH 3/7] dmaengine: st_fdma: Add STMicroelectronics FDMA
 engine driver support
Date: Mon, 31 Aug 2015 09:49:41 +0200
Message-ID: <55E40715.1040204@st.com>
References: <1436371888-27863-1-git-send-email-peter.griffin@linaro.org>
 <1436371888-27863-4-git-send-email-peter.griffin@linaro.org>
 <1436429872.20619.77.camel@tiscali.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436429872.20619.77.camel@tiscali.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>, Peter Griffin <peter.griffin@linaro.org>
Cc: lee.jones@linaro.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, ludovic.barre@st.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, patrice.chotard@st.com, vinod.koul@intel.com, dan.j.williams@intel.com
List-Id: devicetree@vger.kernel.org

Hi Paul,

On 07/09/2015 10:17 AM, Paul Bolle wrote:
>> >+static int __exit st_fdma_remove(struct platform_device *pdev)
>> >+{
>> >+	struct st_fdma_dev *fdev = platform_get_drvdata(pdev);
>> >+
>> >+	wait_for_completion(&fdev->fw_ack);
>> >+
>> >+	st_fdma_clk_disable(fdev);
>> >+
>> >+	return 0;
>> >+}
> Since this driver is built-in only this means st_fdma_remove() can never
> be used, right?
>

It's not because a driver is built-in only that it does not need a 
remove callback.
An instance can be probed/removed any time via driver's bind/unbind 
SysFS entries.
Am I missing something?

Kind regards,
Maxime
