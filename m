From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [RFC LINUX PATCH] dt: xilinx: xadc: provision to control clock
 frequency
Date: Wed, 23 Dec 2015 03:49:08 -0800
Message-ID: <20151223114908.GG6491@xsjsorenbubuntu>
References: <1450866505-22069-1-git-send-email-ranjit.waghmode@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1450866505-22069-1-git-send-email-ranjit.waghmode@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ranjit Waghmode <ranjit.waghmode@xilinx.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, corbet@lwn.net, lars@metafoo.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, punnaia@xilinx.com, anirudh@xilinx.com
List-Id: devicetree@vger.kernel.org

On Wed, 2015-12-23 at 03:58PM +0530, Ranjit Waghmode wrote:
> This patch adds parameter to the xilinx-xadc node for controlling
> clock frequency.
>=20
> Following are the possible options for user to control the frequency:
> 	* 00 : 1/2 of clock frequency
> 	* 01 : 1/4 of clock frequency
> 	* 10 : 1/8 of clock frequency
> 	* 11 : 1/16 of clock frequency

How is this chosen? Are these just arbitrary values that you need for
some use-case? Or are these the options HW allows?

>=20
> So this patch adds parameter tck-rate to set user defined values from
> above pool to control the clock frequency.

This is no longer describing HW, but configuring driver/HW. Why does
this have to be in DT? Why can't the driver request/set the frequency a=
s
operation requires it?

	Thanks,
	S=C3=B6ren
