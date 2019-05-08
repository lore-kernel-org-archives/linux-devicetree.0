Return-Path: <SRS0=lh6v=TI=martin.sperl.org=kernel@kernel.org>
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH V7 RESEND 04/10] can: mcp25xxfd: Add Microchip mcp25xxfd CAN FD driver
From: kernel@martin.sperl.org
In-Reply-To: <9fe8a9bf-954e-e203-7b81-57b9460046fd@pengutronix.de>
Date: Wed, 8 May 2019 18:00:58 +0200
Content-Transfer-Encoding: 7bit
Message-Id: <B58CC1B6-5D74-4C6B-AECC-6AEAC17037AC@martin.sperl.org>
References: <20190419051432.13538-1-kernel@martin.sperl.org> <20190419051432.13538-5-kernel@martin.sperl.org> <9fe8a9bf-954e-e203-7b81-57b9460046fd@pengutronix.de>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: linux-can@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Wolfgang Grandegger <wg@grandegger.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hi Marc!

> On 08.05.2019, at 15:12, Marc Kleine-Budde <mkl@pengutronix.de> wrote:
>> static int mcp25xxfd_can_switch_mode_no_wait(struct mcp25xxfd_priv *priv,
>> 					     u32 *reg, int mode)
>> {
>> 	u32 dummy;
>> 	int ret;
>> 
>> 	/* get the current mode/register - if reg is NULL
>> 	 * when the can controller is not setup yet
>> 	 * typically by calling mcp25xxfd_can_sleep_mode
>> 	 * (this only happens during initialization phase)
>> 	 */
>> 	if (reg) {
>> 		if (!reg) {
> 
> This looks wrong.

should be:
>> 		if (!*reg) {

Fixed that - thanks!

Thanks,
	Martin 
