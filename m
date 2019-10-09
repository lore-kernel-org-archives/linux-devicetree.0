From: Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH v3 02/14] soc: ti: k3: add navss ringacc driver
Date: Wed, 9 Oct 2019 10:14:24 +0300
Message-ID: <cadf50c0-1bb9-1fa5-98e0-12bf8e2b5644@ti.com>
References: <20191001061704.2399-1-peter.ujfalusi@ti.com>
 <20191001061704.2399-3-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191001061704.2399-3-peter.ujfalusi@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>, vkoul@kernel.org, robh+dt@kernel.org, nm@ti.com, ssantosh@kernel.org
Cc: dan.j.williams@intel.com, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, grygorii.strashko@ti.com, lokeshvutla@ti.com, tony@atomide.com, j-keerthy@ti.com
List-Id: devicetree@vger.kernel.org

On 01/10/2019 09:16, Peter Ujfalusi wrote:
> From: Grygorii Strashko <grygorii.strashko@ti.com>
> 
> The Ring Accelerator (RINGACC or RA) provides hardware acceleration to
> enable straightforward passing of work between a producer and a consumer.
> There is one RINGACC module per NAVSS on TI AM65x SoCs.
> 
> The RINGACC converts constant-address read and write accesses to equivalent
> read or write accesses to a circular data structure in memory. The RINGACC
> eliminates the need for each DMA controller which needs to access ring
> elements from having to know the current state of the ring (base address,
> current offset). The DMA controller performs a read or write access to a
> specific address range (which maps to the source interface on the RINGACC)
> and the RINGACC replaces the address for the transaction with a new address
> which corresponds to the head or tail element of the ring (head for reads,
> tail for writes). Since the RINGACC maintains the state, multiple DMA
> controllers or channels are allowed to coherently share the same rings as
> applicable. The RINGACC is able to place data which is destined towards
> software into cached memory directly.
> 
> Supported ring modes:
> - Ring Mode
> - Messaging Mode
> - Credentials Mode
> - Queue Manager Mode
> 
> TI-SCI integration:
> 
> Texas Instrument's System Control Interface (TI-SCI) Message Protocol now
> has control over Ringacc module resources management (RM) and Rings
> configuration.
> 
> The corresponding support of TI-SCI Ringacc module RM protocol
> introduced as option through DT parameters:
> - ti,sci: phandle on TI-SCI firmware controller DT node
> - ti,sci-dev-id: TI-SCI device identifier as per TI-SCI firmware spec
> 
> if both parameters present - Ringacc driver will configure/free/reset Rings
> using TI-SCI Message Ringacc RM Protocol.
> 
> The Ringacc driver manages Rings allocation by itself now and requests
> TI-SCI firmware to allocate and configure specific Rings only. It's done
> this way because, Linux driver implements two stage Rings allocation and
> configuration (allocate ring and configure ring) while I-SCI Message

You missed fixing the typo above: I-SCI to TI-SCI. However, it is just 
cosmetic so I don't mind.

Reviewed-by: Tero Kristo <t-kristo@ti.com>
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
