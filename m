From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2 03/17] soc: qcom: ipa: main code
Date: Fri, 31 May 2019 14:50:05 -0700 (PDT)
Message-ID: <20190531.145005.798440469894507477.davem@davemloft.net>
References: <20190531035348.7194-1-elder@linaro.org>
        <20190531035348.7194-4-elder@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190531035348.7194-4-elder@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: elder@linaro.org
Cc: arnd@arndb.de, bjorn.andersson@linaro.org, ilias.apalodimas@linaro.org, evgreen@chromium.org, benchan@google.com, ejcaruso@google.com, cpratapa@codeaurora.org, syadagir@codeaurora.org, subashab@codeaurora.org, abhishek.esse@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Alex Elder <elder@linaro.org>
Date: Thu, 30 May 2019 22:53:34 -0500

> +	void *route_virt;
 ...
> +	void *filter_virt;
 ...

If these are arrays of u64's, please declare them as "u64 *" instead of
the opaque "void *".
