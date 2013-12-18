From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5] clk: si570: Add a driver for SI570 oscillators
Date: Tue, 17 Dec 2013 16:04:48 -0800
Message-ID: <20131218000448.GA9857@roeck-us.net>
References: <1379806839-13762-1-git-send-email-soren.brinkmann@xilinx.com>
 <b625092b-682c-4072-85a6-9f9d7f378ec0@VA3EHSMHS043.ehs.local>
 <20131002231751.4343.81234@quantum>
 <52AC8857.8070504@roeck-us.net>
 <20131217234340.23538.9631@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131217234340.23538.9631@quantum>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Hyun Kwon <hyunk@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 17, 2013 at 03:43:40PM -0800, Mike Turquette wrote:
> Quoting Guenter Roeck (2013-12-14 08:33:27)
> > On 10/02/2013 04:17 PM, Mike Turquette wrote:
> > > Quoting S=F6ren Brinkmann (2013-10-02 10:20:38)
> > >> Hi Mike,
> > >>
> > >> could you please comment on this/apply it to clk-next?
> > >
> > > It looks good and is in the queue. Will show up in clk-next in a =
few
> > > days.
> > >
> > Hi Mike,
> >=20
> > trying again ... what happened with this driver ? Any reason for no=
t pushing it after all ?
>=20
> This got reverted with several other patches right before 3.12 droppe=
d.
> Unfortunately clk-next broke linux-next two days before 3.12 came out
> and I had to revert to a known good state, excluding this driver.
>=20
> I've added it back to clk-next now towards 3.13. Sorry for the
> inconvenience.
>=20
No problem. Thanks a lot for the update.

Guenter
