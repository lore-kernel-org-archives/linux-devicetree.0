From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2] arm64: dts: Add tmu node for exynos7
Date: Tue, 29 Mar 2016 10:43:07 +0900
Message-ID: <56F9DDAB.5000807@samsung.com>
References: <1456477590-4530-1-git-send-email-alim.akhtar@samsung.com>
 <56DD0022.20800@samsung.com> <56DD4907.8030100@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <56DD4907.8030100@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, l.majewski@samsung.com
List-Id: devicetree@vger.kernel.org

On 07.03.2016 18:25, Alim Akhtar wrote:
> Hi Krzysztof,
> 
> On 03/07/2016 09:44 AM, Krzysztof Kozlowski wrote:
>> On 26.02.2016 18:06, Alim Akhtar wrote:
>>> This patch adds tmu node, related temprature sensor and triping
>>> point data for Atlas cpu core found on exynos7 SoC.
>>>
>>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>>> ---
>>> Changes since v1:
>>> * Addressed krzysztof's review comments.
>>>
>>>   .../boot/dts/exynos/exynos7-tmu-sensor-conf.dtsi   |   25 +++++++++
>>>   .../arm64/boot/dts/exynos/exynos7-trip-points.dtsi |   54
>>> ++++++++++++++++++++
>>>   arch/arm64/boot/dts/exynos/exynos7.dtsi            |   20 ++++++++
>>>   3 files changed, 99 insertions(+)
>>>   create mode 100644
>>> arch/arm64/boot/dts/exynos/exynos7-tmu-sensor-conf.dtsi
>>>   create mode 100644 arch/arm64/boot/dts/exynos/exynos7-trip-points.dtsi

Queued for v4.7. Thanks.

Best regards,
Krzysztof
