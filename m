From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH] ARM: zynq: Add OCM driver
Date: Tue, 11 Mar 2014 15:13:59 -0700
Message-ID: <e870cbc7-5934-4a14-aab4-416cdfd1627d@VA3EHSMHS007.ehs.local>
References: <299e37ab245da9132808c6d4265a17b9a417bf62.1389022555.git.michal.simek@xilinx.com>
 <CAOesGMiroyjPbcjfG24_sUqCicCD4M7NF2aD=Xi8NVgagZThuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMiroyjPbcjfG24_sUqCicCD4M7NF2aD=Xi8NVgagZThuA@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Michal Simek <michal.simek@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Michal Simek <monstr@monstr.eu>, Josh Cartwright <josh.cartwright@ni.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Rob Herring <robherring2@gmail.com>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2014-03-11 at 02:31PM -0700, Olof Johansson wrote:
> Hi Michal,
>=20
> Sorry for the late review, I didn't notice the driver when it was
> posted and I only saw it now with the pull request. Comments below.
>=20
>=20
> On Mon, Jan 6, 2014 at 7:36 AM, Michal Simek <michal.simek@xilinx.com=
> wrote:
> > The driver provide memory allocator which can
> > be used by others drivers to allocate memory inside OCM.
> > All location for 64kB blocks are supported
> > and driver is trying to allocate the largest continuous
> > block of memory.
>=20
> I don't think you explain what OCM is anywhere, what is it? Since
> you're reusing the generic SRAM driver I'm suspecting it's related?

It stands for 'On-Chip Memory'. For Zynq that is a RAM consisting of
four 64k chunks that can be individually mapped to a high or low addres=
s.

	S=C3=B6ren


