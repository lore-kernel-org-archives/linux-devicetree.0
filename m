From: Amelie DELAUNAY <amelie.delaunay@st.com>
Subject: Re: [PATCH v4 1/9] dt-bindings: mfd: Add ST Multi-Function eXpander
 (STMFX) core bindings
Date: Thu, 28 Feb 2019 08:53:42 +0000
Message-ID: <c54c4fd8-b97f-a70b-4805-fd3d217f5050@st.com>
References: <1551260094-32570-1-git-send-email-amelie.delaunay@st.com>
 <1551260094-32570-2-git-send-email-amelie.delaunay@st.com>
 <20190227235535.GA24395@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190227235535.GA24395@bogus>
Content-Language: en-US
Content-ID: <57CB0BFA4FFC6546A2026BD7801F867B@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 2/28/19 12:55 AM, Rob Herring wrote:
> On Wed, 27 Feb 2019 10:34:46 +0100, Amelie Delaunay wrote:
>> This patch adds documentation of device tree bindings for the
>> STMicroelectronics Multi-Function eXpander (STMFX) MFD core.
>>
>> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/mfd/stmfx.txt | 28 +++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/stmfx.txt
>>
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.
> 

I'm sorry Rob, I forgot to add your Reviewed-by on this patch, which is 
identical to v3.

I reposted the whole series, due to changes in MFD driver with side 
effect in pinctrl driver, but bindings (MFD and pinctrl) didn't change 
between the two versions. I stated the changes in cover letter.

Should I have removed the bindings patches from the series ?
