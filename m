From: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <vokac.m@gmail.com>
Subject: Re: [PATCH net-next v3 0/7] Add support for QCA8334 switch
Date: Thu, 24 May 2018 11:34:57 +0200
Message-ID: <f8bf325c-77a5-d44b-34c3-93ea4b11fd84@gmail.com>
References: <1527056424-14528-1-git-send-email-michal.vokac@ysoft.com>
 <29ea7cdd-5690-e39a-a2ef-4f48fbcb7659@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <29ea7cdd-5690-e39a-a2ef-4f48fbcb7659@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, andrew@lunn.ch
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, vivien.didelot@savoirfairelinux.com, mark.rutland@arm.com, robh+dt@kernel.org, davem@davemloft.net, michal.vokac@ysoft.com
List-Id: devicetree@vger.kernel.org

On 23.5.2018 17:39, Florian Fainelli wrote:
> 
> 
> On 05/22/2018 11:20 PM, Michal Vokáč wrote:
>> This series basically adds support for a QCA8334 ethernet switch to the
>> qca8k driver. It is a four-port variant of the already supported seven
>> port QCA8337. Register map is the same for the whole familly and all chips
>> have the same device ID.
>>
>> Major part of this series enhances the CPU port setting. Currently the CPU
>> port is not set to any sensible defaults compatible with the xGMII
>> interface. This series forces the CPU port to its maximum bandwidth and
>> also allows to adjust the new defaults using fixed-link device tree
>> sub-node.
>>
>> Alongside these changes I fixed two checkpatch warnings regarding SPDX and
>> redundant parentheses.
> 
> Looks great, thanks Michal! Do you have any features or things you are
> working on that would be added later to the driver?

Thank you too Florian. And also big thank to you Andrew. You helped me
a lot to debug the RGMII issue. I have been stuck at that for more than
a month and would not resolve it without your help.

As I have done this in a process of upgrading our BSP to a more recent
kernel, and hopefully mainline, I now need to move on to other parts of
the board. So unfortunately no, I do not have any other enhancements
planned to this driver for now. But as we are probably one of the few
with access to the NDA covered Qualcomm documentation I see a great
opportunity to work on that later. I am afraid "later" means something
like next year in this case as I am basically the only kernel developer
in our company and not yet very experienced.

Thank you all for your time,
Michal
