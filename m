From: santosh.shilimkar@oracle.com
Subject: Re: [PATCH v5 0/3] soc: ti: k3: Allow for exclusive and shared device
 requests
Date: Wed, 21 Aug 2019 10:06:32 +0200
Message-ID: <226a7b55-8a4d-aa25-9392-004d5ea097e4@oracle.com>
References: <20190729122453.32252-1-lokeshvutla@ti.com>
 <05218f41-9601-9a6c-8ac1-3bf1482e1c3d@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <05218f41-9601-9a6c-8ac1-3bf1482e1c3d@ti.com>
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
To: Lokesh Vutla <lokeshvutla@ti.com>, Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 8/20/19 2:48 PM, Lokesh Vutla wrote:
> 
> 
> On 29/07/19 5:54 PM, Lokesh Vutla wrote:
>> Sysfw provides an option for requesting exclusive access for a
>> device using the flags MSG_FLAG_DEVICE_EXCLUSIVE. If this flag is
>> not used, the device is meant to be shared across hosts. Once a device
>> is requested from a host with this flag set, any request to this
>> device from a different host will be nacked by sysfw.
>>
>> Current tisci firmware and pm drivers always requests for device with
>> exclusive permissions set. But this is not be true for certain devices
>> that are expcted to be shared across different host contexts.
>> So add support for getting the shared or exclusive permissions from DT
>> and request firmware accordingly.
> 
> Gentle Ping on this series.
> 
I can queue this up.
