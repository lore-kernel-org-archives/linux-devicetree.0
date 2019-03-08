From: c-hbandi@codeaurora.org
Subject: Re: [PATCH v1 0/2] Enable Bluetooth functionality for wcn3998.
Date: Fri, 08 Mar 2019 12:09:29 +0530
Message-ID: <316cc8c5a45a184efc2ac4e5b65b9182@codeaurora.org>
References: <1551961012-23898-1-git-send-email-c-hbandi@codeaurora.org>
 <20190307191840.GC138592@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190307191840.GC138592@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org, anubhavg@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-bluetooth-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Mathias,

On 2019-03-08 00:48, Matthias Kaehlcke wrote:
> + device tree folks
> 
> On Thu, Mar 07, 2019 at 05:46:50PM +0530, Harish Bandi wrote:
>> This patch series we add support for wcn3998 BT chip set. This new 
>> chipset
>> is based from the wcn3990 with minimal power numbers. So here in this 
>> patch
>> The major difference between wcn3990 and wcn3998 is only power 
>> numbers. where
>> as init process and fw download is same with wcn3990.So we are 
>> leveraging the
>> existing code of wcn3990 along with readiing the voltages from the dts 
>> file.
> 
> About how many different variants are we talking?
[Harish]  As of now we are seeing 2 more variants based on wcn3990
> 
> Couldn't you just use a different compatible string for each variant
> and specify the voltage/current limits in the hci_qca.c driver, as
> currently done for the WCN3990? I understand that it requires touching
> the driver for each new variant, but it might be preferable to specify
> these static values in a single location, instead of repeating them in
> the DT snippets of every device that uses such a controller, with the
> possiblity of configuration errors.
> 
[Harish] Insight of coming chip sets based on wcn3990, for now we
are adding new compatible in hci_qca.c driver itself with compatible
name as QCA_WCN3998.But in future if we have more variants based on same
chip set wcn3990. It may be good to have it in DTS.
For now we will provide the updated patch  with new compatible and
let's continue to discuss with DT folks for their view on these cases.

> The DT folks can probably provide guidance on what is typically done
> in cases like this.
> 
> Thanks
> 
> Matthias
