From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] ARM: dts: pxa3xx: Add Raumfeld DTS files
Date: Sat, 17 Nov 2018 21:14:40 +0100
Message-ID: <87pnv3ihqn.fsf@belgarion.home>
References: <20181105194040.25406-1-daniel@zonque.org>
 <87in14lkzp.fsf@belgarion.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <87in14lkzp.fsf@belgarion.home> (Robert Jarzmik's message of
 "Sat, 10 Nov 2018 21:45:46 +0100")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, Mark Rutland <mark.rutland@arm.com>, Daniel Mack <daniel@zonque.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, haojian.zhuang@gmail.com
List-Id: devicetree@vger.kernel.org

Robert Jarzmik <robert.jarzmik@free.fr> writes:

> Daniel Mack <daniel@zonque.org> writes:
>
>> This patch adds a set of DTS files that support all PXA3xx based Raumfeld
>> audio hardware devices.
>>
>> Common nodes are factored out into 'common' and 'tuneable-clock' include
>> files to keep the top-level DTS files smaller.
>>
>> Signed-off-by: Daniel Mack <daniel@zonque.org>
> Hi Daniel,
>
> I will need someone from the devicetree to ack this one, Rob or anybody
> maintaining the devicetree.

Rob, Mark, would you be so kind as to have a look at this patch, I have no
concerns taking it into the pxa/dt tree, but I'd rather be safe with someone
from the devicetree maintainers reviewing it first.

Cheers.

-- 
Robert
