From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Subject: Re: [PATCH] ARM: dts: keystone: specify usb mode explicitly
Date: Thu, 25 Aug 2016 09:31:29 -0700
Message-ID: <a91ec980-c8be-7a67-58a8-6e25508eb573@oracle.com>
References: <20160628094245.9521-1-grygorii.strashko@ti.com>
 <578D15B3.1040705@ti.com> <09af5947-1a0e-9f44-e046-67276062530d@oracle.com>
 <62e7960a-7f47-8125-c369-2407ffc5a2dd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <62e7960a-7f47-8125-c369-2407ffc5a2dd@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sekhar Nori <nsekhar@ti.com>, linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
List-Id: devicetree@vger.kernel.org

On 8/25/2016 7:11 AM, Grygorii Strashko wrote:
> Hi Santosh,
>
> On 07/18/2016 08:49 PM, Santosh Shilimkar wrote:
>> On 7/18/2016 10:45 AM, Grygorii Strashko wrote:
>>> Hi Santosh,
>>> On 06/28/2016 12:42 PM, Grygorii Strashko wrote:
>>>> The USB OTG mode is not supported by Kestone 2 devices, as result, the
>>>> USB devices enumeration and detection will not work properly when
>>>> kernel is built with CONFIG_USB_DWC3_DUAL_ROLE=y (default for multi
>>>> platform build):
>>>>   - it's required to load gadget drivers manually to make host mode
>>>> work and this confuses current Keystone 2 users
>>>>   - device mode is not working, because port can't detect and switch to
>>>> peripheral/host mode dynamically.
>>>>
>>>> Hence, specify usb mode explicitly in DT: usb0 = "host" for all KS2
>>>> devices and usb1 = "peripheral" for K2E.
>>>>
>>>> Cc: Sekhar Nori <nsekhar@ti.com>
>>>> Cc: Roger Quadros <rogerq@ti.com>
>>>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
>>>
>>> Do you expect any additional actions from my side relate to this patch?
>>>
>> Nope. I will pick this up though it has to wait for next merge window
>> now.
>
> I'd like to remind you about this patch.
> Would you like me to resend it ?
> (I've checked - it can be applied as is on top master and next/master without issues)
>
Merge window has a time ;-)
No need to re-send. As I mentioned, will pick it up.
