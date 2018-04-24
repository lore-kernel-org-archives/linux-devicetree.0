From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: da850-lcdk: add unit name for memory node
Date: Tue, 24 Apr 2018 14:29:51 +0530
Message-ID: <d4d50ced-c5f1-36e9-6cf7-e4098f7accd5@ti.com>
References: <20180418092408.2077-1-nsekhar@ti.com>
 <20180418092408.2077-3-nsekhar@ti.com>
 <4843ee2b-bd62-a557-8d63-4a77374bcb2d@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4843ee2b-bd62-a557-8d63-4a77374bcb2d@lechnology.com>
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
To: David Lechner <david@lechnology.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Kevin Hilman <khilman@kernel.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 18 April 2018 08:50 PM, David Lechner wrote:
> On 04/18/2018 04:24 AM, Sekhar Nori wrote:
>> Add unit name for memory node to squash the W=1 warning:
>>
>> arch/arm/boot/dts/da850-lcdk.dtb: Warning (unit_address_vs_reg):
>> /memory: node has a reg or ranges property, but no unit name
>>
>> While at it, drop the device_type property from memory
>> node since its provided by da850.dtsi already.
>>
>> Signed-off-by: Sekhar Nori <nsekhar@ti.com>
>> ---
> 
> Reviewed-by: David Lechner <david@lechnology.com>

Applied both to fixes.

Thanks,
Sekhar
