From: Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH 4/7] ARM: dts: pxa: merge &pxa3xx_ohci with &usb0
Date: Sat, 1 Dec 2018 14:49:40 +0100
Message-ID: <8f6aa1b2-b154-dbdd-9c0c-76ba882f7933@zonque.org>
References: <20181130175543.32628-1-daniel@zonque.org>
 <20181130175543.32628-5-daniel@zonque.org> <87lg59xtkq.fsf@belgarion.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <87lg59xtkq.fsf@belgarion.home>
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
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, haojian.zhuang@gmail.com
List-Id: devicetree@vger.kernel.org

On 1/12/2018 2:30 PM, Robert Jarzmik wrote:
> Daniel Mack <daniel@zonque.org> writes:
> 
>> Both pxa3xx.dtsi and pxa2xx.dtsi define a node for the USB controller. Merge
>> them, and get rid of the one in pxa3xx.dtsi.
>>
>> Signed-off-by: Daniel Mack <daniel@zonque.org>
> Excellent, but can be even better :)
> Could you please address as well pxa27x.dtsi ?
> 
> As a matter of fact, this was already discussed here :
> https://patchwork.kernel.org/patch/8375421/
> 
> So the proper solution might be a bit different, as if you look at the thread I
> put up there, pxa25x doesn't have an USB host controller.

Ah, okay. Thanks for the pointer. Will send a new patch, just ignore 
this one please.


Thanks,
Daniel
