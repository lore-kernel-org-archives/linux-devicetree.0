From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH] ARM: davinci: da850-evm: fix read access to SPI flash
Date: Wed, 18 Jan 2017 15:28:21 +0530
Message-ID: <b349792e-0465-acac-5fe9-e9b4ae666ce7@ti.com>
References: <20170117125742.9536-1-fparent@baylibre.com>
 <m237gh2ozw.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <m237gh2ozw.fsf@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kevin Hilman <khilman@baylibre.com>, Fabien Parent <fparent@baylibre.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wednesday 18 January 2017 05:55 AM, Kevin Hilman wrote:
> Fabien Parent <fparent@baylibre.com> writes:
> 
>> Read access to the SPI flash are broken on da850-evm, i.e. the data
>> read is not what is actually programmed on the flash.
>> According to the datasheet for the M25P64 part present on the da850-evm,
>> if the SPI frequency is higher than 20MHz then the READ command is not
>> usable anymore and only the FAST_READ command can be used to read data.
>>
>> This commit specifies in the DTS that we should use FAST_READ command
>> instead of the READ command.
>>
>> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> 
> Tested on da850-evm on top of v4.10-rc3.  This gets the DT boot
> functionatliy in line with the legacy (board-file) boot.
> 
> Tested-by: Kevin Hilman <khilman@baylibre.com>

Applied with Kevin's Tested-by and also marked for stable. Sending pull
request for v4.10-rc shortly.

Thanks,
Sekhar
