From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH 0/1] Add support for esdhc0 on Vybrid.
Date: Thu, 09 Jul 2015 08:13:38 +0200
Message-ID: <63570c082077002155d3a99567664ef3@agner.ch>
References: <1436388666-29376-1-git-send-email-cory.tusar@pid1solutions.com>
 <CAOpc7mEuDm=YS5TB6MN5PTtNy7yMiTXEetUoXdVC28ZEkf1Cvw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOpc7mEuDm=YS5TB6MN5PTtNy7yMiTXEetUoXdVC28ZEkf1Cvw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Holger Schurig <holgerschurig@gmail.com>, Cory Tusar <cory.tusar@pid1solutions.com>
Cc: shawnguo@kernel.org, Sascha Hauer <kernel@pengutronix.de>, mark.rutland@arm.com, devicetree@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, open list <linux-kernel@vger.kernel.org>, robh+dt@kernel.org, andrew@lunn.ch, galak@codeaurora.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 2015-07-09 08:07, Holger Schurig wrote:
>> Cory Tusar (1):
>>   ARM: dts: vfxxx: Include support for esdhc0 functionality.
>>
>>  arch/arm/boot/dts/vfxxx.dtsi | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> --
>> 2.3.6
> 
> Your patch looks empty.

This is a cover letter which provides overview over a whole patchset.
The patch is a separate reply message of this mail (PATCH 1/1). 

@Cory
However, it is unusual to use a cover letter when there is only a single
patch. If you want to add additional comments which should not be part
of the commit message, you can edit the patch and insert text after the
three dashes, just before the diffstat. This text won't be part of the
commit when applied later.

--
Stefan
