From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v3] dt-bindings: arm: Convert MediaTek board/soc bindings
 to json-schema
Date: Sat, 15 Jun 2019 12:17:57 +0200
Message-ID: <8e4fcd7c-c698-7fe0-fce6-7f153112d16e@gmail.com>
References: <20190517154202.24594-1-robh@kernel.org>
 <20190613224921.GA9199@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190613224921.GA9199@bogus>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>, arm@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 14/06/2019 00:49, Rob Herring wrote:
> On Fri, May 17, 2019 at 10:42:02AM -0500, Rob Herring wrote:
>> Convert MediaTek SoC bindings to DT schema format using json-schema.
>>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Matthias Brugger <matthias.bgg@gmail.com>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-mediatek@lists.infradead.org
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> ---
>> v3:
>>  - Rebase to Linus' master
>>
>>  .../devicetree/bindings/arm/mediatek.txt      | 89 ------------------
>>  .../devicetree/bindings/arm/mediatek.yaml     | 91 +++++++++++++++++++
>>  2 files changed, 91 insertions(+), 89 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek.txt
>>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek.yaml
> 
> Ping. Three versions of this and no comments... Is Mediatek a dead 
> platform?
> 

No just a too busy maintainer. Somehow I remembered that you mentioned you won't
rebase it, so I put it on my long list of todos.

Pushed now to v5.2-next/dts64

Thanks a lot!
Matthias
