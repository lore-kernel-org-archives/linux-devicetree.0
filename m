From: Hillf Danton <hdanton@sina.com>
Subject: Re: [PATCH v2 05/17] soc: qcom: ipa: clocking, interrupts, and memory
Date: Thu, 20 Jun 2019 21:41:39 +0800
Message-ID: <20190620134139.7056-1-hdanton@sina.com>
References: <20190531035348.7194-1-elder@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190531035348.7194-1-elder@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alex Elder <elder@linaro.org>
Cc: devicetree@vger.kernel.org, syadagir@codeaurora.org, ejcaruso@google.com, arnd@arndb.de, netdev@vger.kernel.org, ilias.apalodimas@linaro.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, bjorn.andersson@linaro.org, abhishek.esse@gmail.com, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, subashab@codeaurora.org, linux-soc@vger.kernel.org, davem@davemloft.net, cpratapa@codeaurora.org, benchan@google.com
List-Id: devicetree@vger.kernel.org


Hello

On Thu, 30 May 2019 20:54:01 -0700 (PDT) Alex Elder wrote:
> +
> +void ipa_interrupt_teardown(struct ipa_interrupt *interrupt)
> +{
> +	free_irq(interrupt->irq, interrupt);

Looks like that there is something missed.

	kfree(interrupt);
> +}

Hillf
