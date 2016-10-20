From: Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: Re: [PATCH 3/3] ARM: dts: socfpga: Enable QSPI on the Cyclone5 sockit
Date: Thu, 20 Oct 2016 09:12:36 -0500
Message-ID: <c62baad6-2528-a9df-6b09-3dba66785102@opensource.altera.com>
References: <1476908324-12313-1-git-send-email-dinguyen@opensource.altera.com>
 <1476908324-12313-3-git-send-email-dinguyen@opensource.altera.com>
 <20161020071913.rlka3or4c7fzjpyv@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161020071913.rlka3or4c7fzjpyv@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: dinguyen@kernel.org, devicetree@vger.kernel.org, dinh.linux@gmail.com, linux-arm-kernel@lists.infradead.org, grmoore@opensource.altera.com
List-Id: devicetree@vger.kernel.org



On 10/20/2016 02:19 AM, Steffen Trumtrar wrote:

>> +		cdns,tslch-ns = <4>;
>> +
>> +		partition@qspi-boot {
>> +			/* 8MB for raw data. */
>> +			label = "Flash 0 Raw Data";
>> +			reg = <0x0 0x800000>;
>> +		};
>> +
>> +		partition@qspi-rootfs {
>> +			/* 120MB for jffs2 data. */
>> +			label = "Flash 0 jffs2 Filesystem";
>> +			reg = <0x800000 0x7800000>;
>> +		};
>> +	};
>> +};
>> +
> 
> What is the current preferred way of handling the partitions?
> This doesn't fit my Sockit configuration for example. So I would always
> have to patch the devicetree.

I'm not 100% sure on this. Graham, do you have any insight?
> 
> On the Socrates I didn't specify the partitions, because I did not
> want to force a specific configuration.
> 

I know that on Arria10, we needed a specific configuration.

Dinh
