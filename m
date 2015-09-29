From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] ARM: shmobile: r8a7794: link PCI USB devices to USB PHY
Date: Tue, 29 Sep 2015 15:52:39 +0300
Message-ID: <560A8997.8090301@cogentembedded.com>
References: <10927620.1TFu7PRvi4@wasted.cogentembedded.com>
 <20150929003751.GB20067@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <20150929003751.GB20067@verge.net.au>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: linux-sh@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

On 9/29/2015 3:37 AM, Simon Horman wrote:

>> Describe the PCI USB devices that are behind the PCI bridges, adding necessary
>> links to the USB PHY device.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>> This patch is against 'renesas-devel-20150911v2-v4.2' tag of Simon Horman's
>> 'renesas.git' repo plus the R8A7794/SILK PCI USB and USB PHY support patches
>> just posted.

> Does this series have any dependencies (e.g. bindings) other

    This patch, you mean?

> than the aforementioned R8A7794/SILK PCI USB and USB PHY support patches?

    No.

MBR, Sergei

