From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v2 0/3] ARM: sun8i: a83t: Support Camera Sensor Interface
 controller
Date: Wed, 29 May 2019 13:11:27 +0300
Message-ID: <20190529101127.oykszcj7q4ikji47@paasikivi.fi.intel.com>
References: <20190520150637.23557-1-megous@megous.com>
 <20190520151003.uklhhak5clxi5zpf@core.my.home>
 <CAGb2v64NDYo-yOvUQDpqzRB_A3NUgF3dXJeYbz_57uwB7mXwqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v64NDYo-yOvUQDpqzRB_A3NUgF3dXJeYbz_57uwB7mXwqQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Ondrej Jirman <megous@megous.com>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Yong Deng <yong.deng@magewell.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Chen-Yu,

On Tue, May 28, 2019 at 09:03:06PM +0800, Chen-Yu Tsai wrote:
> On Mon, May 20, 2019 at 11:10 PM Ondřej Jirman <megous@megous.com> wrote:
> >
> > On Mon, May 20, 2019 at 05:06:34PM +0200, verejna wrote:
> > > From: Ondrej Jirman <megous@megous.com>
> > >
> > > This is a re-send of Chen-Yu's A83T CSI patch series with review tags
> > > applied and removed address/size cells from csi_in port. Already applied
> > > patches from v1  were dropped.
> > >
> > > The series is ready to be merged:
> > >
> > >   Patch 1 and 2 via sunxi tree
> > >   Patch 3 via media tree
> >
> > Sorry, wrong numbers. 2 is for media tree, 3 is for sunxi, 1 is a dt-bindings
> > patch, where I'm not sure.
> 
> Bindings typically go with the driver.
> 
> Sakari, this series is and has been ready for some time since before the merge
> window. Could you please merge patches 1 and 2.

Don't wait, instead cc or ping me; that helps. :-)

The two patches are fine; I'll merge them.

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
