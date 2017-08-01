From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/4] ARM: mediatek: dts: Cleanup bindings documentation
Date: Tue, 1 Aug 2017 15:44:06 +0200
Message-ID: <5451bdfa-e2c1-30cb-a5a9-252662b2d190@gmail.com>
References: <20170720102247.12342-1-matthias.bgg@gmail.com>
 <20170724195644.oztdexqhicir5xn3@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170724195644.oztdexqhicir5xn3@rob-hp-laptop>
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
To: Rob Herring <robh@kernel.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>, linux-watchdog@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, wim@iguana.be, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux@roeck-us.net
List-Id: devicetree@vger.kernel.org



On 07/24/2017 09:56 PM, Rob Herring wrote:
> On Thu, Jul 20, 2017 at 12:22:44PM +0200, Matthias Brugger wrote:
>> From: Matthias Brugger <mbrugger@suse.com>
>>
>> This patch cleans up the binding documentation stating explicitly
>> the binding and it's fallback for every SoC.
>>
>> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
>> ---
>>   Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> Acked-by: Rob Herring <robh@kernel.org>
> 

Thanks. Whole series pushed now to v4.13-next/dts64
