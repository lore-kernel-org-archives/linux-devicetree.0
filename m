From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 3/3] arm64: dts: juno: Remove Motherboard USB node
Date: Wed, 18 Jan 2017 14:18:10 +0000
Message-ID: <61d3b621-bb47-c59b-d89f-07636ef8408c@arm.com>
References: <74595d6d866518db7cfabc39b4cf9b54d3be9bde.1484741104.git.robin.murphy@arm.com>
 <39868e0d327456be61aa9ac318fc2d958523a696.1484741104.git.robin.murphy@arm.com>
 <20170118123802.GE995@e110455-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170118123802.GE995@e110455-lin.cambridge.arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Local user for Liviu Dudau <liviu.dudau@arm.com>, Robin Murphy <robin.murphy@arm.com>
Cc: devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com, linux-arm-kernel@lists.infradead.org, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org



On 18/01/17 12:38, Local user for Liviu Dudau wrote:
> Hi Robin,
> 
> On Wed, Jan 18, 2017 at 12:12:52PM +0000, Robin Murphy wrote:
>> The first batch of Juno boards included a discrete USB controller chip
>> as a contingency in case of issues with the USB 2.0 IP integrated into
>> the SoC. As it turned out, the latter was fine, and to the best of my
>> knowledge the motherboard USB was never even brought up and validated.
>>
>> Since this also isn't present on later boards, and uses a compatible
>> string undocumented and unmatched by any driver in the kernel, let's
>> just tidy it away for ever to avoid any confusion.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> 
> For all 3 patches:
> 
> Acked-by: Liviu Dudau <Liviu.Dudau@arm.com>
> 

Thanks Liviu (or/and Local user for Liviu Dudau :))

All 3 patches applied to [1]

-- 
Regards,
Sudeep

[1] git.kernel.org/sudeep.holla/linux/h/for-next/updates/juno
