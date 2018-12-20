From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: net: ath10k: fix node name and device
 type in qcom ath10k example
Date: Thu, 20 Dec 2018 17:10:50 +0000 (UTC)
Message-ID: <20181220171050.13D7E6074E@smtp.codeaurora.org>
References: <1544544804-4039-2-git-send-email-bperumal@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ath10k-bounces+gldad-ath10k=m.gmane.org@lists.infradead.org>
In-Reply-To: <1544544804-4039-2-git-send-email-bperumal@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+gldad-ath10k=m.gmane.org@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, Bhagavathi Perumal S <bperumal@codeaurora.org>, ath10k@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Bhagavathi Perumal S <bperumal@codeaurora.org> wrote:

> In qcom,ath10k documentation, ath10k is used as node name in the example of
> pci based device. Normally, node name should be class of device and not the
> model name, so fix it to node name "wifi". And remove the property device_type
> pci since only pci bridges should have this property.
> 
> Signed-off-by: Bhagavathi Perumal S <bperumal@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

3 patches applied to ath-next branch of ath.git, thanks.

e5404969a335 dt-bindings: net: ath10k: fix node name and device type in qcom ath10k example
f3f587995c5a dt-bindings: net: ath10k: add new dt entry to identify external FEM
84758d4d43e9 ath10k: add support to configure BB timing over wmi

-- 
https://patchwork.kernel.org/patch/10724123/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
