From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v3] ARM: zynq: DT: Use the zynq binding with macb
Date: Wed, 27 May 2015 13:52:38 -0700
Message-ID: <20150527205238.GJ31081@xsjsorenbubuntu>
References: <1432756801-6896-1-git-send-email-nathan.sullivan@ni.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1432756801-6896-1-git-send-email-nathan.sullivan@ni.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nathan Sullivan <nathan.sullivan@ni.com>
Cc: michal.simek@xilinx.com, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 2015-05-27 at 03:00PM -0500, Nathan Sullivan wrote:
> Use the new zynq binding for macb ethernet, since it will disable hal=
f
> duplex gigabit like the Zynq TRM says to do. Also allow the compatibl=
e
> cadence gem binding that won't disable half duplex but works otherwis=
e.
>=20
> Signed-off-by: Nathan Sullivan <nathan.sullivan@ni.com>

Assuming that the corresponding patch(es) for the driver and DT docs
went through:
Acked-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>

> ---

=46or future reference, please include a changelog here documenting wha=
t
changes between patch iterations.

	Thanks,
	S=C3=B6ren
