From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 5/5] ARM: dts: Add LEGO MINDSTORTMS EV3 dts
Date: Thu, 27 Oct 2016 16:48:44 +0530
Message-ID: <d17f4ea6-7925-e926-2310-edf5887edee7@ti.com>
References: <1477075018-20176-1-git-send-email-david@lechnology.com>
 <1477075018-20176-6-git-send-email-david@lechnology.com>
 <b0022fad-a96e-86d4-71ba-2b803e5421fe@ti.com>
 <38a3a10c-a269-6a9f-305c-7d38ec9b839b@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <38a3a10c-a269-6a9f-305c-7d38ec9b839b@lechnology.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thursday 27 October 2016 07:00 AM, David Lechner wrote:
> On 10/24/2016 06:58 AM, Sekhar Nori wrote:
>> On Saturday 22 October 2016 12:06 AM, David Lechner wrote:
>>> This adds a device tree definition file for LEGO MINDSTORMS EV3.
>>
>> Thanks for the patch!
>>
>>>
>>> What is working:
>>>
>>> * Pin muxing
>>> * MicroSD card reader
>>> * UART on input port 1
>>>
>>> What is partially working:
>>>
>>> * Buttons - working after GPIO fix
>>> * LEDs - working after GPIO fix
>>> * Poweroff/reset - working after GPIO fix
>>
>> Is the GPIO fix something that will go in v4.9-rc cycle ?
>>
> 
> FYI, the fix is in linux-gpio/fixes now.

Thanks, I added the patch to my 'acked' branch which has stuff useful
for testing on davinci but not going through my tree. It gets merged
into my master branch so that branch can be used for all mach-davinci
development.

Thanks,
Sekhar
