From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH RESEND] Documentation: devicetree: Fix Xilinx VDMA
 specification
Date: Wed, 12 Nov 2014 07:57:58 -0800
Message-ID: <6067bede14b9421fa87db96bdc66dc66@BN1AFFO11FD040.protection.gbl>
References: <1415800277-6817-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1415800277-6817-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Cc: Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2014-11-12 at 02:51PM +0100, Andreas F=C3=A4rber wrote:
> The specification requires xlnx,data-width, but example and driver us=
e
> xlnx,datawidth. Change the specification to match the implementation.

Isn't this the wrong way around? The bindings are considered API, so
shouldn't the driver be fixed to match the spec?
Are there already dts files out there using either of these options?

	Soren
