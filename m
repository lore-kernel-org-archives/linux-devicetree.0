From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH] arm64: dts: zynqmp: replace gpio-key,wakeup with
 wakeup-source property
Date: Mon, 5 Nov 2018 13:43:28 +0100
Message-ID: <e91087c5-ba88-1d0d-e84e-ef126811fb41@xilinx.com>
References: <20181024114540.5196-1-sudeep.holla@arm.com>
 <20181024114540.5196-2-sudeep.holla@arm.com>
 <5f430204-9c97-0351-ff63-e64e8d42da69@xilinx.com>
 <1a3fb47c-1427-d79e-9cb4-4476fd6a1cfb@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1a3fb47c-1427-d79e-9cb4-4476fd6a1cfb@arm.com>
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
To: Sudeep Holla <sudeep.holla@arm.com>, Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05. 11. 18 12:47, Sudeep Holla wrote:
> 
> 
> 
> On 05/11/2018 09:32, Michal Simek wrote:
>> On 24. 10. 18 13:45, Sudeep Holla wrote:
>>> Most of the legacy "gpio-key,wakeup" boolean property is already
>>> replaced with "wakeup-source". However few occurrences of old property
>>> has popped up again, probably from the remnants in downstream trees.
>>>
>>> This patch replaces the legacy properties with the unified
>>> "wakeup-source" property.
>>>
>>
>> Will be good to point to 700a38b27eefc which introduced but that's fine.
>>
> 
> If you prefer, you can add the reference as you have already applied.
> I am fine with that. Are you fine with 32-bit change ? I have posted
> single patch covering multiple platforms so that I can ask ARM SoC to
> pick it. If you can Ack it, I will ask them to pick directly.
> 

32bit version should go directly via arm-soc guys. I have sent you my
review. Also I have updated that commit message to match with sha1 above.

Thanks,
Michal
