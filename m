From: Graham Moore <grmoore@opensource.altera.com>
Subject: Re: [PATCH 3/3] ARM: dts: socfpga: Enable QSPI on the Cyclone5 sockit
Date: Tue, 25 Oct 2016 10:38:10 -0500
Message-ID: <5e0adad1-8ef2-029f-cfcd-4a07c962fda2@opensource.altera.com>
References: <1476908324-12313-1-git-send-email-dinguyen@opensource.altera.com>
 <1476908324-12313-3-git-send-email-dinguyen@opensource.altera.com>
 <20161020071913.rlka3or4c7fzjpyv@pengutronix.de>
 <c62baad6-2528-a9df-6b09-3dba66785102@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <c62baad6-2528-a9df-6b09-3dba66785102@opensource.altera.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dinh Nguyen <dinguyen@opensource.altera.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: dinguyen@kernel.org, dinh.linux@gmail.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/20/2016 09:12 AM, Dinh Nguyen wrote:
>
>
> On 10/20/2016 02:19 AM, Steffen Trumtrar wrote:
>
>>> +		cdns,tslch-ns = <4>;
>>> +
>>> +		partition@qspi-boot {
>>> +			/* 8MB for raw data. */
>>> +			label = "Flash 0 Raw Data";
>>> +			reg = <0x0 0x800000>;
>>> +		};
>>> +
>>> +		partition@qspi-rootfs {
>>> +			/* 120MB for jffs2 data. */
>>> +			label = "Flash 0 jffs2 Filesystem";
>>> +			reg = <0x800000 0x7800000>;
>>> +		};
>>> +	};
>>> +};
>>> +
>>
>> What is the current preferred way of handling the partitions?
>> This doesn't fit my Sockit configuration for example. So I would always
>> have to patch the devicetree.
>
> I'm not 100% sure on this. Graham, do you have any insight?
>>

Well, strictly speaking, these partitions are only for the socdk, the 
Altera dev kit.  Our sample designs and file systems expect this layout.

Therefore, these partitions are not required for any other dev kits, and 
can probably be left out.

Or, Steffen, if you have a standard layout you'd like to see, then put 
that in there.

I think some people will have to patch the layout regardless.

-Graham
