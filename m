From: Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH] ARM: dts: pxa3xx: add gcu node
Date: Wed, 14 Nov 2018 20:58:00 +0100
Message-ID: <c4ea09bc-93b5-49f6-9059-a74dcdbc59a6@zonque.org>
References: <20181105191827.3860-1-daniel@zonque.org>
 <87muqgll3u.fsf@belgarion.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <87muqgll3u.fsf@belgarion.home>
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
To: Robert Jarzmik <robert.jarzmik@free.fr>, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, haojian.zhuang@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Robert,

On 10/11/2018 9:43 PM, Robert Jarzmik wrote:
> Daniel Mack <daniel@zonque.org> writes:
> 
>> Add a device node for hardware graphic acceleration.
>>
>> Signed-off-by: Daniel Mack <daniel@zonque.org>
> Hi Daniel,
> 
>> +	gcu: display-controller@54000000 {
>> +		compatible = "marvell,pxa300-gcu";
> Isn't every IP devicetree entry supposed to have a documentation in
> Documentation/devicetree going along a definition in the .dtsi files ?

Ah, that's already there, see cf925575d292b.

I did that when I taught the driver DT probing.


Thanks,
Daniel
