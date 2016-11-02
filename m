From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] soc: qcom: Add SoC info driver
Date: Wed, 2 Nov 2016 14:11:52 +0100
Message-ID: <201611021411.52803.arnd@arndb.de>
References: <1476972386-28655-1-git-send-email-kimran@codeaurora.org> <9172138.R1PTFlLtP9@wuerfel> <ee68877b-6837-1c35-b440-2a12bb4e1225@codeaurora.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <ee68877b-6837-1c35-b440-2a12bb4e1225@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Imran Khan <kimran@codeaurora.org>
Cc: andy.gross@linaro.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 02 November 2016, Imran Khan wrote:
> On 10/27/2016 7:11 PM, Arnd Bergmann wrote:
> > On Thursday, October 27, 2016 6:40:27 PM CEST Imran Khan wrote:
> >> On 10/26/2016 8:16 PM, Arnd Bergmann wrote:
> >>> On Wednesday, October 26, 2016 7:42:08 PM CEST Imran Khan wrote:
> >>
> >> Yes. Having a manufacturing process as part of foundry-id can provide a more
> >> thorough information.
> > 
> > Ok, sounds good. Let's do it like this. We can always add support for
> > in-kernel matching of this string if needed later.
> >
> 
> Thanks for the feedback. So how should I proceed now, should I 
> 
> i. send one patch first that adds the serial_number and foundry_id fields
> in generic soc_dev_attribute structure and then send my modified socinfo 
> driver as per new soc_dev_attribute structure
> 
> or 
> 
> ii. send both the changes as 2 separate patches of the same patch set.
> 
> or 
> 
> iii. Continue with the current soc_dev_attribute structure and modify
> the socinfo driver once soc_dev_attribute structure has serial_number
> and foundry_id fields.

It's not overly important, but I'd prefer the third approach, the advantage
being that we can review the driver and merge it independently of
any possible further discussion on the added attributes. Sending
this as a series of three patches (1. add the driver, 2. add the
infrastructure, 3. use the infrastructure in your driver) is probably
best.

	Arnd
