From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v4 4/5] regulator: tps65912: Add regulator driver for the
 TPS65912 PMIC
Date: Fri, 6 Nov 2015 12:10:45 -0600
Message-ID: <563CED25.6020405@ti.com>
References: <1443731874-21362-1-git-send-email-afd@ti.com>
 <1443731874-21362-5-git-send-email-afd@ti.com>
 <20151022164724.GZ8232@sirena.org.uk> <563A25BE.90609@ti.com>
 <20151105101417.GM1717@sirena.org.uk> <563B9A10.4020907@ti.com>
 <20151106104322.GA18409@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151106104322.GA18409@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/06/2015 04:43 AM, Mark Brown wrote:
> On Thu, Nov 05, 2015 at 12:04:00PM -0600, Andrew F. Davis wrote:
>> On 11/05/2015 04:14 AM, Mark Brown wrote:
>
>>> That sounds like a bug to me, it'll have broken a bunch of existing
>>> devices.
>
>> Most OF drivers have the OF MODALIAS.
>
> That's nice but not relevant to non-OF devices.
>
>> 'platform_uevent' can only emit one MODALIAS string per device (only
>> the last emitted one seems to count), so for any device with
>> 'dev->of_node' set it will be the OF MODALIAS string. So I need
>> that table (to generate the OF MODALIAS) or this sub-device module
>> will not be loaded.
>
> No, you need to fix the bug that is causing dev->of_node to be populated
> for the MFD function device.  Probably the issue is that you have put
> this pointless compatible string in your DT.
>

If it is pointless what is the reason we have .of_compatible in mfd_cell?
How else do you want us to populate the sub-device dev->of_node? Looking
at other DT regulators a lot *do( just use an OF table, others use their
parent's dev to get of_node, why all the push back on having an OF match
table? Probe gets called with the pdev filled with its of_node to begin with.

> Please stop this.  I don't understand why you are pushing so hard to put
> the Linux device model representation of the device into DT but it's
> getting very repetitive.
>

I'm not pushing anything, this is how other sub-nodes of MFD devices are
represented, I'm not sure what you think I'm doing that is so wrong here.
No one else seems to have an issue with the DT for this device, I see no
reason the regulator node has to be different than the other sub-device
nodes.

It looks rather out of place to have regulators be singled out like this,
for instance look at the mfd_cells for drivers/mfd/rt5033.c
