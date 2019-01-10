From: =?utf-8?B?Vm9rw6HEjSBNaWNoYWw=?= <Michal.Vokac@ysoft.com>
Subject: Re: [PATCH v2 18/34] dt-bindings: arm: Convert FSL board/soc bindings
 to json-schema
Date: Thu, 10 Jan 2019 10:44:03 +0000
Message-ID: <dc0ef959-78a0-2a32-c0f9-e8da11e035e6@ysoft.com>
References: <20181203213223.16986-1-robh@kernel.org>
 <20181203213223.16986-19-robh@kernel.org> <20181206023140.GZ3987@dragon>
 <CAL_JsqK5nBdk-MiuTPMxr9oXqXnLqeMU3vtZi6AnT9V35_W55A@mail.gmail.com>
 <20181208015835.GM3987@dragon> <20190110064256.GA25218@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190110064256.GA25218@dragon>
Content-Language: en-US
Content-ID: <4878A9ED35BB0147A72BC90477A0A926@eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kumar Gala <kumar.gala@linaro.org>, Grant Likely <grant.likely@arm.com>, Sean Hudson <darknighte@darknighte.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ARM-SoC Maintainers <arm@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE
 IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 10.1.2019 07:42, Shawn Guo wrote:
> On Sat, Dec 08, 2018 at 09:58:37AM +0800, Shawn Guo wrote:
>> On Thu, Dec 06, 2018 at 05:33:13PM -0600, Rob Herring wrote:
>>> On Wed, Dec 5, 2018 at 8:32 PM Shawn Guo <shawnguo@kernel.org> wrote:
>>>>
>>>> On Mon, Dec 03, 2018 at 03:32:07PM -0600, Rob Herring wrote:
>>>>> Convert Freescale SoC bindings to DT schema format using json-schema.
>>>>>
>>>>> Cc: Shawn Guo <shawnguo@kernel.org>
>>>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>>>> Cc: devicetree@vger.kernel.org
>>>>> Signed-off-by: Rob Herring <robh@kernel.org>
>>>>> ---
>>>>>   .../devicetree/bindings/arm/armadeus.txt      |   6 -
>>>>>   Documentation/devicetree/bindings/arm/bhf.txt |   6 -
>>>>>   .../bindings/arm/compulab-boards.txt          |  25 --
>>>>>   Documentation/devicetree/bindings/arm/fsl.txt | 229 ------------------
>>>>>   .../devicetree/bindings/arm/fsl.yaml          | 214 ++++++++++++++++
>>>>
>>>> Rob,
>>>>
>>>> I do have any changes on bindings/arm/fsl.txt queued for 4.21 on my
>>>> tree, so please send it via your tree.
>>>
>>> What about:
>>>
>>> c386f362957b dt-bindings: Add compatible string for LS1028A-QDS
>>> 3671cd57de06 dt-bindings: ls1012a: Add FRWY-LS1012A device tree binding
>>
>> Ah, sorry, I only checked on imx/dt branch and forgot imx/dt64.  I will
>> drop the changes on fsl.txt and update fsl.yaml after it hits mainline.
> 
> What happened to this?  It seems the patch did not hit v5.0-rc1.

Hi Shawn,
Rob actually asked you a similar question two days ago..

https://lkml.org/lkml/2019/1/8/754
