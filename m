From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 0/3] Qualcomm Resource Power Manager driver
Date: Tue, 17 Jun 2014 22:49:33 +0100
Message-ID: <53A0B7ED.9050806@linaro.org>
References: <1402944372-31901-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1402944372-31901-1-git-send-email-bjorn.andersson@sonymobile.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Josh Cartwright <joshc@codeaurora.org>, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

Thankyou for the patches, these were handy for testing USB on APQ8064.

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini

On 16/06/14 19:46, Bjorn Andersson wrote:
> This series adds a regulator driver for the Resource Power Manager found in
> Qualcomm 8660, 8960 and 8064 based devices.
>
> The RPM driver exposes resources to its child devices, that can be accessed to
> implement drivers for the regulators, clocks and bus frequency control that's
> owned by the RPM in these devices.
>
> Changes since v2:
>    - Fix copy-paste error in dt binding
>    - Correct incomplete move from mfd to soc
>    - Correct const mistake in regulator driver
>
> Changes since v1:
>    - Moved rpm driver to drivers/soc
>    - Extracted resource table structs from rpm struct, as per Srinivas request
>    - Dropped mode setting support for the regulators for now. Unsure if we need
>      it and it requires some rework from the codeaurora solution.
>    - Using set_voltage_sel instead of rolling my own "snapping", as per Marks
>      request
>    - Split regulator ops in mV, uV and swtich versions as per Marks request.
>    - Added devicetree property to enable pull down.
>
> Bjorn Andersson (3):
>    soc: devicetree: bindings: Add Qualcomm RPM DT binding
>    soc: qcom-rpm: Driver for the Qualcomm RPM
>    regulator: qcom-rpm: Regulator driver for the Qualcomm RPM
>
>   .../devicetree/bindings/soc/qcom/qcom,rpm.txt      | 261 +++++++
>   drivers/regulator/Kconfig                          |  12 +
>   drivers/regulator/Makefile                         |   1 +
>   drivers/regulator/qcom_rpm-regulator.c             | 787 +++++++++++++++++++++
>   drivers/soc/qcom/Kconfig                           |  14 +
>   drivers/soc/qcom/Makefile                          |   1 +
>   drivers/soc/qcom/qcom_rpm.c                        | 573 +++++++++++++++
>   include/dt-bindings/soc/qcom,rpm.h                 | 142 ++++
>   include/linux/soc/qcom_rpm.h                       |  12 +
>   9 files changed, 1803 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,rpm.txt
>   create mode 100644 drivers/regulator/qcom_rpm-regulator.c
>   create mode 100644 drivers/soc/qcom/qcom_rpm.c
>   create mode 100644 include/dt-bindings/soc/qcom,rpm.h
>   create mode 100644 include/linux/soc/qcom_rpm.h
>
