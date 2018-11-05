From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v10 5/6] arm64: zynqmp: Add DDRC node
Date: Mon, 5 Nov 2018 14:32:55 +0100
Message-ID: <a81f47e0-1778-a6ac-4cd8-634502661d6f@xilinx.com>
References: <1540447621-22870-1-git-send-email-manish.narani@xilinx.com>
 <1540447621-22870-6-git-send-email-manish.narani@xilinx.com>
 <20181105125644.GA7937@zn.tnic>
 <41c5ca53-ed4b-38d0-c612-e1229004293e@xilinx.com>
 <20181105132007.GB7937@zn.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181105132007.GB7937@zn.tnic>
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
To: Borislav Petkov <bp@alien8.de>, Michal Simek <michal.simek@xilinx.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, amit.kucheria@linaro.org, leoyang.li@nxp.com, robh+dt@kernel.org, Manish Narani <manish.narani@xilinx.com>, sudeep.holla@arm.com, Olof Johansson <olof@lixom.net>, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 05. 11. 18 14:20, Borislav Petkov wrote:
> On Mon, Nov 05, 2018 at 02:06:11PM +0100, Michal Simek wrote:
>> I don't think that driver will be broken. You can build them, use them
>> on out of tree HW. And when this patch is merged to mainline it will be
>> enabled for xilinx soc.
> 
> But if the DT entries are missing, the driver won't load, would it?

you don't have that HW anyway.

> 
>> TBH I can't see any reason to do merges but if you want to do that way
>> we can also do it.
> 
> The reason is because there's a separate DT tree and all those arm
> drivers need DT.
> 
> I have already acked EDAC patches to go through other trees too, FWIW.

I looked at v10 and I can't see your ack there. Can you please give me a
link?
I see Rob's reviewed by in v10 2/6

> Which is not optimal either if someone sends fixes ontop but I cannot
> apply them yet because the dependent patches are in a different tree.
> 
> So yes, there are at least two good reasons for merging a shared branch.

I have not a problem with that. I can simply take patch (process via
arm-soc) with pointing to reviewed binding doc and you will take the
rest when this is in arm-soc tree.

Thanks,
Michal
